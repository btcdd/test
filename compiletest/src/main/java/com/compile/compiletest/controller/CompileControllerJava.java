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
	public JsonResult javaCompile() {
		
		RunJava rtt = new RunJava();
		

		System.out.println("왜 안나3333333와");
		
		String result = rtt.execCommand();
//		String errorResult = rtt.errorResult();
		String errorResult = rtt.execCompile();
		
		String[] res = new String[2];
		res[0] = result;
		res[1] = errorResult;

		System.out.println("res[0]:" + res[0] + "\nres[1]" + res[1]);
		
		return JsonResult.success(res);
	}
	
	@ResponseBody
	@PostMapping("/java/save")
	public JsonResult javaCompileSave(@RequestParam String code) {
		
		String[] token = code.split("\n");
		
		System.out.println("왜 안나와");
		
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


		System.out.println("왜 안나와2");
		RunJava rtt = new RunJava();

//		String result = rtt.inputSource();
		String result = rtt.execCompile();

		return JsonResult.success(result);
	}

}