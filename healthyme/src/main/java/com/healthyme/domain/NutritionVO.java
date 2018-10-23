package com.healthyme.domain;

public class NutritionVO {
	private String sumKcal;
	private String sumCarbo;
	private String sumProtein;
	private String sumFat;
	private String sumSugars;
	private String sumSudium;
	private String date;
	
	public String getSumKcal() {
		return sumKcal;
	}
	public void setSumKcal(String sumKcal) {
		this.sumKcal = sumKcal;
	}
	public String getSumCarbo() {
		return sumCarbo;
	}
	public void setSumCarbo(String sumCarbo) {
		this.sumCarbo = sumCarbo;
	}
	public String getSumProtein() {
		return sumProtein;
	}
	public void setSumProtein(String sumProtein) {
		this.sumProtein = sumProtein;
	}
	public String getSumFat() {
		return sumFat;
	}
	public void setSumFat(String sumFat) {
		this.sumFat = sumFat;
	}
	public String getSumSugars() {
		return sumSugars;
	}
	public void setSumSugars(String sumSugars) {
		this.sumSugars = sumSugars;
	}
	public String getSumSudium() {
		return sumSudium;
	}
	public void setSumSudium(String sumSudium) {
		this.sumSudium = sumSudium;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "NutritionVO [sumKcal=" + sumKcal + ", sumCarbo=" + sumCarbo + ", sumProtein=" + sumProtein + ", sumFat="
				+ sumFat + ", sumSugars=" + sumSugars + ", sumSudium=" + sumSudium + ", date=" + date + "]";
	}
	
	
	
	
	
	
	
}
