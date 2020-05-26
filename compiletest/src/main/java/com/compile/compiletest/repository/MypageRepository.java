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
import com.compile.compiletest.vo.UserVo;

@Repository
public class MypageRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int changeNickname(UserVo vo ) {
		return sqlSession.update("mypage.changeNickname", vo);
	}

	public int changePassword(UserVo vo) {
		return sqlSession.update("mypage.changePassword", vo);
	}

	public int deleteUser(UserVo vo) {
		return sqlSession.delete("mypage.deleteUser", vo);
	}

	public String lookUpPassword(String email) {
		return sqlSession.selectOne("mypage.lookUpPassword", email);
	}

	public void foreignKeyChecks(long l) {
		sqlSession.update("mypage.foreignKeyChecks", 0L);
	}

	public List<ProblemVo> selectProblemList(int displayPost, int postNum, Long userNo) {
		Map<String,Object> map = new HashMap<>();
		map.put("displayPost",displayPost);
		map.put("postNum",postNum);	
		map.put("userNo",userNo);		
		List<ProblemVo> list = sqlSession.selectList("mypage.selectProblemList",map);
		return list;
	}
	
	public int deleteProblem(Long no) {
		return sqlSession.delete("mypage.deleteProblem", no);
	}

	public List<SubmitVo> problemSolveList(Long no) {
		return sqlSession.selectList("mypage.problemSolveList", no);
	}

	public int getTotalCount(Long userNo) {
		return sqlSession.selectOne("mypage.totalCount", userNo);
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