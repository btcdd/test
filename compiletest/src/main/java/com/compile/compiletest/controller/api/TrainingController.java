package com.compile.compiletest.controller.api;

import java.awt.Desktop;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.service.TrainingService;
import com.compile.compiletest.vo.ProblemVo;
import com.compile.compiletest.vo.SubProblemVo;

@CrossOrigin(origins="http://127.0.0.1:9999")
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
	
	@PostMapping("/mylist/{problemNo}")
	public JsonResult mylist(@PathVariable("problemNo") Long problemNo) {
		System.out.println("click!!!@!@!!");
		
		ProblemVo problemVo = trainingService.selectProblemOne(problemNo);
		List<SubProblemVo> list = trainingService.selectSubProblem(problemNo);
		
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("problemVo", problemVo);
		map.put("list", list);
		map.put("listSize", list.size());
		map.put("problemNo", problemNo);
		
		return JsonResult.success(map);
	}
	
	
	
}

	
