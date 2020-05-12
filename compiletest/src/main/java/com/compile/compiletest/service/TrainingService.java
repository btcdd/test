package com.compile.compiletest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.compile.compiletest.repository.TrainingRepository;
import com.compile.compiletest.vo.ProblemVo;

@Service
public class TrainingService {

	@Autowired
	private TrainingRepository trainingRepository;

	public List<ProblemVo> selectProblemList() {
		return trainingRepository.selectProblemList();
	}
}