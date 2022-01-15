package com.yee.carebank.model.dto;

public class TmMealDto {

	public int meal_id;
	public String meal_name;
	public int calories;
	public int fat;
	public int carbo;
	public int protein;
	
	public TmMealDto() {
		super();
	}
	public TmMealDto(int meal_id, String meal_name, int calories, int fat, int carbo, int protein) {
		super();
		this.meal_id = meal_id;
		this.meal_name = meal_name;
		this.calories = calories;
		this.fat = fat;
		this.carbo = carbo;
		this.protein = protein;
	}
	public int getMeal_id() {
		return meal_id;
	}
	public void setMeal_id(int meal_id) {
		this.meal_id = meal_id;
	}
	public String getMeal_name() {
		return meal_name;
	}
	public void setMeal_name(String meal_name) {
		this.meal_name = meal_name;
	}
	public int getCalories() {
		return calories;
	}
	public void setCalories(int calories) {
		this.calories = calories;
	}
	public int getFat() {
		return fat;
	}
	public void setFat(int fat) {
		this.fat = fat;
	}
	public int getCarbo() {
		return carbo;
	}
	public void setCarbo(int carbo) {
		this.carbo = carbo;
	}
	public int getProtein() {
		return protein;
	}
	public void setProtein(int protein) {
		this.protein = protein;
	}
	
	
	
	
}
