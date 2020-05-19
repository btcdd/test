package com.compile.compiletest.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.compile.compiletest.repository.TrainingRepository;
import com.compile.compiletest.vo.ProblemVo;
import com.compile.compiletest.vo.SubProblemList;
import com.compile.compiletest.vo.SubProblemVo;

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
		
		List<SubProblemVo> list = subProblemList.getSubProblemList();
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getExamInput() == "") {
				list.get(i).setExamInput("null");
			}
			if(list.get(i).getCorrectCode() == "") {
				list.get(i).setCorrectCode("null");
			}
		}
		
		map.put("subProblemList", list);
		
		trainingRepository.insertSubProblem(map);
	}

	public ProblemVo selectProblemOne(Long no) {
		return trainingRepository.selectProblemOne(no);
	}

	public List<SubProblemVo> selectSubProblem(Long no) {
		return trainingRepository.selectSubProblem(no);
	}

	public void modify(SubProblemList subProblemList, Long problemNo) {
		List<SubProblemVo> list = subProblemList.getSubProblemList();

		Map<String, Object> map = new HashMap<>();
		map.put("problemNo", problemNo);
		map.put("listSize", list.size());
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getExamInput() == "") {
				list.get(i).setExamInput("null");
			}
			if(list.get(i).getCorrectCode() == "") {
				list.get(i).setCorrectCode("null");
			}
		}
		
		map.put("subProblemList", list);
		
		trainingRepository.modify(map);
	}

	public void deleteSubProblem(SubProblemList subProblemList) {
		List<SubProblemVo> list = subProblemList.getSubProblemList();
		Map<String, Object> map = new HashMap<>();
		map.put("subProblemList", list);
		System.out.println("여기는" + map.get("subProblemList"));
		
		trainingRepository.deleteSubProblem(map);
	}	
}