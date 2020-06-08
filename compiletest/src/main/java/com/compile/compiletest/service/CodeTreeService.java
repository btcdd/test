package com.compile.compiletest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.compile.compiletest.repository.CodeTreeRepository;
import com.compile.compiletest.vo.SavePathVo;

@Service
public class CodeTreeService {
	
	@Autowired
	private CodeTreeRepository codetreeRepository;

	public Map<String, Object> saveUserCodeAndProblems(Long authUserNo, Long problemNo, List<SavePathVo> savePathVoList) {
		Map<String, Object> map = new HashMap<>();
		map.put("authUserNo", authUserNo);
		map.put("problemNo", problemNo);
		
		// 저장 테이블에 회원 번호와 문제 모음 번호를 저장
		codetreeRepository.saveUserAndProblem(map);

		// 저장 경로 테이블에 저장
		map.put("savePathVoList", savePathVoList);
		codetreeRepository.savePath(map);
		
		return map;
	}
}