package com.compile.compiletest.controller.api;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.service.TrainingService;
import com.compile.compiletest.vo.UserVo;

@RestController("CodeTreeController")
@RequestMapping("/api/codetree")
public class CodeTreeController {
	@Autowired
	private TrainingService trainingService;

	UserVo _authUser = null;
	
	@GetMapping("")
	public JsonResult codetree(HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		_authUser = authUser;
		map.put("authUser", authUser);
		return JsonResult.success(map);
	}	
	
	@PostMapping("/{userEmail}")
	public JsonResult codetree2(@PathVariable("userEmail") String userEmail) {
		
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
		
		
		
		System.out.println("!!!!");
		map.put("result", "ok");

		System.out.println("userEmail>>"+userEmail);
		
		return JsonResult.success(map);
	}
}
