package com.compile.compiletest.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.service.MypageService;

@RestController("MypageController")
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private MypageService mypageService;
	
	@PostMapping(value="/account/nickname")
	public JsonResult changeNickname(@RequestParam String nickname) {
		int result = mypageService.changeNickname(nickname);
		
		return JsonResult.success(result);
	}
	
	@PostMapping(value="/account/password")
	public JsonResult changePassword(@RequestParam String password) {
		int result = mypageService.changePassword(password);
		
		return JsonResult.success(result);
	}
	 
	@PostMapping(value="/account/delete")
	public JsonResult deleteUser(@RequestParam String password) {
		int result = mypageService.deleteUser(password);
		
		return JsonResult.success(result);
	}
	
	@DeleteMapping(value="/problem/delete/{no}")
	public JsonResult deleteProblem(@PathVariable("no") Long no) {
		int result = mypageService.deleteProblem(no);
		
		return JsonResult.success(result);
	}
}