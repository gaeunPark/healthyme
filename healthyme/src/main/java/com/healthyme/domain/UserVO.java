package com.healthyme.domain;

import java.util.Date;

public class UserVO {
	private int userIdx;
	private String userid;
	private String userpw;
	private String username;
	private String email;
	private String gender;
	private Date regDate;
	private String height;
	private String goalWeight;
	
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
	public String getGoalWeight() {
		return goalWeight;
	}
	public void setGoalWeight(String goalWeight) {
		this.goalWeight = goalWeight;
	}
	@Override
	public String toString() {
		return "UserVO [userIdx=" + userIdx + ", userid=" + userid + ", userpw=" + userpw + ", username=" + username
				+ ", email=" + email + ", gender=" + gender + ", regDate=" + regDate + ", height=" + height
				+ ", goalWeight=" + goalWeight + "]";
	}
	
	
	
}
