package com.compile.compiletest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.compile.compiletest.service.TrainingService;

@Controller
@RequestMapping("/training")
public class TrainingController {
		
	@Autowired
	private TrainingService trainingService;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String training() {
		return "training/list";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String problemWrite() {
		
		return "training/write";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String problemWriteSuccess() {

		
		return "training";
	}
}