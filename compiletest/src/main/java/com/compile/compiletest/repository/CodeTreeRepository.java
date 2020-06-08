package com.compile.compiletest.repository;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CodeTreeRepository {
	
	@Autowired
	private SqlSession sqlSession;

	public void saveUserAndProblem(Map<String, Object> map) {
		sqlSession.update("codetree.saveUserAndProblem", map);
	}

	public void savePath(Map<String, Object> map) {
		sqlSession.update("codetree.savePath", map);
	}

	public void saveCode(Map<String, Object> map) {
		sqlSession.update("codetree.saveCode", map);
	}
}