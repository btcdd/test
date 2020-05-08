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
}