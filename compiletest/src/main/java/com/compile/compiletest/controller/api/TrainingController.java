package com.compile.compiletest.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.service.TrainingService;
import com.compile.compiletest.vo.ProblemVo;

@RestController("TrainingController")
@RequestMapping("/training")
public class TrainingController {
	
	@Autowired
	private TrainingService trainingService;
	
	@PostMapping(value="/list")
	public JsonResult selectProblemList(String[] checkValues, Model model) {
		
		Map<String, Object> map = new HashMap<>();
		for(int i = 0; i < checkValues.length; i++) {
			map.put(checkValues[i], checkValues[i]);
		}
		map.put("size", map.size());
		List<ProblemVo> levelList = trainingService.selectProblemList(map);
		
		return JsonResult.success(levelList);
	}
}