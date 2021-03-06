package com.compile.compiletest.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.compile.compiletest.vo.CodeVo;
import com.compile.compiletest.vo.SubProblemVo;

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

	public List<CodeVo> findCode(Long subProblemNo) {
		return sqlSession.selectList("codetree.findCode", subProblemNo);
	}

	public Long findSaveNo(Map<String, Object> map) {
		return sqlSession.selectOne("codetree.findSaveNo", map);
	}

	public List<SubProblemVo> findSubProblemNo(Long problemNo) {
		return sqlSession.selectList("codetree.findSubProblemNo", problemNo);
	}

	// 고치던거!
	public void insertSavePath(Long saveNo, List<SubProblemVo> subProblemList) {
		sqlSession.insert("codetree.insertSavePath");
	}
}