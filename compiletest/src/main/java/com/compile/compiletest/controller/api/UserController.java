package com.compile.compiletest.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.service.UserService;

@Controller("UserApiController")
@RequestMapping("/api/user")
public class UserController {

	@Autowired
	private UserService userService;

	@ResponseBody
	@RequestMapping(value = "/checkemail", method = RequestMethod.GET)
	public JsonResult checkEmail(@RequestParam(value="email", required = true, defaultValue = "")String email) {
		boolean exist = userService.existUser(email);

		return JsonResult.success(exist);
	}
	
	@ResponseBody
	@RequestMapping(value = "/nickname", method = RequestMethod.GET)
	public JsonResult checkNickname(@RequestParam(value="nickname", required = true, defaultValue = "")String nickname) {
		boolean exist = userService.existNickname(nickname);

		return JsonResult.success(exist);
	}
}


