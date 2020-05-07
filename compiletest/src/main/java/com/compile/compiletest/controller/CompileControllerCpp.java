package com.compile.compiletest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.compile.compiletest.Run.RunCpp;
import com.compile.compiletest.dto.JsonResult;

////////////

@Controller
@RequestMapping("/compile")
public class CompileControllerCpp {
	@ResponseBody
	@PostMapping("/cpp")
	public JsonResult compileC(@RequestParam String code) {
		RunCpp rtt = new RunCpp();

		String result = rtt.execCommand();
		
		String errorResult = rtt.errorResult();
		
		
		String[] res = new String[2];
		res[0] = result;
		res[1] = errorResult;
		System.out.println("errorResult = " + errorResult);
		
		return JsonResult.success(res);
	}
	
	@ResponseBody
	@PostMapping("/cpp/save")
	public JsonResult compileSaveC(@RequestParam String code) {
		RunCpp rtt = new RunCpp();
		
		StringBuffer buffer = new StringBuffer();
		String[] token = code.split("\n");
		
		for(int i = 0; i < token.length; i++) {
			buffer.append(token[i] + "\n");
		}
		String command = rtt.inputSource(buffer.toString());
		String result = rtt.execSave(command);
		
		return JsonResult.success(result);
	}
}
