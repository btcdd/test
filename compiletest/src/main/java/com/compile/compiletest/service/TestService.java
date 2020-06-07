package com.compile.compiletest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.compile.compiletest.repository.TestRepository;
import com.compile.compiletest.vo.ProblemVo;

@Service
public class TestService {

	@Autowired
	private TestRepository testRepository;

	public List<ProblemVo> selectTestList() {
		return testRepository.selectTestList();
	}

	public Long findUserByEmail(String userEmail) {
		return testRepository.findUserByEmail(userEmail);
	}
}