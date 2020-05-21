package com.compile.compiletest.controller.api;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.service.TrainingService;

@RestController("TrainingController")
@RequestMapping("/api/training")
public class TrainingController {
	
	@Autowired
	private TrainingService trainingService;
	
	@PostMapping(value="/list")
	public JsonResult originProblemList(String page, String kwd, String category, String[] checkValues) {
		
		int p = Integer.parseInt(page);
		Map<String,Object> map = trainingService.getContentsList(p, kwd, category, checkValues);
		
		return JsonResult.success(map);
	}
}