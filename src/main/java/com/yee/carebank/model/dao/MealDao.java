package com.yee.carebank.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.FoodDto;
import com.yee.carebank.model.dto.MealDto;

@Repository
public class MealDao {
	private final String NAMESPACE = "meals.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<MealDto> selectMeal(int subcat_id) {
		List<MealDto> list = new ArrayList<MealDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectMeal", subcat_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<String> selectFood(int subcat_id) {
		List<String> list = new ArrayList<String>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectFood", subcat_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public String selectCategory(int subcat_id) {
		String res = null;

		try {
			res = sqlSession.selectOne(NAMESPACE + "selectCategory", subcat_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public MealDto selectOne(int meal_id) {
		MealDto res = null;

		try {
			res = sqlSession.selectOne(NAMESPACE + "selectOne", meal_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public List<FoodDto> selectIngredient(int meal_id) {
		List<FoodDto> res = new ArrayList<FoodDto>();

		try {
			res = sqlSession.selectList(NAMESPACE + "selectIngredient", meal_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public List<Integer> selectCatList() {
		List<Integer> res = new ArrayList<Integer>();

		try {
			res = sqlSession.selectList(NAMESPACE + "selectCatList");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public List<MealDto> selectRandom(int user_no) {
		List<MealDto> res = new ArrayList<MealDto>();

		try {
			res = sqlSession.selectList(NAMESPACE + "selectRandom", user_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public List<MealDto> selectByComment() {
		List<MealDto> res = new ArrayList<MealDto>();

		try {
			res = sqlSession.selectList(NAMESPACE + "selectByComment");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public List<Integer> selectPreferCat(int user_no) {
		List<Integer> res = new ArrayList<Integer>();

		try {
			res = sqlSession.selectList(NAMESPACE + "selectPreferCat", user_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}
}