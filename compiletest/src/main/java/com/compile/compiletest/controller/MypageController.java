package com.compile.compiletest.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.compile.compiletest.service.MypageService;
import com.compile.compiletest.vo.ProblemVo;

@Controller
@RequestMapping("/mypage")
public class MypageController {
		
	@Autowired
	private MypageService mypageService;
	
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage() {
		return "mypage/mypage";
	}
	
	@RequestMapping(value="/account", method=RequestMethod.GET)
	public String account() {
		return "mypage/account";
	}
	
	@RequestMapping(value="/problem", method=RequestMethod.GET)
	public String problem(
			@RequestParam(value="p",required=true,defaultValue="1") int currentPage,
			Model model) {
		
	////////////////////////////////////////////////////////////////	
		
//		List<ProblemVo> list = mypageService.selectProblemList();
//		model.addAttribute("list", list);
		
//		System.out.println(list);
	//////////////////////////////////////////////////////////////////
		
		Map<String,Object> map = mypageService.getContentsList(currentPage);
		model.addAttribute("map",map);		
		
		return "mypage/problem";
	}
	
	
}