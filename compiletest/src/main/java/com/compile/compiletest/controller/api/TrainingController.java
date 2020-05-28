package com.compile.compiletest.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
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
	
	@PostMapping("/mylist")
	public JsonResult mylist(Long no) {
		System.out.println("click!!!@!@!!" + no);
		
		ProblemVo problemVo = trainingService.selectProblemOne(no);
		List<SubProblemVo> list = trainingService.selectSubProblem(no);
		
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("problemVo", problemVo);
		map.put("list", list);
		map.put("listSize", list.size());
		map.put("problemNo", no);
		
		return JsonResult.success(map);
	}
	
	@PostMapping("/answerlist")
	public JsonResult answerList(String page, String language, String subProblemNo) {
		System.out.println("page : " + page  +" / language : " + language + "/ subProblemNo : " + subProblemNo);
		
		int p = Integer.parseInt(page);
		Map<String, Object> map = trainingService.selectAnswerUserList(p, Long.parseLong(subProblemNo), language);
		
		System.out.println(map);
//		ProblemVo problemVo = trainingService.selectProblemOne(no);
//		List<SubProblemVo> list = trainingService.selectSubProblem(no);
//		
//		map.put("problemVo", problemVo);
//		map.put("list", list);
//		map.put("listSize", list.size());
//		map.put("problemNo", no);
		
		return JsonResult.success(map);
	}
	
	
}

	
