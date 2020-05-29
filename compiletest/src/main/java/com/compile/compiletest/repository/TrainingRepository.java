package com.compile.compiletest.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.compile.compiletest.vo.AnswerUserListVo;
import com.compile.compiletest.vo.ProblemVo;
import com.compile.compiletest.vo.StatisticsVo;
import com.compile.compiletest.vo.SubProblemVo;
import com.compile.compiletest.vo.UserVo;

@Repository
public class TrainingRepository {
	
	@Autowired
	private SqlSession sqlSession;

	public List<ProblemVo> selectLevelList(int displayPost, int postNum, String keyword, int size, String[] checkValues) {
		Map<String,Object> map = new HashMap<>();
		map.put("displayPost",displayPost);
		map.put("postNum",postNum);
		map.put("keyword",keyword);
		map.put("size", size);
		
		for(int i = 0; i < size; i++) {
			map.put(checkValues[i], checkValues[i]);
		}
		
		return sqlSession.selectList("training.selectLevelList", map);
	}

	public List<ProblemVo> selectProblemListOrigin() {
		return sqlSession.selectList("training.selectProblemListOrigin");
	}

	public List<ProblemVo> selectOrganizationList(int displayPost, int postNum, String keyword, int size, String[] checkValues) {
		Map<String,Object> map = new HashMap<>();
		map.put("displayPost",displayPost);
		map.put("postNum",postNum);
		map.put("keyword",keyword);
		map.put("size", size);
		
		for(int i = 0; i < size; i++) {
			map.put(checkValues[i], checkValues[i]);
		}
		
		return sqlSession.selectList("training.selectOrganizationList", map);
	}

	public int insertProblem(ProblemVo problemVo) {
		return sqlSession.insert("training.insertProblem", problemVo);
	}

	public Long selectProblemNo() {
		return sqlSession.selectOne("training.selectProblemNo");
	}

	public int insertSubProblem(Map<String, Object> map) {
		return sqlSession.insert("training.insertSubProblem", map);
	}

	public ProblemVo selectProblemOne(Long no) {
		return sqlSession.selectOne("training.selectProblemOne", no);
	}

	public List<SubProblemVo> selectSubProblem(Long no) {
		return sqlSession.selectList("training.selectSubProblem", no);
	}

	public int getTotalCount(String keyword) {
		return sqlSession.selectOne("training.totalCount",keyword);
	}


	public List<ProblemVo> selectTrainingList(int displayPost, int postNum, String keyword) {
		Map<String,Object> map = new HashMap<>();
		map.put("displayPost",displayPost);
		map.put("postNum",postNum);
		map.put("keyword",keyword);
		return sqlSession.selectList("training.selectProblemListOrigin",map);
	}

	public int modify(Map<String, Object> map) {
		return sqlSession.update("training.modify", map);
	}

	public int deleteSubProblem(Map<String, Object> map) {
		return sqlSession.delete("training.deleteSubProblem", map);
	}

	public int getLevelListCount(String keyword, int size, String[] checkValues) {
		Map<String,Object> map = new HashMap<>();
		map.put("keyword",keyword);
		map.put("size",size);
		for(int i = 0; i < size; i++) {
			map.put(checkValues[i], checkValues[i]);
		}
		return sqlSession.selectOne("training.getLevelListCount", map);
	}

	public int getOrganizationListCount(String keyword, int size, String[] checkValues) {
		Map<String,Object> map = new HashMap<>();
		map.put("keyword",keyword);
		map.put("size",size);
		for(int i = 0; i < size; i++) {
			map.put(checkValues[i], checkValues[i]);
		}
		return sqlSession.selectOne("training.getOrganizationListCount", map);
	}

	public List<StatisticsVo> selectStatistics(Map<String, Object> map) {
		return sqlSession.selectList("training.selectStatistics", map);
	}
	
	public List<StatisticsVo> selectStatistics(Long subProblemNo) {
		return sqlSession.selectList("training.selectStatisticsOne", subProblemNo);
	}
  
	public UserVo userFindByProblemNo(Long problemNo) {
		return sqlSession.selectOne("training.userFindByProblemNo", problemNo);
	}
	
	public int getAnswerUserListTotalCount(Long subProblemNo) {
		return sqlSession.selectOne("training.getAnswerUserListTotalCount",subProblemNo);
	}
	
	public int getAnswerUserLangListTotalCount(Long subProblemNo, String lang) {
		Map<String, Object> map = new HashMap<>();
		map.put("subProblemNo", subProblemNo);
		map.put("lang", lang);
		return sqlSession.selectOne("training.getAnswerUserLangListTotalCount", map);
	}
	
	public List<AnswerUserListVo> selectAnswerUserList(int displayPost, int postNum,Long subProblemNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("displayPost",displayPost);
		map.put("postNum",postNum);
		map.put("subProblemNo",subProblemNo);
		return sqlSession.selectList("training.selectAnswerUserList", map);
	}
	
	public List<AnswerUserListVo> selectAnswerUserLangList(int displayPost, int postNum,Long subProblemNo, String lang) {
		Map<String, Object> map = new HashMap<>();
		map.put("displayPost",displayPost);
		map.put("postNum",postNum);
		map.put("subProblemNo", subProblemNo);
		map.put("lang", lang);
		return sqlSession.selectList("training.selectAnswerUserLangList", map);
	}
	
}