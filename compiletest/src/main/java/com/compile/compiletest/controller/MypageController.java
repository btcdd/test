package com.compile.compiletest.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.compile.compiletest.service.MypageService;
import com.compile.compiletest.vo.SubmitVo;
import com.compile.compiletest.vo.UserVo;
import com.compile.security.Auth;

@Controller
@RequestMapping("/mypage")
public class MypageController {
		
	@Autowired
	private MypageService mypageService;
	
	@Auth
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		List<SubmitVo> rightSubmit = mypageService.findRrightSubmit(authUser.getNo());
		
		List<SubmitVo> wrongSubmit = mypageService.findWrongSubmit(authUser.getNo());
		
		model.addAttribute("rightSubmit", rightSubmit);	
		model.addAttribute("wrongSubmit", wrongSubmit);	
		
		return "mypage/mypage";
	}
	
	@Auth
	@RequestMapping(value="/account", method=RequestMethod.GET)
	public String account() {
		return "mypage/account";
	}
	
	@Auth
	@RequestMapping(value="/problem", method=RequestMethod.GET)
	public String problem(
			@RequestParam(value="p",required=true,defaultValue="1") int currentPage,
			Model model,
			HttpSession session) {
		UserVo authUser = (UserVo)session.getAttribute("authUser");
	////////////////////////////////////////////////////////////////	
		
//		List<ProblemVo> list = mypageService.selectProblemList();
//		model.addAttribute("list", list);
		
//		System.out.println(list);
	//////////////////////////////////////////////////////////////////
		
		Map<String,Object> map = mypageService.getContentsList(currentPage, authUser.getNo());
		model.addAttribute("map",map);		
		
		return "mypage/problem";
	}
	
	
}