package com.compile.compiletest.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.compile.compiletest.repository.TrainingRepository;
import com.compile.compiletest.vo.ProblemVo;

@Service
public class TrainingService {

	@Autowired
	private TrainingRepository trainingRepository;

	public List<ProblemVo> selectLevelList(Map<String, Object> map) {
		return trainingRepository.selectLevelList(map);
	}

	public List<ProblemVo> selectProblemListOrigin() {
		
		return trainingRepository.selectProblemListOrigin();
	}

	public List<ProblemVo> selectOrganizationList(Map<String, Object> map) {
		return trainingRepository.selectOrganizationList(map);
	}
}