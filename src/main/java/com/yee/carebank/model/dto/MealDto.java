package com.yee.carebank.model.dto;

public class MealDto {
	private int meal_id;
	private String meal_name;
	private String recipe;
	private String food;
	private String description;
	private int subcat_id;
	private double carbo;
	private double protein;
	private double fat;
	private double calories;
	private String src;

	public MealDto() {
		super();
	}

	public MealDto(int meal_id, String meal_name, String recipe, String food, String description, int subcat_id,
			double carbo, double protein, double fat, double calories, String src) {
		super();
		this.meal_id = meal_id;
		this.meal_name = meal_name;
		this.recipe = recipe;
		this.food = food;
		this.description = description;
		this.subcat_id = subcat_id;
		this.carbo = carbo;
		this.protein = protein;
		this.fat = fat;
		this.calories = calories;
		this.src = src;
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

	public String getRecipe() {
		return recipe;
	}

	public void setRecipe(String recipe) {
		this.recipe = recipe;
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

	public int getSubcat_id() {
		return subcat_id;
	}

	public void setSubcat_id(int subcat_id) {
		this.subcat_id = subcat_id;
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

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

}
