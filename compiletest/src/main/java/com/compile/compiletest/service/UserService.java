package com.compile.compiletest.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
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

	private StringBuffer buffer;
	private Process process;
	private BufferedReader bufferedReader;
	
	@Autowired
	private UserRepository userRepository;
	
	public boolean join(UserVo vo) throws IOException, InterruptedException {
		userRepository.insert(vo);
		
		Long no = userRepository.findByEmail(vo.getEmail());
		
		
		// 리눅스 유저 파일 생성 코드
		buffer = new StringBuffer();
		buffer.append("mkdir userDirectory/user" + no + "\n");
		buffer.append("cd userDirectory/user" + no + "\n");
		buffer.append("mkdir c cpp cs java js py\n");
		
		try {
			process = Runtime.getRuntime().exec("mkdir userDirectory/user" + no + "\n");
			process = Runtime.getRuntime().exec("mkdir userDirectory/user" + no + "/c\n");
			process = Runtime.getRuntime().exec("mkdir userDirectory/user" + no + "/cpp\n");
			process = Runtime.getRuntime().exec("mkdir userDirectory/user" + no + "/cs\n");
			process = Runtime.getRuntime().exec("mkdir userDirectory/user" + no + "/java\n");
			process = Runtime.getRuntime().exec("mkdir userDirectory/user" + no + "/js\n");
			process = Runtime.getRuntime().exec("mkdir userDirectory/user" + no + "/py\n");
			bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return true;
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
		return userRepository.findByEmail(email) != null;
	}

	public boolean existNickname(String nickname) {
		return userRepository.findNickname(nickname) != null;
	}

	public boolean updatePassword(UserVo vo) {
		return userRepository.update(vo) == 1;
		
	}

	public String getNickname(String email) {
		return userRepository.findNicknameByEmail(email);
	}
	
}