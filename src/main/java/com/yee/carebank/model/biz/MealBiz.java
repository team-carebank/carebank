package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.MealDao;
import com.yee.carebank.model.dto.FoodDto;
import com.yee.carebank.model.dto.MealDto;

@Service
public class MealBiz {

	@Autowired
	MealDao dao;

	public List<MealDto> selectMeal(int subcat_id) {
		return dao.selectMeal(subcat_id);
	}

	public List<String> selectFood(int subcat_id) {
		return dao.selectFood(subcat_id);
	}

	public String selectCategory(int subcat_id) {
		return dao.selectCategory(subcat_id);
	}

	public MealDto selectOne(int meal_id) {
		return dao.selectOne(meal_id);
	}

	public List<FoodDto> selectIngredient(int meal_id) {
		return dao.selectIngredient(meal_id);
	}

	public List<Integer> selectCatList() {
		return dao.selectCatList();
	}

	public List<FoodDto> selectRandom(int user_no) {
		return dao.selectRandom(user_no);
	}

	public List<FoodDto> selectByComment() {
		return dao.selectByComment();
	}

	public List<Integer> selectPreferCat(int user_no) {
		return dao.selectPreferCat(user_no);
	}
}
