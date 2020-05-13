package com.compile.compiletest.vo;

import java.util.Date;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class UserVo {
	private Long no;
	
	 
	private String name;
	
	@NotEmpty
	@Length(min=1,max=8)
	private String nickname;
	
	@NotEmpty
	@Email
	private String email;
	
	
	private Date birth;
	
	@NotEmpty
	@Length(min=4,max=16)
	private String password;
	
	
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
	@Override
	public String toString() {
		return "UserVo [no=" + no + ", name=" + name + ", nickname=" + nickname + ", email=" + email + ", birth="
				+ birth + ", password=" + password + "]";
	}
}
