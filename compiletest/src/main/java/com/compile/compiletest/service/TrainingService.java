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

	private static final int postNum = 15; //한 페이지에 출력할 게시물 갯수
	private static final int pageNum_cnt = 5; 		//한번에 표시할 페이징 번호의 갯수
	
	@Autowired
	private TrainingRepository trainingRepository;

	public List<ProblemVo> selectProblemListOrigin() {
		
		return trainingRepository.selectProblemListOrigin();
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

	public Map<String, Object> getContentsList(int currentPage, String keyword, String category, String[] checkValues) {
		int count;
		//게시물 총 갯수
		if("".equals(category) || checkValues == null) {
			count = trainingRepository.getTotalCount(keyword);
		} else {
			int size = checkValues.length;
			
			if("level".equals(category)) {
				count = trainingRepository.getLevelListCount(keyword, size, checkValues);
			} else {
				count = trainingRepository.getOrganizationListCount(keyword, size, checkValues);
			}
		}
		
		//하단 페이징 번호([게시물 총 갯수 / 한 페이지에 출력할 갯수]의 올림)
		int pageNum = (int)Math.ceil((double)count/postNum);
		//출력할 게시물
		int displayPost = (currentPage -1) * postNum;
		//표시되는 페이지 번호 중 마지막 번호
		int endPageNum = (int)(Math.ceil((double)currentPage / (double)pageNum_cnt) * pageNum_cnt);
		//표시되는 페이지 번호 중 첫번째 번호
		int startPageNum = endPageNum - (pageNum_cnt - 1);
		//마지막번호 재계산
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)postNum));
		if(endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;//마지막 페이지 번호가 총 게시물 갯수보다 작다면, 다음 구간이 있다는 의미이므로 출력
		
		List<ProblemVo> list;
		
		if("".equals(category) || checkValues == null) {
			list = trainingRepository.selectTrainingList(displayPost,postNum,keyword);
		} else {
			int size = checkValues.length;
			
			if("level".equals(category)) {
				list = trainingRepository.selectLevelList(displayPost,postNum,keyword, size, checkValues);
			} else {
				list = trainingRepository.selectOrganizationList(displayPost,postNum,keyword, size, checkValues);
			}
		}
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("list",list);		
		map.put("pageNum",pageNum);
		map.put("select",currentPage);
		map.put("startPageNum",startPageNum);
		map.put("endPageNum",endPageNum + 1);
		map.put("next",next);
		map.put("keyword",keyword);
		map.put("count", count);
		
		return map;
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

	public void deleteSubProblem(SubProblemList subProblemList, Long[] array) {
		List<SubProblemVo> list = subProblemList.getSubProblemList();
		Map<String, Object> map = new HashMap<>();
		map.put("subProblemList", list);
		
		map.put("deleteNoList", array);
		
		trainingRepository.deleteSubProblem(map);
	}	
}
