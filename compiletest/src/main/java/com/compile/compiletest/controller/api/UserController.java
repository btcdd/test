package com.compile.compiletest.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.service.UserService;

@RestController("UserApiController")
@RequestMapping("/api/user")
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("emailAuth")
	public JsonResult emailAuth(@RequestParam(value="email",required=true,defaultValue="") String email) {
		
		int tempKey = userService.getTempKey();
		userService.sendMail(email,tempKey);
		
		
		return JsonResult.success(tempKey);
	}	
	
	 
	@RequestMapping(value = "/checkemail", method = RequestMethod.GET)
	public JsonResult checkEmail(@RequestParam(value="email", required = true, defaultValue = "")String email) {
		boolean exist = userService.existUser(email);

		return JsonResult.success(exist);
	}
	
	
	@RequestMapping(value = "/nickname", method = RequestMethod.GET)
	public JsonResult checkNickname(@RequestParam(value="nickname", required = true, defaultValue = "")String nickname) {
		boolean exist = userService.existNickname(nickname);

		return JsonResult.success(exist);
	}
	
	
}


