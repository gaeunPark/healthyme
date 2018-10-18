package com.healthyme.domain;

import java.util.Date;

public class UserDietVO {
	private int userIdx;
	private int timeslot;
	private Date date;
	private String foodName;
	private String servingWt;
	private String kcal;
	private String carbo;
	private String protein;
	private String fat;
	private String sugars;
	private String sodium;
	private String enterprise;
	
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public int getTimeslot() {
		return timeslot;
	}
	public void setTimeslot(int timeslot) {
		this.timeslot = timeslot;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getServingWt() {
		return servingWt;
	}
	public void setServingWt(String servingWt) {
		this.servingWt = servingWt;
	}
	public String getKcal() {
		return kcal;
	}
	public void setKcal(String kcal) {
		this.kcal = kcal;
	}
	public String getCarbo() {
		return carbo;
	}
	public void setCarbo(String carbo) {
		this.carbo = carbo;
	}
	public String getProtein() {
		return protein;
	}
	public void setProtein(String protein) {
		this.protein = protein;
	}
	public String getFat() {
		return fat;
	}
	public void setFat(String fat) {
		this.fat = fat;
	}
	public String getSugars() {
		return sugars;
	}
	public void setSugars(String sugars) {
		this.sugars = sugars;
	}
	public String getSodium() {
		return sodium;
	}
	public void setSodium(String sodium) {
		this.sodium = sodium;
	}
	public String getEnterprise() {
		return enterprise;
	}
	public void setEnterprise(String enterprise) {
		this.enterprise = enterprise;
	}
	@Override
	public String toString() {
		return "UserDietVO [userIdx=" + userIdx + ", timeslot=" + timeslot + ", date=" + date + ", foodName=" + foodName
				+ ", servingWt=" + servingWt + ", kcal=" + kcal + ", carbo=" + carbo + ", protein=" + protein + ", fat="
				+ fat + ", sugars=" + sugars + ", sodium=" + sodium + ", enterprise=" + enterprise + "]";
	}
	
	
	
	
}
