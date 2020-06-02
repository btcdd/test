package com.compile.compiletest.controller.api;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.service.TrainingService;
import com.compile.compiletest.vo.UserVo;

@RestController("CodeTreeController")
@RequestMapping("/api/codetree")
public class CodeTreeController {
	@Autowired
	private TrainingService trainingService;

	
	@GetMapping("")
	public JsonResult codetree(HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		map.put("authUser", authUser);
		return JsonResult.success(map);
	}	
	

	@PostMapping("/{userEmail}")
	public JsonResult codetree2(@PathVariable("userEmail") String userEmail) {
		
		Map<String, Object> map = new HashMap<>();
		
		boolean exist = trainingService.existUser(userEmail); //유저가 있는지 체크
		if(!exist || userEmail=="undifiend") {
			System.out.println("유저가 존재하지 않는다!!!");
			
			map.put("result", "wrongAccess");
			return JsonResult.success(map); //redirect 홈으로(리액트에서)
		}
		
		//1.만약에 userEmail에 회원가입이 되어있지 않는 사용자일 경우 처리
		//2.userEmail이 즐겨찾기 한 문제 리스트들이 쭉 뜰수 있는 정보가 필요
		//3.문제 리스트 중 하나를 클릭하면 해당하는 패키지 상세가 뜰 수 있도록 하는 세부 문제 정보가 필요
		
		
		System.out.println("!!!!");
		map.put("result", "ok");

		System.out.println("userEmail>>"+userEmail);
		  
		
		
		return JsonResult.success(map);
	}
}
