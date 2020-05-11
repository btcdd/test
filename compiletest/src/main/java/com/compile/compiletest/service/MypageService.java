package com.compile.compiletest.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.compile.compiletest.repository.MypageRepository;

@Service
public class MypageService {

	@Autowired
	private MypageRepository mypageRepository;

	public int changeNickname(String nickname) {
		return mypageRepository.changeNickname(nickname);
	}

	public int changePassword(String password) {
		return mypageRepository.changePassword(password);
	}

	public int deleteUser(String password) {
		String email = "1sang@gmail.com";
		String result = mypageRepository.lookUpPassword(email);
		
		if(!result.equals(password)) {
			return 0;
		}
		
		mypageRepository.foreignKeyChecks(0L);
		int deleteUser = mypageRepository.deleteUser(email);
		mypageRepository.foreignKeyChecks(1L);
		
		return deleteUser;
	}
}