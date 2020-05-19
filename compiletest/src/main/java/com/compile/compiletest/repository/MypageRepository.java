package com.compile.compiletest.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.compile.compiletest.vo.ProblemVo;
import com.compile.compiletest.vo.SubProblemVo;
import com.compile.compiletest.vo.SubmitVo;

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

	public List<ProblemVo> selectProblemList(int displayPost, int postNum) {
		Map<String,Object> map = new HashMap<>();
		map.put("displayPost",displayPost);
		map.put("postNum",postNum);		
		List<ProblemVo> list = sqlSession.selectList("mypage.selectProblemList",map);
		return list;
	}
	
	public int deleteProblem(Long no) {
		return sqlSession.delete("mypage.deleteProblem", no);
	}

	public List<SubmitVo> problemSolveList(Long no) {
		return sqlSession.selectList("mypage.problemSolveList", no);
	}

	public int getTotalCount() {
		return sqlSession.selectOne("mypage.totalCount");
	}

	public List<SubProblemVo> findSubProblem(Long no) {
		return  sqlSession.selectList("mypage.findSubProblem", no);
	}

	public int deleteSubProblem(Long no) {
		int foreignKeyChecks = sqlSession.update("mypage.foreignKeyChecks");
		int result = sqlSession.delete("mypage.deleteSubProblem", no);		
		
		return result;
	}

	
}