package com.compile.compiletest.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.compile.compiletest.dto.JsonResult;

@Controller
public class MainController {
	
	@RequestMapping({"", "/main"})
	public String index(Model model) {
		return "main";
	}
	
	@ResponseBody
	@PostMapping("/compile")
	public JsonResult compile(@RequestParam String code) {
		RunTimeTest rtt = new RunTimeTest();
		
		System.out.println(code);
		
		StringBuffer buffer = new StringBuffer();
		String[] token = code.split("\n");
		
		for(int i = 0; i < token.length; i++) {
			buffer.append(token[i]);
		}
		String command = rtt.inputSource(buffer.toString());
		String result = rtt.execCommand(command);
		
		System.out.println(result);
		
		return JsonResult.success(result);
	}
	
	
	
	
}