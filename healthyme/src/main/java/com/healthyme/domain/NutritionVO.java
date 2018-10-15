package com.healthyme.domain;

public class NutritionVO {
	private String foodName;
	private float servingWt;
	private float kcal;
	private float carbo;
	private float protein;
	private float fat;
	private float saturatedFat;
	private float transFat;
	private float sugars;
	private float sodium;
	private float cholesterol;
	private int searchCount;
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public float getServingWt() {
		return servingWt;
	}
	public void setServingWt(float servingWt) {
		this.servingWt = servingWt;
	}
	public float getKcal() {
		return kcal;
	}
	public void setKcal(float kcal) {
		this.kcal = kcal;
	}
	public float getCarbo() {
		return carbo;
	}
	public void setCarbo(float carbo) {
		this.carbo = carbo;
	}
	public float getProtein() {
		return protein;
	}
	public void setProtein(float protein) {
		this.protein = protein;
	}
	public float getFat() {
		return fat;
	}
	public void setFat(float fat) {
		this.fat = fat;
	}
	public float getSaturatedFat() {
		return saturatedFat;
	}
	public void setSaturatedFat(float saturatedFat) {
		this.saturatedFat = saturatedFat;
	}
	public float getTransFat() {
		return transFat;
	}
	public void setTransFat(float transFat) {
		this.transFat = transFat;
	}
	public float getSugars() {
		return sugars;
	}
	public void setSugars(float sugars) {
		this.sugars = sugars;
	}
	public float getSodium() {
		return sodium;
	}
	public void setSodium(float sodium) {
		this.sodium = sodium;
	}
	public float getCholesterol() {
		return cholesterol;
	}
	public void setCholesterol(float cholesterol) {
		this.cholesterol = cholesterol;
	}
	public int getSearchCount() {
		return searchCount;
	}
	public void setSearchCount(int searchCount) {
		this.searchCount = searchCount;
	}
	
	@Override
	public String toString() {
		return "NutritionVO [foodName=" + foodName + ", servingWt=" + servingWt + ", kcal=" + kcal + ", carbo=" + carbo
				+ ", protein=" + protein + ", fat=" + fat + ", saturatedFat=" + saturatedFat + ", transFat=" + transFat
				+ ", sugars=" + sugars + ", sodium=" + sodium + ", cholesterol=" + cholesterol + ", searchCount="
				+ searchCount + "]";
	}
}
