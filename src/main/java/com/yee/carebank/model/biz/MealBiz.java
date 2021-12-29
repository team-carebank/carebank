package com.yee.carebank.model.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.MealDao;
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

	public Map<String, Object> selectOne(int meal_id) {
		Map<String, Object> res = new HashMap<String, Object>();

		res.put("meal", dao.selectOne(meal_id));
		res.put("ingredient", dao.selectOne(meal_id));

		return res;
	}
}
