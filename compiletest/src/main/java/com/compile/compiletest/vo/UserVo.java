package com.compile.compiletest.vo;

import java.util.Date;

public class UserVo {
	private Long no;
	private String name;
	private String nickname;
	private String email;
	private Date birth;
	private String password;
	private char authStatus;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
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
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public char getAuthStatus() {
		return authStatus;
	}
	public void setAuthStatus(char authStatus) {
		this.authStatus = authStatus;
	}
	
	@Override
	public String toString() {
		return "UserVo [no=" + no + ", name=" + name + ", nickname=" + nickname + ", email=" + email + ", birth="
				+ birth + ", password=" + password + ", authStatus=" + authStatus + "]";
	}
}
