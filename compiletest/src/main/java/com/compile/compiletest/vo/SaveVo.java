package com.compile.compiletest.vo;

public class SaveVo {
	Long no;
	Long userNo;
	Long problemNo;

	public Long getNo() {
		return no;
	}

	public void setNo(Long no) {
		this.no = no;
	}

	public Long getUserNo() {
		return userNo;
	}

	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}

	public Long getProblemNo() {
		return problemNo;
	}

	public void setProblemNo(Long problemNo) {
		this.problemNo = problemNo;
	}

	@Override
	public String toString() {
		return "SaveVo [no=" + no + ", userNo=" + userNo + ", problemNo=" + problemNo + "]";
	}

}
