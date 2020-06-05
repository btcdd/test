package com.compile.compiletest.controller.api;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.compile.compiletest.dto.JsonResult;

@RestController("HiHiController")
@RequestMapping("/api/hihi")
public class HiHiController {
	
	
	@PostMapping(value="")
	public JsonResult hihi() {
		
		return JsonResult.success(null);
	}
	
	@PostMapping(value="checkUser")
	public JsonResult checkUser() {
		Map<String, Object> map = new HashMap<>();
		map.put("userEmail", "1sang@gmail.com");
		
		System.out.println("hihi~~");
		
		return JsonResult.success(map);
	}
}