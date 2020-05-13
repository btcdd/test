package com.compile.compiletest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/training")
public class TrainingController {
		
//	@Autowired
//	private TrainingService trainingService;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String mypage() {
		
		return "training/list";
	}
}