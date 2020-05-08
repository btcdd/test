package com.compile.compiletest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mypage")
public class MypageController {
		
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage() {
		return "mypage/mypage";
	}
	
	@RequestMapping(value="/account", method=RequestMethod.GET)
	public String account() {
		return "mypage/account";
	}
	
	@RequestMapping(value="/problem", method=RequestMethod.GET)
	public String problem() {
		return "mypage/problem";
	}
}