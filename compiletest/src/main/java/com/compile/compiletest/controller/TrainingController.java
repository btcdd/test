package com.compile.compiletest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.compile.compiletest.service.TrainingService;
import com.compile.compiletest.vo.ProblemVo;
import com.compile.compiletest.vo.SubProblemList;
import com.compile.compiletest.vo.SubProblemVo;

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
	public String problemWriteSuccess(
			@ModelAttribute SubProblemList subProblemList,
			ProblemVo problemVo) {
		
		trainingService.insert(subProblemList, problemVo);
		
		return "redirect:/training";
	}
	
	@RequestMapping(value="/view/{problemNo}", method=RequestMethod.GET)
	public String problemView(@PathVariable("problemNo") Long problemNo, Model model) {
		
		ProblemVo problemVo = trainingService.selectProblemOne(problemNo);
		List<SubProblemVo> list = trainingService.selectSubProblem(problemNo);
		Map<String, Object> map = new HashMap<>();
		
		map.put("problemVo", problemVo);
		map.put("list", list);
		map.put("listSize", list.size());

		model.addAllAttributes(map);
		
		return "training/view";
	}
	
	@RequestMapping(value="/modify/{problemNo}", method=RequestMethod.GET)
	public String problemModify(@PathVariable("problemNo") Long problemNo, Model model) {
		
		ProblemVo problemVo = trainingService.selectProblemOne(problemNo);
		List<SubProblemVo> list = trainingService.selectSubProblem(problemNo);
		Map<String, Object> map = new HashMap<>();
		
		map.put("problemVo", problemVo);
		map.put("list", list);
		
		map.put("listSize", list.size());

		model.addAllAttributes(map);
		
		return "training/modify";
	}
	
	@RequestMapping(value="/modify/{problemNo}", method=RequestMethod.POST)
	public String problemModifySubmit(@ModelAttribute SubProblemList subProblemList,
				ProblemVo problemVo,
				@PathVariable("problemNo") Long problemNo, Model model) {
		trainingService.deleteSubProblem(subProblemList);
		trainingService.modify(subProblemList, problemNo);
		
		return "redirect:/training/view/" + problemNo;
	}
}