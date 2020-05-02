package com.compile.compiletest.controller;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.compile.compiletest.dto.JsonResult;

@Controller
@RequestMapping("/compile")
public class CompileControllerJs {
	
	ScriptEngineManager scriptEngineMgr = new ScriptEngineManager();
	ScriptEngine jsEngine = scriptEngineMgr.getEngineByName("JavaScript");
	
	@ResponseBody
	@PostMapping({"/js","/js/save"})
	public JsonResult javascriptCompile(@RequestParam String code) {
		
		String[] res = new String[2];
		try {
			res[0] = (String) jsEngine.eval(code);
			res[1] = "";
		} catch (ScriptException e) {
			res[1] = "에러가 발생했습니다.\n" + e.toString();
		}
		
		return JsonResult.success(res);
	}
}