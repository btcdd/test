package com.compile.compiletest.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.service.TrainingService;
import com.compile.compiletest.vo.CodeVo;
import com.compile.compiletest.vo.SavePathVo;
import com.compile.compiletest.vo.SaveVo;
import com.compile.compiletest.vo.UserVo;

@RestController("CodeTreeController")
@RequestMapping("/api/codetree")
public class CodeTreeController {
	@Autowired
	private TrainingService trainingService;

	UserVo _authUser = null;
	
	@GetMapping("")
	public JsonResult codetree(HttpSession session) {
		Map<String, Object> map = new HashMap<>();
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		_authUser = authUser;
		map.put("authUser", authUser);
		return JsonResult.success(map);
	}	
	
	@PostMapping("/{userEmail}")
	public JsonResult codetree2(@PathVariable("userEmail") String userEmail) {
		
		Map<String, Object> map = new HashMap<>();
		
		boolean exist = trainingService.existUser(userEmail); //유저가 있는지 체크
		if(!exist || userEmail=="undifiend") {
			System.out.println("유저가 존재하지 않는다!!!");
			
			map.put("result", "emptyUser");
			return JsonResult.success(map); //redirect 홈으로(리액트에서)
		}
		System.out.println("_authUser>>>>"+_authUser);
		if(_authUser == null) {
			System.out.println("잘못된 접근 경로 !!!");
			map.put("result", "wrongAccess");
			return JsonResult.success(map); //redirect 홈으로(리액트에서)
		}
		
		//1.만약에 userEmail에 회원가입이 되어있지 않는 사용자일 경우 처리
		//2.userEmail이 즐겨찾기 한 문제 리스트들이 쭉 뜰수 있는 정보가 필요
		//3.문제 리스트 중 하나를 클릭하면 해당하는 패키지 상세가 뜰 수 있도록 하는 세부 문제 정보가 필요
		
		/////////////////////////////////////////
		// 관우 유진 코드~~~
		// 유저의 회원번호, 저장한 문제모음번호 가져오기
		List<SaveVo> saveVoList = trainingService.selectSaveNoList(_authUser.getNo());
		
//		List<SavePathVo> savePathVoList = trainingService.selectSavePath(saveNo);
//		Long[] savePathNoArray = new Long[savePathVoList.size()];
//		for(int i = 0; i < savePathVoList.size(); i++) {
//		savePathNoArray[i] = savePathVoList.get(i).getNo();
//		}
//		List<CodeVo> codeVoList = trainingService.selectCode(savePathNoArray);
//		map.put("savePathVoList",savePathVoList);
//		map.put("codeVoList",codeVoList);
		
		///////////////////////////////
		
		System.out.println("!!!!");
		map.put("result", "ok");

		System.out.println("userEmail>>"+userEmail);
		
		return JsonResult.success(map);
	}
}
