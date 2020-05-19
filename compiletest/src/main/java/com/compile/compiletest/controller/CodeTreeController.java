package com.compile.compiletest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/codetree")
public class CodeTreeController {
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String mypage() {
		return "codetree/codetree";
	}
}