package com.compile.compiletest.vo;

import java.sql.Timestamp;

public class SubmitVo {
	private String name;
	private String nickname;
	private String email;
	private String code;
	private char answer;
	private Long problemNo;
	private Long userNo;
	private Timestamp solveTime;
	private String lang;
	private int tryCount;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public char getAnswer() {
		return answer;
	}
	public void setAnswer(char answer) {
		this.answer = answer;
	}
	public Long getProblemNo() {
		return problemNo;
	}
	public void setProblemNo(Long problemNo) {
		this.problemNo = problemNo;
	}
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public Timestamp getSolveTime() {
		return solveTime;
	}
	public void setSolveTime(Timestamp solveTime) {
		this.solveTime = solveTime;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getLang() {
		return lang;
	}
	public void setLang(String lang) {
		this.lang = lang;
	}
	public int getTryCount() {
		return tryCount;
	}
	public void setTryCount(int tryCount) {
		this.tryCount = tryCount;
	}
	@Override
	public String toString() {
		return "SubmitVo [name=" + name + ", nickname=" + nickname + ", email=" + email + ", code=" + code + ", answer="
				+ answer + ", problemNo=" + problemNo + ", userNo=" + userNo + ", solveTime=" + solveTime + ", lang="
				+ lang + ", tryCount=" + tryCount + "]";
	}
	

}
