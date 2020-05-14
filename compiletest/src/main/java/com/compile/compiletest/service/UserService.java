package com.compile.compiletest.service;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.compile.compiletest.repository.UserRepository;
import com.compile.compiletest.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private JavaMailSender mailSender;

	
	@Autowired
	private UserRepository userRepository;
	
	public boolean join(UserVo vo) {
		return userRepository.insert(vo) == 1;
	}

	public String sendMail(String email,int tempKey) {

		
		try {
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setTo(email);
			messageHelper.setText("인증번호 : "+tempKey);
			messageHelper.setFrom("codeforest2020@gmail.com");
			messageHelper.setSubject("[회원가입 인증번호]");
			
			mailSender.send(message);

		}catch(Exception e) {
			System.out.println(e);
		}
		
		return "success";



	}

	public int getTempKey() {
		int random = new Random().nextInt(900000)+100000;
		return random;
		
	}

	public UserVo getUser(UserVo vo) {
		return userRepository.findByEmailAndPassword(vo);
	}

	public boolean existUser(String email) {
		return userRepository.find(email) != null;
	}

	public boolean existNickname(String nickname) {
		return userRepository.findNickname(nickname) != null;
	}

	public boolean updatePassword(String password,String email) {
		return userRepository.update(password,email) == 1;
		
	}
	
}