package com.compile.compiletest.vo;

import java.sql.Timestamp;
import java.util.Date;

public class ProblemVo {
	private Long no;
	private String title;
	private String password;
	private Long hit;
	private Long recommend;
	private Date regDate;
	private Long userNo;
	private Long categoryNo;
	private Timestamp startTime;
	private Timestamp endTime;
	private Long levelNo;
	
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Long getHit() {
		return hit;
	}
	public void setHit(Long hit) {
		this.hit = hit;
	}
	public Long getRecommend() {
		return recommend;
	}
	public void setRecommend(Long recommend) {
		this.recommend = recommend;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Long getUserNo() {
		return userNo;
	}
	public void setUserNo(Long userNo) {
		this.userNo = userNo;
	}
	public Long getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(Long categoryNo) {
		this.categoryNo = categoryNo;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}
	public Long getLevelNo() {
		return levelNo;
	}
	public void setLevelNo(Long levelNo) {
		this.levelNo = levelNo;
	}
	
	@Override
	public String toString() {
		return "ProblemVo [no=" + no + ", title=" + title + ", password=" + password + ", hit=" + hit + ", recommend="
				+ recommend + ", regDate=" + regDate + ", userNo=" + userNo + ", categoryNo=" + categoryNo
				+ ", startTime=" + startTime + ", endTime=" + endTime + ", levelNo=" + levelNo + "]";
	}	
}
