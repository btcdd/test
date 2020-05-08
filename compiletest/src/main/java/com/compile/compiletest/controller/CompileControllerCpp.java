package com.compile.compiletest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.run.RunCpp;

@Controller
@RequestMapping("/compile")
public class CompileControllerCpp {
	
	StringBuffer buffer = new StringBuffer();

	RunCpp rtt = new RunCpp();
	
	@ResponseBody
	@PostMapping("/cpp")
	public JsonResult compileCpp(@RequestParam String code) {
		RunCpp rtt = new RunCpp();

		String result = rtt.execCommand();
		String errorResult = rtt.execCompile();
		
		String[] res = new String[2];
		res[0] = result;
		res[1] = errorResult;
		
		return JsonResult.success(res);
	}
	
	@ResponseBody
	@PostMapping("/cpp/save")
	public JsonResult compileSaveCpp(@RequestParam String code) {
		
		String[] token = code.split("\n");
		
		for(int i = 0; i < token.length; i++) {
			buffer.append(token[i] + "\n");
		}
		rtt.createFileAsSource(code);
		
		String test = "success";
		
		return JsonResult.success(test);
	}
	
	@ResponseBody
	@PostMapping("/cpp/compile")
	public JsonResult cppCompileexam() {

		RunCpp rtt = new RunCpp();

		String result = rtt.execCompile();

		return JsonResult.success(result);
	}
}
