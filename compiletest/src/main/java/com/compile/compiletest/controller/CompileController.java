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

import com.compile.compiletest.dto.JsonResult;

@Controller
@RequestMapping("/compile")
public class CompileController {
	
	PythonInterpreter pythonInterpreter = new PythonInterpreter(null, new PySystemState());
	
	ScriptEngineManager scriptEngineMgr = new ScriptEngineManager();
	ScriptEngine jsEngine = scriptEngineMgr.getEngineByName("JavaScript");
	
	@ResponseBody
	@PostMapping("/java")
	public JsonResult javaCompile(@RequestParam String code) {
		RunTimeTest rtt = new RunTimeTest();
		
//		StringBuffer buffer = new StringBuffer();
//		String[] token = code.split("\n");
//		
//		for(int i = 0; i < token.length; i++) {
//			buffer.append(token[i]);
//		}
//		String command = rtt.inputSource(buffer.toString());
		
		String result = rtt.execCommand();
		
		return JsonResult.success(result);
	}
	
	@ResponseBody
	@PostMapping("/java/save")
	public JsonResult javaCompileSave(@RequestParam String code) {
		RunTimeTest rtt = new RunTimeTest();
		
		StringBuffer buffer = new StringBuffer();
		String[] token = code.split("\n");
		
		for(int i = 0; i < token.length; i++) {
			buffer.append(token[i]);
		}
		String command = rtt.inputSource(buffer.toString());
		String result = rtt.execSave(command);
		String errorResult = rtt.errorResult();
		
		String[] res = new String[2];
		res[0] = result;
		res[1] = errorResult;
		
		System.out.println("result = " + result);
		System.out.println("errorResult = " + errorResult + "---");
		
		return JsonResult.success(res);
	}
	
	@ResponseBody
	@PostMapping("/py")
	public JsonResult pythonCompile(@RequestParam String code) {

		ByteArrayOutputStream outStream = new ByteArrayOutputStream(16384);

		pythonInterpreter.setOut(outStream);
		pythonInterpreter.setErr(outStream);

		// execute the code
		pythonInterpreter.exec(code);

		String result = outStream.toString();
		//outStream.flush();
		
		return JsonResult.success(result);
	}
	
	@ResponseBody
	@PostMapping("/js")
	public JsonResult javascriptCompile(@RequestParam String code) {
		String result = "";
		try {
			result = (String) jsEngine.eval(code);
		} catch (ScriptException e) {
			result = e.toString();
		}
		
		return JsonResult.success(result);
	}
}