package com.yee.carebank.model.dto;

public class FoodDto {
	private String food;
	private String description;
	private double carbo;
	private double protein;
	private double fat;
	private int calories;

	public FoodDto() {
		super();
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public FoodDto(String food, String description, double carbo, double protein, double fat, int calories) {
		super();
		this.food = food;
		this.description = description;
		this.carbo = carbo;
		this.protein = protein;
		this.fat = fat;
		this.calories = calories;
	}

	@Override
	public String toString() {
		return "FoodDto [food=" + food + ", description=" + description + ", carbo=" + carbo + ", protein=" + protein
				+ ", fat=" + fat + ", calories=" + calories + "]";
	}

}