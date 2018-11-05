package com.healthyme.domain;

public class CalenderDTO {
	private String weight;
	private String date;
	private String sumKcal;
	
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
	public String getSumKcal() {
		return sumKcal;
	}
	public void setSumKcal(String sumKcal) {
		this.sumKcal = sumKcal;
	}
	
	@Override
	public String toString() {
		return "CalenderDTO [weight=" + weight + ", date=" + date + ", sumKcal=" + sumKcal
				+ "]";
	}
	
	
}
