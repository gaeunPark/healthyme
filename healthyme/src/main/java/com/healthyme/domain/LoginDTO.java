package com.healthyme.domain;

public class LoginDTO {
	private int userIdx;
	private String userid;
	private String userpw;
	private boolean useCookie;
	
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
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	@Override
	public String toString() {
		return "LoginDTO [userIdx=" + userIdx + ", userid=" + userid + ", userpw=" + userpw + ", useCookie=" + useCookie
				+ "]";
	}
	
	
}
