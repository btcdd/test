package com.compile.compiletest.controller.api;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.service.TestService;
import com.compile.compiletest.vo.ProblemVo;

@RestController("TestController")
@RequestMapping("/api/codingtest")
public class TestController {

	@Autowired
	private TestService testService;

	@PostMapping("/search")
	public JsonResult search(@RequestParam("keyword") String keyword) {
		List<ProblemVo> list = testService.selectTestList();

		List<ProblemVo> list1 = new ArrayList<ProblemVo>();
		List<ProblemVo> list2 = new ArrayList<ProblemVo>();
		List<ProblemVo> list3 = new ArrayList<ProblemVo>();
		for(ProblemVo vo : list) {
			if(vo.getTitle().contains(keyword) || vo.getNickname().contains(keyword) || vo.getStartTime().contains(keyword) || vo.getEndTime().contains(keyword)) {
				if(vo.getPriority() == 1) {
					list1.add(vo);
				}
				if(vo.getPriority() == 2) {
					list2.add(vo);
				}
				if(vo.getPriority() == 3) {
					list3.add(vo);
				}
			}
		}

		Map<String, Object> map = new HashMap<>(); 
		
		map.put("list1", list1);
		map.put("list2", list2);
		map.put("list3", list3);

		HashMap<Long, Long> dday = new HashMap<Long, Long>();
		
		Calendar today = Calendar.getInstance();
		Calendar d = Calendar.getInstance();
		today.set(Calendar.MONTH, today.get(Calendar.MONTH)+1);

		String[] fake_token = null;
		String[] token = null;

		long l_today = today.getTimeInMillis() / (24*60*60*1000);
		long l_dday = 0;
		long result = 0;
		
		for(ProblemVo vo : list2) {
			fake_token = (vo.getStartTime()+"").split(" ");
			token = fake_token[0].split("-");
			d.set(Integer.parseInt(token[0]), Integer.parseInt(token[1]), Integer.parseInt(token[2]));
			l_dday = d.getTimeInMillis() / (24*60*60*1000);
			result = l_today - l_dday;
			dday.put(vo.getNo(), result);
		}

		map.put("dday", dday);
		
		return JsonResult.success(map);
	}
}
