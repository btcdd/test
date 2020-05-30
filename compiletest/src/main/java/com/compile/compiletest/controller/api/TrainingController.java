package com.compile.compiletest.controller.api;


import java.sql.Date;
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
import com.compile.compiletest.service.TrainingService;
import com.compile.compiletest.vo.ProblemVo;
import com.compile.compiletest.vo.SubProblemVo;
import com.compile.compiletest.vo.UserVo;


@RestController("TrainingController")
@RequestMapping("/api/training")
public class TrainingController {
	
	@Autowired
	private TrainingService trainingService;
	
	@PostMapping(value="/list")
	public JsonResult originProblemList(String page, String kwd, String category, String[] checkValues) {
		
		int p = Integer.parseInt(page);
		Map<String,Object> map = trainingService.getContentsList(p, kwd, category, checkValues);
		
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
			map.put("problemVo", problemVo);
			map.put("list", list);
			map.put("authUser", authUser);
			System.out.println("email을 가져온 경로");			
		}else {
			authUser = (UserVo)session.getAttribute("authUser");
			problemVo = trainingService.selectProblemOne(problemNo);
			list = trainingService.selectSubProblem(problemNo);
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
		String userName = (String) obj.get("name");
		String userBirth = (String) obj.get("birth");
		if(userBirth.equals("") || userName.equals("")) {
			map.put("result", "empty");
			return JsonResult.success(map);
		}
		String tempKey = (String) obj.get("tempKey");		
		
		boolean exist = trainingService.existUser(userEmail); //유저가 있는지 체크
		ProblemVo problemVo = trainingService.selectProblemOne(problemNo);

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
	
}

	
