package com.compile.compiletest.controller.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.compile.compiletest.dto.JsonResult;
import com.compile.compiletest.linux.TrainingLinux;
import com.compile.compiletest.service.TrainingService;
import com.compile.compiletest.vo.CodeVo;
import com.compile.compiletest.vo.ProblemVo;
import com.compile.compiletest.vo.SavePathVo;
import com.compile.compiletest.vo.SubProblemVo;
import com.compile.compiletest.vo.UserVo;

@RestController("TrainingController")
@RequestMapping("/api/training")
public class TrainingController {

	@Autowired
	private TrainingService trainingService;

	private Long authUserNo = null;

	@PostMapping(value = "/list")
	public JsonResult originProblemList(String page, String kwd, String category, String[] checkValues) {

		int p = Integer.parseInt(page);
		Map<String, Object> map = trainingService.getContentsList(p, kwd, category, checkValues);

		return JsonResult.success(map);
	}

	@PostMapping("/mylist")
	public JsonResult mylist(Long no) {

		ProblemVo problemVo = trainingService.selectProblemOne(no);
		List<SubProblemVo> list = trainingService.selectSubProblem(no);

		Map<String, Object> map = new HashMap<>();

		map.put("problemVo", problemVo);
		map.put("list", list);
		map.put("listSize", list.size());
		map.put("problemNo", no);

		return JsonResult.success(map);
	}
	// 인증번호가 통과하고 나서 들어가지는 경로
	@PostMapping("/mylist/{userEmail}/{problemNo}")
	public JsonResult mylist(@PathVariable("userEmail") Optional<String> userEmail,
			@PathVariable("problemNo") Long problemNo, HttpSession session) {

			Map<String, Object> map = new HashMap<>();



			ProblemVo problemVo = trainingService.selectProblemOne(problemNo);
			List<SubProblemVo> list = trainingService.selectSubProblem(problemNo);

			System.out.println("email을 가져온 경로  problemVo>>" + problemVo);

			map.put("problemVo", problemVo);
			map.put("list", list);
			System.out.println("email을 가져온 경로");

			//////////////////////////////////
			// 관우 유진 코드
			// 아직 쓸모없음
			Long saveNo = trainingService.selectSaveNo(authUserNo, problemVo.getNo());

			List<SavePathVo> savePathVoList = trainingService.selectSavePath(saveNo);
			Long[] savePathNoArray = new Long[savePathVoList.size()];
			for (int i = 0; i < savePathVoList.size(); i++) {
				savePathNoArray[i] = savePathVoList.get(i).getNo();
			}
			List<CodeVo> codeVoList = trainingService.selectCode(savePathNoArray);
			map.put("savePathVoList", savePathVoList);
			map.put("codeVoList", codeVoList);

			///////////////////////////////

		return JsonResult.success(map);
	}

	// 창 열리고 나서 이름,생일,인증번호 작성한 정보 넘어오는 경로 - startTime endTime이 있어야 하는 곳
	@PostMapping("/auth/{userEmail}/{problemNo}")
	public JsonResult auth(@PathVariable("userEmail") String userEmail, @PathVariable("problemNo") Long problemNo,
			@RequestBody Map<String, Object> user) {

		Map<String, Object> map = new HashMap<>();

		JSONParser parser = new JSONParser();
		JSONObject obj = null;

		try {
			obj = (JSONObject) parser.parse((String) user.get("body"));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		System.out.println("obj>>>" + obj);
		String userName = (String) obj.get("name");
		String userBirth = (String) obj.get("birth");
		if (userBirth.equals("") || userName.equals("")) {
			map.put("result", "empty");
			return JsonResult.success(map);
		}

		String tempKey = (String) obj.get("tempKey");
		boolean exist = trainingService.existUser(userEmail); // 유저가 있는지 체크
		ProblemVo problemVo = trainingService.selectProblemOne(problemNo);

		if (problemVo == null || problemVo.getState().equals("n")) {
			System.out.println(
					"http://localhost:9999/?userEmail=2sang@gmail.com&problemNo=123123134 처럼 직접 경로타고 번호 아무렇게나 쓰고 올경우");
			map.put("result", "delete");
			return JsonResult.success(map);
		}
		// 유저가 존재하는데 상태가 n이면 삭제 상태
		if (exist && problemVo.getPassword().equals(tempKey)) { // 인증키가 맞고 유저가 존재한다면
			trainingService.insertUserInfo(userName, userBirth, userEmail);
			map.put("result", "ok");
			return JsonResult.success(map);
		}

		map.put("result", "no");
		return JsonResult.success(map);

	}

	@PostMapping("/answerlist")
	public JsonResult answerList(String page, String language, String subProblemNo) {

		int p = Integer.parseInt(page);
		Map<String, Object> map = trainingService.selectAnswerUserList(p, Long.parseLong(subProblemNo), language);

		return JsonResult.success(map);
	}

	@PostMapping("/save/problem")
	public JsonResult saveProblem(Long problemNo, HttpSession session, Long[] array) {

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		trainingService.insertSaveProblemNo(authUser.getNo(), problemNo);
		Long saveNo = trainingService.findSaveNo(problemNo);

		trainingService.insertSavePath(array, saveNo, authUser.getNo(), problemNo);

		TrainingLinux trainingLinux = new TrainingLinux();
		trainingLinux.saveProblemAndSubProblem(authUser.getNo(), problemNo, array);

		return JsonResult.success(null);
	}

	@PostMapping("/recommend")
	public JsonResult recommend(Long problemNo, HttpSession session) {

		UserVo authUser = (UserVo) session.getAttribute("authUser");

		Map<String, Object> map = trainingService.updateRecommend(authUser.getNo(), problemNo);

		return JsonResult.success(map);
	}
}
