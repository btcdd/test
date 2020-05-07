package com.compile.compiletest.controller;

import java.io.ByteArrayOutputStream;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import org.python.core.PySystemState;
import org.python.util.PythonInterpreter;
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
	
	@ResponseBody
	@PostMapping("/py")
	public JsonResult javaCompile(@RequestParam String code) {
		RunPy rtt = new RunPy();
		
		String result = rtt.execCommand();
		String errorResult = rtt.errorResult();
		
		String[] res = new String[2];
		res[0] = result;
		res[1] = errorResult;
		
		return JsonResult.success(res);
	}
	
	@ResponseBody
	@PostMapping("/py/save")
	public JsonResult javaCompileSave(@RequestParam String code) {
		RunPy rtt = new RunPy();
		
		StringBuffer buffer = new StringBuffer();
		String[] token = code.split("\n");
		
		buffer.append("# -*- coding: euc-kr -*-\n\n");
		for(int i = 0; i < token.length; i++) {
			buffer.append(token[i]);
		}
		String command = rtt.inputSource(buffer.toString());
		String result = rtt.execSave(command);
		
		return JsonResult.success(result);
	}
	
}