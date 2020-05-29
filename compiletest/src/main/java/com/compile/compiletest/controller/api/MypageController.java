package com.compile.compiletest.controller.api;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.service.MypageService;
import com.compile.compiletest.vo.SubProblemVo;
import com.compile.compiletest.vo.SubmitVo;
import com.compile.compiletest.vo.UserVo;
import com.compile.security.Auth;

@RestController("MypageController")
@RequestMapping("/api/mypage")
public class MypageController {

	@Autowired
	private MypageService mypageService;

	@Auth
	@PostMapping(value="/account/nickname")
	public JsonResult changeNickname(@ModelAttribute UserVo vo, HttpSession session) {
		int result = mypageService.changeNickname(vo);
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		authUser.setNickname(vo.getNickname());
		session.setAttribute("authUser", authUser);
		return JsonResult.success(result);
	}

	@Auth
	@PostMapping(value="/account/password")
	public JsonResult changePassword(@ModelAttribute UserVo vo) {
		int result = mypageService.changePassword(vo);

		return JsonResult.success(result);
	}

	@Auth
	@PostMapping(value="/account/delete")
	public JsonResult deleteUser(@ModelAttribute UserVo vo, HttpSession session) {
		int result = mypageService.deleteUser(vo);
		session.setAttribute("authUser", null);
		
		return JsonResult.success(result);
	}

	@Auth
	@DeleteMapping(value="/problem/delete/{no}")
	public JsonResult deleteProblem(@PathVariable("no") Long no) {
		int result = mypageService.deleteProblem(no);

		return JsonResult.success(result);
	}

	@Auth
	@DeleteMapping(value="/sub-problem/delete/{no}")
	public JsonResult deleteSubProblem(@PathVariable("no") Long no) {
		int result = mypageService.deleteSubProblem(no);

		return JsonResult.success(result);
	}

	// 문제 푼 사람 리스트
	@Auth
	@PostMapping(value="/problem/list/{no}")
	public JsonResult listProblem(@PathVariable("no") Long no) {
		List<SubmitVo> result = mypageService.problemSolveList(no);

		return JsonResult.success(result);
	}

	@Auth
	@PostMapping(value="/sub-problem/{no}")
	public JsonResult subProblem(@PathVariable("no") Long no) {
		List<SubProblemVo> result = mypageService.findSubProblem(no);

		return JsonResult.success(result);
	}
}