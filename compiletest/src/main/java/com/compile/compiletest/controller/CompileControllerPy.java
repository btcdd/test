package com.compile.compiletest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.compile.compiletest.Run.RunPy;
import com.compile.compiletest.dto.JsonResult;

@Controller
@RequestMapping("/compile")
public class CompileControllerPy {
	
	StringBuffer buffer = new StringBuffer();

	RunPy rtt = new RunPy();
	
	@ResponseBody
	@PostMapping("/py")
	public JsonResult javaCompile(@RequestParam String code) {
		RunPy rtt = new RunPy();
		
		String result = rtt.execCommand();
		String errorResult = rtt.execCompile();
		
		String[] res = new String[2];
		res[0] = result;
		res[1] = errorResult;
		
		return JsonResult.success(res);
	}
	
	@ResponseBody
	@PostMapping("/py/save")
	public JsonResult javaCompileSave(@RequestParam String code) {
		
		String[] token = code.split("\n");
		
//		buffer.append("# -*- coding: euc-kr -*-\n\n");
		for(int i = 0; i < token.length; i++) {
			buffer.append(token[i]);
		}
		rtt.createFileAsSource(code);
		
		String test = "success";
		
		return JsonResult.success(test);
	}
	
	@ResponseBody
	@PostMapping("/py/compile")
	public JsonResult cppCompileexam() {

		RunPy rtt = new RunPy();

		String result = rtt.execCompile();

		return JsonResult.success(result);
	}
}