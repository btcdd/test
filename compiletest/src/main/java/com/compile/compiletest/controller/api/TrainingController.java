package com.compile.compiletest.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.linux.TrainingLinux;
import com.compile.compiletest.service.TrainingService;
import com.compile.compiletest.vo.CodeVo;
import com.compile.compiletest.vo.ProblemVo;
import com.compile.compiletest.vo.SavePathVo;
import com.compile.compiletest.vo.SubProblemVo;
import com.compile.compiletest.vo.UserVo;


@RestController("TrainingController")
@RequestMapping("/api/training")
public class TrainingController {
	
	@Autowired
	private TrainingService trainingService;
	
	private Long authUserNo = null;
	
	@PostMapping(value="/list")
	public JsonResult originProblemList(String page, String kwd, String category, String[] checkValues) {
		
		int p = Integer.parseInt(page);
		Map<String,Object> map = trainingService.getContentsList(p, kwd, category, checkValues);
		
		return JsonResult.success(map);
	}
  
	
	@PostMapping("/mylist")
	   public JsonResult mylist(Long no) {
	      
	      ProblemVo problemVo = trainingService.selectProblemOne(no);
	      List<SubProblemVo> list = trainingService.selectSubProblem(no);
	      
	      Map<String, Object> map = new HashMap<>();
	      
	      map.put("problemVo", problemVo);
	      map.put("list", list);
	      map.put("listSize", list.size());
	      map.put("problemNo", no);
	      
	      
	      
	      return JsonResult.success(map);
	   }
	
	@PostMapping({"/mylist/{problemNo}","/mylist/{userEmail}/{problemNo}"})
   public JsonResult mylist(
         @PathVariable("userEmail") Optional<String> userEmail,
         @PathVariable("problemNo") Long problemNo,
         HttpSession session) {
      
      Map<String, Object> map = new HashMap<>();
      
      UserVo authUser = null;
      ProblemVo problemVo = null;
      List<SubProblemVo> list = null;
      
      if(userEmail.isPresent()) {
         problemVo = trainingService.selectProblemOne(problemNo);
         list = trainingService.selectSubProblem(problemNo);
         
         System.out.println("email을 가져온 경로  problemVo>>"+problemVo);
         
         map.put("problemVo", problemVo);
         map.put("list", list);
         map.put("authUser", authUser);
         
         System.out.println("email을 가져온 경로"); 
         
         /////////////////////////////////////////
         // 관우 유진 코드~~~
         // 유저의 회원번호, 저장한 문제모음번호 가져오기
         Long saveNo = trainingService.selectSaveNo(authUserNo, problemVo.getNo());
         
         List<SavePathVo> savePathVoList = trainingService.selectSavePath(saveNo);
         Long[] savePathNoArray = new Long[savePathVoList.size()];
         for(int i = 0; i < savePathVoList.size(); i++) {
        	 savePathNoArray[i] = savePathVoList.get(i).getNo();
         }
         List<CodeVo> codeVoList = trainingService.selectCode(savePathNoArray);
         ///////////////////////////////
         
      }else {
         authUser = (UserVo)session.getAttribute("authUser");
         authUserNo = authUser.getNo();
         problemVo = trainingService.selectProblemOne(problemNo);
         list = trainingService.selectSubProblem(problemNo);
         
         System.out.println("problemNo을 가져온 경로  problemVo>>"+problemVo);
         
         map.put("problemVo", problemVo);
         map.put("list", list);
         map.put("authUser", authUser);
         
         System.out.println("problemNo만 있을 때");
         
         return JsonResult.success(map);         
      }
      return JsonResult.success(map);
   }
	
	@PostMapping("/auth/{userEmail}/{problemNo}")
	public JsonResult auth(
	      @PathVariable("userEmail") String userEmail,
	      @PathVariable("problemNo") Long problemNo,
	      @RequestBody Map<String,Object> user) {
	   
	   Map<String, Object> map = new HashMap<>();
	   
	   JSONParser parser = new JSONParser();
	   JSONObject obj = null;
	   
	   try {
	      obj = (JSONObject)parser.parse((String) user.get("body"));
	   } catch (ParseException e) {
	      e.printStackTrace();
	   }      
	   System.out.println("obj>>>"+obj);
	   String userName = (String) obj.get("name");
	   String userBirth = (String) obj.get("birth");
	   if(userBirth.equals("") || userName.equals("")) {
	      map.put("result", "empty");
	      return JsonResult.success(map);
	   }
	   String tempKey = (String) obj.get("tempKey");      
	   
	   boolean exist = trainingService.existUser(userEmail); //유저가 있는지 체크
	   ProblemVo problemVo = trainingService.selectProblemOne(problemNo);
	   
	   if(problemVo == null) {
		   System.out.println("http://localhost:9999/?userEmail=2sang@gmail.com&problemNo=123123134 처럼 직접 경로타고 번호 아무렇게나 쓰고 올경우" );
		   map.put("result", "no");
		   return JsonResult.success(map);
	   }
	   
	   if( exist && problemVo.getPassword().equals(tempKey) && problemVo.getState().equals("n") ) {
	      map.put("result","delete");
	      return JsonResult.success(map);         
	   }else if( exist && problemVo.getPassword().equals(tempKey) ) {
	      trainingService.insertUserInfo(userName,userBirth,userEmail);
	      map.put("result", "ok");      
	      return JsonResult.success(map);         
	   }
	   map.put("result", "no");
	   return JsonResult.success(map);
	
	}
	
	@PostMapping("/answerlist")
	public JsonResult answerList(String page, String language, String subProblemNo) {
		
		int p = Integer.parseInt(page);
		Map<String, Object> map = trainingService.selectAnswerUserList(p, Long.parseLong(subProblemNo), language);
		
		return JsonResult.success(map);
	}
	
	@PostMapping("/save/problem")
	public JsonResult saveProblem(Long problemNo, HttpSession session,
								Long[] array) {
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		
		trainingService.insertSaveProblemNo(authUser.getNo(), problemNo);
		Long saveNo = trainingService.findSaveNo(problemNo);
		
		trainingService.insertSavePath(array, saveNo, authUser.getNo(), problemNo);
		
		TrainingLinux trainingLinux = new TrainingLinux();
		trainingLinux.saveProblemAndSubProblem(authUser.getNo(), problemNo, array);
		
		return JsonResult.success(null);
	}
}

	
