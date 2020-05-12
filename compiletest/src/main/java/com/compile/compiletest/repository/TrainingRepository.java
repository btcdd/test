package com.compile.compiletest.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.compile.compiletest.vo.ProblemVo;

@Repository
public class TrainingRepository {
	
	@Autowired
	private SqlSession sqlSession;

	public List<ProblemVo> selectProblemList() {
		return sqlSession.selectList("training.selectProblemList");
	}
}