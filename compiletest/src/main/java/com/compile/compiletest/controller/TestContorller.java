package com.compile.compiletest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.compile.compiletest.service.TestService;
import com.compile.compiletest.vo.ProblemVo;

@Controller
@RequestMapping("/codingtest")
public class TestContorller {

	@Autowired
	private TestService testService;
	
	@RequestMapping(value="", method=RequestMethod.GET)
	public String training(Model model) {
		List<ProblemVo> list = testService.selectTestList();
		model.addAttribute("list", list);
		
		return "test/list";
	}
}
