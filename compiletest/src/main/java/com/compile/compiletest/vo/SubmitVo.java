package com.compile.compiletest.vo;

import java.sql.Timestamp;

public class SubmitVo {
	private String code;
	private char answer;
	private Long problemNo;
	private Long userNo;
	private Timestamp solveTime;
	
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
	
	@Override
	public String toString() {
		return "SubmitVo [code=" + code + ", answer=" + answer + ", problemNo=" + problemNo + ", userNo=" + userNo
				+ ", solveTime=" + solveTime + "]";
	}
}
