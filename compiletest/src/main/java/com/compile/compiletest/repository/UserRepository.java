package com.compile.compiletest.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.compile.compiletest.vo.UserVo;

@Repository
public class UserRepository {
	
	@Autowired
	private SqlSession sqlSession;

	
	public int insert(UserVo vo) {
		return sqlSession.insert("user.insert", vo);
	}


	public UserVo findByEmailAndPassword(UserVo vo) {
		return sqlSession.selectOne("user.findByEmailAndPassword", vo);
	}


	public Object find(String email) {
		return sqlSession.selectOne("user.findByEmail", email);
	}


	public Object findNickname(String nickname) {
		return sqlSession.selectOne("user.findByNickname", nickname);
	}


	public int update(String password,String email) {
		Map<String,String> map = new HashMap<>();
		map.put("password",password);
		map.put("email", email);
		return sqlSession.update("user.updatePasswordAndEmail",map);
	}

}
