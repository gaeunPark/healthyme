package com.healthyme.domain;

public class UserInfoVO {
	private int userIdx;
	private String weight;
	private String date;
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "UserInfoVO [userIdx=" + userIdx + ", weight=" + weight + ", date=" + date + "]";
	}
	
	
	
}
