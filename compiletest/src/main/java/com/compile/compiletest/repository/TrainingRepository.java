package com.compile.compiletest.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.compile.compiletest.vo.ProblemVo;
import com.compile.compiletest.vo.SubProblemVo;

@Repository
public class TrainingRepository {
	
	@Autowired
	private SqlSession sqlSession;

	public List<ProblemVo> selectLevelList(Map<String, Object> map) {
		return sqlSession.selectList("training.selectLevelList", map);
	}

	public List<ProblemVo> selectProblemListOrigin() {
		return sqlSession.selectList("training.selectProblemListOrigin");
	}

	public List<ProblemVo> selectOrganizationList(Map<String, Object> map) {
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
}