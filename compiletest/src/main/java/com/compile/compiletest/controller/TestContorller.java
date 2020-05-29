package com.compile.compiletest.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.compile.compiletest.service.TestService;
import com.compile.compiletest.vo.ProblemVo;
import com.compile.security.Auth;

@Controller
@RequestMapping("/codingtest")
public class TestContorller {

	@Autowired
	private TestService testService;

	@Auth
	@RequestMapping(value="", method=RequestMethod.GET)
	public String training(Model model) {
		List<ProblemVo> list = testService.selectTestList();
		model.addAttribute("list", list);

		HashMap<Long, Long> map = new HashMap<Long, Long>();

		Calendar today = Calendar.getInstance();
		Calendar d = Calendar.getInstance();
		today.set(Calendar.MONTH, today.get(Calendar.MONTH)+1);

		String[] fake_token = null;
		String[] token = null;

		long l_today = today.getTimeInMillis() / (24*60*60*1000);
		long l_dday = 0;
		long result = 0;
		
		for(ProblemVo vo : list) {
			if(vo.getPriority() == 2) {
				fake_token = (vo.getStartTime()+"").split(" ");
				token = fake_token[0].split("-");
				d.set(Integer.parseInt(token[0]), Integer.parseInt(token[1]), Integer.parseInt(token[2]));
				l_dday = d.getTimeInMillis() / (24*60*60*1000);
				result = l_today - l_dday - 1;
				map.put(vo.getNo(), result);
			}
		}
		
		model.addAttribute("dday", map);

		return "test/list";
	}
}
