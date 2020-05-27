package com.compile.compiletest.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.compile.compiletest.service.TrainingService;
import com.compile.compiletest.service.UserService;
import com.compile.compiletest.vo.ProblemVo;
import com.compile.compiletest.vo.SubProblemList;
import com.compile.compiletest.vo.SubProblemVo;
import com.compile.compiletest.vo.UserVo;
import com.compile.security.Auth;

@Controller
@RequestMapping("/training")
public class TrainingController {

	@Autowired
	private TrainingService trainingService;

	@Auth
	@RequestMapping(value={"","/list"}, method=RequestMethod.GET)
	public String training() {

		return "training/list";
	}

	@Auth
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String problemWrite() {

		return "training/write";
	}

	@Auth
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String problemWriteSuccess(
			@ModelAttribute SubProblemList subProblemList,
			ProblemVo problemVo) {

		trainingService.insert(subProblemList, problemVo);

		return "redirect:/training";
	}

	@Auth
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

	@Auth
	@RequestMapping(value="/modify/{problemNo}", method=RequestMethod.GET)
	public String problemModify(@PathVariable("problemNo") Long problemNo, Model model, HttpSession session) {
		// 문제를 만든 유저의 정보를 찾아서
		// 세션의 유저 값이랑 비교
		// 다르다면 다른페이지로 리턴시킴
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		UserVo master = trainingService.userFindByProblemNo(problemNo);
		if(authUser.getNo() != master.getNo()) {
			return "redirect:/training";
		}

		ProblemVo problemVo = trainingService.selectProblemOne(problemNo);
		List<SubProblemVo> list = trainingService.selectSubProblem(problemNo);
		Map<String, Object> map = new HashMap<>();

		map.put("problemVo", problemVo);
		map.put("list", list);

		map.put("listSize", list.size());

		model.addAllAttributes(map);

		return "training/modify";
	}

	@Auth
	@RequestMapping(value="/modify/{problemNo}", method=RequestMethod.POST)
	public String problemModifySubmit(@ModelAttribute SubProblemList subProblemList,
			ProblemVo problemVo,
			@PathVariable("problemNo") Long problemNo, Model model,
			@RequestParam(value = "array", required = true, defaultValue = "") Long[] array) {

		List<SubProblemVo> list = subProblemList.getSubProblemList();

		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getTitle() == null) {
				list.remove(i);
			}
		}
		if(array.length > 0) {
			trainingService.deleteSubProblem(subProblemList, array);
		}
		if(list.size() > 0) {
			trainingService.modify(subProblemList, problemNo);
		}
		return "redirect:/training/view/" + problemNo;
	}
	
	@RequestMapping(value="/statistics/{problemNo}", method=RequestMethod.GET)
	public String problemStatistics(@PathVariable("problemNo") Long problemNo) {
		
		return "training/statistics";
	}
}