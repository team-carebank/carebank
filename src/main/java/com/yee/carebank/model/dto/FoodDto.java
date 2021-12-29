package com.yee.carebank.model.dto;

public class FoodDto {
	private String food;
	private String desrciption;
	private double carbo;
	private double protein;
	private double fat;
	private int calories;

	public FoodDto() {
		super();
	}

	public FoodDto(String food, String desrciption, double carbo, double protein, double fat, int calories) {
		super();
		this.food = food;
		this.desrciption = desrciption;
		this.carbo = carbo;
		this.protein = protein;
		this.fat = fat;
		this.calories = calories;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public String getDesrciption() {
		return desrciption;
	}

	public void setDesrciption(String desrciption) {
		this.desrciption = desrciption;
	}

	public double getCarbo() {
		return carbo;
	}

	public void setCarbo(double carbo) {
		this.carbo = carbo;
	}

	public double getProtein() {
		return protein;
	}

	public void setProtein(double protein) {
		this.protein = protein;
	}

	public double getFat() {
		return fat;
	}

	public void setFat(double fat) {
		this.fat = fat;
	}

	public int getCalories() {
		return calories;
	}

	public void setCalories(int calories) {
		this.calories = calories;
	}

}
