package com.compile.compiletest.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.compile.compiletest.repository.CodeTreeRepository;

@Service
public class CodeTreeService {
	
	@Autowired
	private CodeTreeRepository codetreeRepository;

	public Map<String, Object> saveUserCodeAndProblems(Long authUserNo, Long problemNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("authUserNo", authUserNo);
		map.put("problemNo", problemNo);
		
		codetreeRepository.saveUserAndProblem(map);
		
		return map;
	}
}