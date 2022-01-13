package com.yee.carebank.model.dto;

import java.util.List;

public class FoodDto {
	private int food_id;
	private String food;
	private String description;
	private double carbo;
	private double protein;
	private double fat;
	private double calories;

	private List<FoodDto> foods;

	public FoodDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FoodDto(int food_id, String food, String description, double carbo, double protein, double fat,
			double calories) {
		super();
		this.food_id = food_id;
		this.food = food;
		this.description = description;
		this.carbo = carbo;
		this.protein = protein;
		this.fat = fat;
		this.calories = calories;
	}

	public FoodDto(String food, String description, double carbo, double protein, double fat, double calories) {
		super();
		this.food = food;
		this.description = description;
		this.carbo = carbo;
		this.protein = protein;
		this.fat = fat;
		this.calories = calories;
	}

	public int getFood_id() {
		return food_id;
	}

	public void setFood_id(int food_id) {
		this.food_id = food_id;
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

	public double getCalories() {
		return calories;
	}

	public void setCalories(double calories) {
		this.calories = calories;
	}

	public FoodDto(int food_id, String food, String description, double carbo, double protein, double fat,
			double calories, List<FoodDto> foods) {
		super();
		this.food_id = food_id;
		this.food = food;
		this.description = description;
		this.carbo = carbo;
		this.protein = protein;
		this.fat = fat;
		this.calories = calories;
		this.foods = foods;
	}

	public FoodDto(String food, String description, String carbo, String protein, String fat, String calories) {
		this.food = food;
		this.description = description;
		this.carbo = Double.parseDouble(carbo);
		this.protein = Double.parseDouble(protein);
		this.fat = Double.parseDouble(fat);
		this.calories = Double.parseDouble(calories);
	}

	public List<FoodDto> getFoods() {
		return foods;
	}

	public void setFoods(List<FoodDto> foods) {
		this.foods = foods;
	}

}
