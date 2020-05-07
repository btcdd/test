package com.compile.compiletest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.compile.compiletest.Run.RunJava;
import com.compile.compiletest.dto.JsonResult;

@Controller
@RequestMapping("/compile")
public class CompileControllerJava {
	
	StringBuffer buffer = new StringBuffer();
	
	@ResponseBody
	@PostMapping("/java")
	public JsonResult javaCompile() {
		RunJava rtt = new RunJava();
		
		String result = rtt.execCommand();
		String errorResult = rtt.errorResult();
		
		String[] res = new String[2];
		res[0] = result;
		res[1] = errorResult;
		
		return JsonResult.success(res);
	}
	
	@ResponseBody
	@PostMapping("/java/save")
	public JsonResult javaCompileSave(@RequestParam String code) {
		RunJava rtt = new RunJava();
		
		String[] token = code.split("\n");
		
		for(int i = 0; i < token.length; i++) {
			buffer.append(token[i]);
		}
//		String command = rtt.inputSource(buffer.toString());
//		String result = rtt.execSave(command);
		
		rtt.createFileAsSource(code);
		String test = "success";
		return JsonResult.success(test);
	}
	
	@ResponseBody
	@PostMapping("/java/compile")
	public JsonResult javaCompileexam() {
		RunJava rtt = new RunJava();
		
//		String result = rtt.inputSource();
		String result = rtt.execCompile();
		return JsonResult.success(result);
	}

}