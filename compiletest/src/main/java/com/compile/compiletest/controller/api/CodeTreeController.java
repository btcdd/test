package com.compile.compiletest.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.service.CodeTreeService;
import com.compile.compiletest.service.TestService;
import com.compile.compiletest.service.TrainingService;
import com.compile.compiletest.vo.CodeVo;
import com.compile.compiletest.vo.SavePathVo;
import com.compile.compiletest.vo.SaveVo;
import com.compile.compiletest.vo.UserVo;

@RestController("CodeTreeController")
@RequestMapping("/api/codetree")
public class CodeTreeController {
	@Autowired
	private TrainingService trainingService;
	
	@Autowired 
	private CodeTreeService codetreeService;
	
	@Autowired 
	private TestService testService;
	
	UserVo _authUser = null;
	
	@GetMapping("")// main-header에서 처음 열때
	public JsonResult codeTree(HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		_authUser = authUser;
		map.put("authUser", authUser);
		return JsonResult.success(map);
	}	
	
	@PostMapping("/auth/{userEmail}") //리액트에서 CodeTreeErrorPage와 통신하는 위치
	public JsonResult codeTreeAccess(@PathVariable("userEmail") String userEmail) {
		
		Map<String, Object> map = new HashMap<>();
		
		boolean exist = trainingService.existUser(userEmail); //유저가 있는지 체크
		if(!exist || userEmail=="undifiend") {
			System.out.println("유저가 존재하지 않는다!!!");
			map.put("result", "emptyUser");
			return JsonResult.success(map);
		}
		System.out.println("_authUser>>>>"+_authUser);
		if(_authUser == null) {
			System.out.println("잘못된 접근 경로 !!!");
			map.put("result", "wrongAccess");
			return JsonResult.success(map);
		}
		System.out.println("정상 경로 !!!");
		map.put("result", "ok");
		
		return JsonResult.success(map);
	}
	
	@PostMapping("/list/{userEmail}") //code tree Home화면 띄울때 경로(리스트출력위해 필요)
	public JsonResult codeTreeList(@PathVariable("userEmail") String userEmail) {
		Map<String, Object> map = new HashMap<>();
		
		List<SaveVo> saveVoList = trainingService.selectSaveNoList(_authUser.getNo());



		map.put("saveVoList", saveVoList);
		return JsonResult.success(map);
	}

	@PostMapping("/list/{userEmail}/{saveNo}") //패키지안의 파일을 클릭했을때 오는 경로
	public JsonResult codeFile(
			@PathVariable("userEmail") String userEmail
			,@PathVariable("saveNo") Long saveNo) {
		System.out.println("userEmail>>"+userEmail);
		System.out.println("saveNo>>"+saveNo);
		
		Map<String, Object> map = new HashMap<>();
		
		List<SavePathVo> savePathVoList = trainingService.selectSavePath(saveNo);
		Long[] savePathNoArray = new Long[savePathVoList.size()];
		for(int i = 0; i < savePathVoList.size(); i++) {
		savePathNoArray[i] = savePathVoList.get(i).getNo();
		}
		List<CodeVo> codeVoList = trainingService.selectCode(savePathNoArray);
		map.put("savePathVoList",savePathVoList);
		map.put("codeVoList",codeVoList);		
		
		return JsonResult.success(map);
	}
	
	@PostMapping("/list/save/{userEmail}/{problemNo}")//저장 버튼 누를때 오는 경로
	public JsonResult codeSave(
			@PathVariable("userEmail") String userEmail,
			@PathVariable("problemNo") Long problemNo,
			@RequestBody Map<String, Object> saveDB) {
		System.out.println("userEmail>>"+userEmail);
		System.out.println("problemNo>>"+problemNo);
		System.out.println("codeSave  왔다!!");
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse((String) saveDB.get("body"));
		} catch (ParseException e) {
			e.printStackTrace();
		}		
		
		String code = (String) obj.get("code");
		String language = (String) obj.get("language");
		List<SavePathVo> savePathVoList = (List<SavePathVo>) obj.get("savePathVoList");
		List<CodeVo> codeVoList = (List<CodeVo>) obj.get("codeVoList");
		System.out.println("code>>>"+code);
		System.out.println("language>>>"+language);
		System.out.println("savePathVoList>>>"+savePathVoList);
		System.out.println("codeVoList>>>"+codeVoList);
		
		//////////////////////////////////
		// 관우 유진 코드
		
		UserVo authUser = testService.findUserByEmail(userEmail);
		
		Map<String, Object> map = codetreeService.saveUserCodeAndProblems(authUser.getNo(), problemNo, savePathVoList, codeVoList);
		
		
		// 컴파일 부분
		//////////////////////////////
		
		System.out.println("출력!");
		
		SavePathVo savePathVo = savePathVoList.get(0);
		List<CodeVo> codeVoListTrue = null;
		codeVoListTrue.add(codeVoList.get(0));
		codeVoListTrue.add(codeVoList.get(1));
		codeVoListTrue.add(codeVoList.get(2));
		
		
		codetreeService.compilePackage(authUser.getNo(), problemNo, savePathVo, codeVoListTrue);
		
		
		///////////////////////
		
		////////////////////////////////////
		
		
		return JsonResult.success(null); 
	}

	//////////////////////////
	// 관우 유진
	// 임시로 컴파일 컨트롤러 만듬
	@PostMapping("/compile")//저장 버튼 누를때 오는 경로
	public JsonResult compile() {
		
		return JsonResult.success(null); 
	}
	
}
