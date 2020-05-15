package com.compile.compiletest.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.service.TrainingService;
import com.compile.compiletest.vo.ProblemVo;

@RestController("TrainingController")
@RequestMapping("/api/training")
public class TrainingController {
	
	@Autowired
	private TrainingService trainingService;
	
	@PostMapping(value="/list")
	public JsonResult selectProblemList(String category, String[] checkValues) {
		
		List<ProblemVo> levelList;
		
		if(checkValues.length > 0) {
			Map<String, Object> map = new HashMap<>();
			for(int i = 0; i < checkValues.length; i++) {
				map.put(checkValues[i], checkValues[i]);
			}
			map.put("size", map.size());
			
			if("level".equals(category)) {
				levelList = trainingService.selectLevelList(map);
			} else {
				levelList = trainingService.selectOrganizationList(map);
			}
		} else {
			levelList = trainingService.selectProblemListOrigin();
		}
		return JsonResult.success(levelList);
	}
	
	@GetMapping(value="/list")
	public JsonResult originProblemList() {
		List<ProblemVo> levelList = trainingService.selectProblemListOrigin();
		
		
		
		return JsonResult.success(levelList);
	}
}