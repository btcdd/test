package com.compile.compiletest.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.compile.compiletest.service.TrainingService;
import com.compile.compiletest.vo.ProblemVo;

@Controller
@RequestMapping("/training")
public class TrainingController {
		
	@Autowired
	private TrainingService trainingService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String mypage(Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("one", 1L);
		map.put("one", 3L);
		List<ProblemVo> list = trainingService.selectProblemList(map);
		model.addAttribute("list", list);
		
		return "training/list";
	}
}