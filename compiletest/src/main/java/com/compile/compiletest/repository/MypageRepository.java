package com.compile.compiletest.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.compile.compiletest.vo.ProblemVo;

@Repository
public class MypageRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int changeNickname(String nickname) {
		return sqlSession.update("mypage.changeNickname", nickname);
	}

	public int changePassword(String password) {
		return sqlSession.update("mypage.changePassword", password);
	}

	public int deleteUser(String email) {
		return sqlSession.delete("mypage.deleteUser", email);
	}

	public String lookUpPassword(String email) {
		return sqlSession.selectOne("mypage.lookUpPassword", email);
	}

	public void foreignKeyChecks(long l) {
		sqlSession.update("mypage.foreignKeyChecks", 0L);
	}

	public List<ProblemVo> selectProblemList(String email) {
		return sqlSession.selectList("mypage.selectProblemList", email);
	}
}