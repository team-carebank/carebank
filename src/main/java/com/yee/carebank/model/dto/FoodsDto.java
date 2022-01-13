package com.yee.carebank.model.dto;

import java.util.List;

public class FoodsDto {
	private List<FoodDto> foods;

	public FoodsDto() {
		super();
	}

	public FoodsDto(List<FoodDto> foods) {
		super();
		this.foods = foods;
	}

	public List<FoodDto> getFoods() {
		return foods;
	}

	public void setFoods(List<FoodDto> foods) {
		this.foods = foods;
	}

}
