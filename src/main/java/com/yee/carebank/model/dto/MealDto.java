package com.yee.carebank.model.dto;

public class MealDto {
	private int meal_id;
	private String meal_name;
	private String recipe;
	private int subcat_id;
	private String subcat_name;
	private String src;
	private int supercat_id;

	public MealDto() {
		super();
	}

	public MealDto(int meal_id, String meal_name, String recipe, int subcat_id, String subcat_name, String src,
			int supercat_id) {
		super();
		this.meal_id = meal_id;
		this.meal_name = meal_name;
		this.recipe = recipe;
		this.subcat_id = subcat_id;
		this.subcat_name = subcat_name;
		this.src = src;
		this.supercat_id = supercat_id;
	}

	public MealDto(String meal_name, String recipe, int subcat_id, String src) {
		super();
		this.meal_name = meal_name;
		this.recipe = recipe;
		this.subcat_id = subcat_id;
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

	public int getSubcat_id() {
		return subcat_id;
	}

	public void setSubcat_id(int subcat_id) {
		this.subcat_id = subcat_id;
	}

	public String getSubcat_name() {
		return subcat_name;
	}

	public void setSubcat_name(String subcat_name) {
		this.subcat_name = subcat_name;
	}

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public int getSupercat_id() {
		return supercat_id;
	}

	public void setSupercat_id(int supercat_id) {
		this.supercat_id = supercat_id;
	}

}
