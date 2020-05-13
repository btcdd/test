package com.compile.compiletest.controller.api;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.service.TrainingService;

@RestController("TrainingController")
@RequestMapping("/training")
public class TrainingController {
	
	@Autowired
	private TrainingService trainingService;
	
	@PostMapping(value="/list")
	public JsonResult selectProblemList(@RequestBody Map<String, Object> map) {
		System.out.println("type:" + map.get("type"));
		
//		int result = trainingService.selectProblemList();
		
		return JsonResult.success("success");
	}
}