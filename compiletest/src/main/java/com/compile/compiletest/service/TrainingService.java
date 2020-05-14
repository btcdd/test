package com.compile.compiletest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.compile.compiletest.repository.TrainingRepository;
import com.compile.compiletest.vo.ProblemVo;
import com.compile.compiletest.vo.SubProblemList;

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

	public void insert(SubProblemList subProblemList, ProblemVo problemVo) {
		trainingRepository.insertProblem(problemVo);
		Long problemNo = trainingRepository.selectProblemNo();
		
		Map<String, Object> map = new HashMap<>();
		map.put("problemNo", problemNo);
		map.put("subProblemList", subProblemList.getSubProblemList());
		
		trainingRepository.insertSubProblem(map);
	}
}