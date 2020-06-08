package com.compile.compiletest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.runlanguage.RunJava;

@Controller
@RequestMapping("/compile")
public class CompileControllerJava {
	
	StringBuffer buffer = new StringBuffer();

	RunJava rtt = new RunJava();
	
	@ResponseBody
	@PostMapping("/java")
	public JsonResult javaCompile(@RequestParam String code) {
		rtt.createFileAsSource(code);
		
		RunJava rtt = new RunJava();

		rtt.execCompile();
		String result = rtt.execCommand();
		String errorResult = rtt.execCompile();
		
		String[] res = new String[2];
		res[0] = result;
		res[1] = errorResult;
		
		return JsonResult.success(res);
	}

}