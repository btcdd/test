package com.compile.compiletest.vo;

public class CodePathVo {

	Long savePathNo;
	String codePath;

	public Long getSavePathNo() {
		return savePathNo;
	}

	public void setSavePathNo(Long savePathNo) {
		this.savePathNo = savePathNo;
	}

	public String getCodePath() {
		return codePath;
	}

	public void setCodePath(String codePath) {
		this.codePath = codePath;
	}

	@Override
	public String toString() {
		return "CodePathVo [savePathNo=" + savePathNo + ", codePath=" + codePath + "]";
	}

}
