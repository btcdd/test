package com.compile.compiletest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.service.UserService;
import com.compile.compiletest.vo.UserVo;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;	
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		return "user/join";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(@ModelAttribute("userVo") UserVo vo) {			
		return "main";
	}
	
		
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "user/login";
	}

	@RequestMapping(value="/join-check", method=RequestMethod.GET)
	public String auth() {
		return "user/join-check";
	}

	@ResponseBody
	@GetMapping("emailAuth")
	public JsonResult emailAuth(@RequestParam(value="email",required=true,defaultValue="") String email) {
		
		int tempKey = userService.getTempKey();
		userService.sendMail(email,tempKey);
		
		
		return JsonResult.success(tempKey);
	}
	
}
