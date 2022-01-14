package com.yee.carebank.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.yee.carebank.model.dto.CategoryDto;
import com.yee.carebank.model.dto.FoodDto;
import com.yee.carebank.model.dto.MealDto;

@Repository
public class AMealDao {

	private final String NAMESPACE = "admin.meal.";

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<MealDto> selectMList(int start, int end) {
		List<MealDto> res = new ArrayList<MealDto>();
		Map<String, Integer> map = new HashMap<String, Integer>();

		map.put("start", start);
		map.put("end", end);

		try {
			res = sqlSession.selectList(NAMESPACE + "selectMList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public int getMTotalCnt() {
		return sqlSession.selectOne(NAMESPACE + "getMTotalCnt");
	}

	public List<CategoryDto> selectCList() {
		return sqlSession.selectList(NAMESPACE + "selectCList");
	}

	@Transactional
	public int insertM(MealDto meal, List<FoodDto> foods) {
		try {
			sqlSession.insert(NAMESPACE + "insertMeal", meal);

			for (int i = 0; i < foods.size(); i++) {
				FoodDto food = foods.get(i);
				sqlSession.insert(NAMESPACE + "insertFood", food);

				Map<String, Object> map = new HashMap<String, Object>();

				map.put("meal_id", meal.getMeal_id());
				map.put("food_id", food.getFood_id());
				map.put("description", food.getDescription());

				sqlSession.insert(NAMESPACE + "insertIng", map);
			}

			return 1;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return -1;
		}
	}

	public int deleteMeal(int meal_id) {
		return sqlSession.delete(NAMESPACE + "deleteMeal", meal_id);
	}

	public int updateM(MealDto meal, List<FoodDto> food2) {
		try {
			// 재료 테이블에 존재하는 재료들 다 제거하기
			sqlSession.delete(NAMESPACE + "deleteIng", meal.getMeal_id());

			sqlSession.update(NAMESPACE + "updateMeal", meal);

			for (int i = 0; i < food2.size(); i++) {
				FoodDto food = food2.get(i);
				sqlSession.insert(NAMESPACE + "insertFood", food);

				Map<String, Object> map = new HashMap<String, Object>();

				map.put("meal_id", meal.getMeal_id());
				map.put("food_id", food.getFood_id());
				map.put("description", food.getDescription());

				sqlSession.insert(NAMESPACE + "insertIng", map);
			}

			return 1;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return -1;
		}
	}

	public List<MealDto> searchByName(String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);

		return sqlSession.selectList(NAMESPACE + "searchMeal", map);
	}

	public List<MealDto> searchByCategory(String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);
		return sqlSession.selectList(NAMESPACE + "searchCat", map);
	}

	public List<MealDto> searchAll(String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);
		return sqlSession.selectList(NAMESPACE + "searchAll", map);
	}

	public int getAllCount(String keyword) {
		try {
			return sqlSession.selectOne(NAMESPACE + "getAllCount", keyword);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int getCatCount(String keyword) {

		try {
			return sqlSession.selectOne(NAMESPACE + "getCatCount", keyword);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int getMealCount(String keyword) {
		try {
			return sqlSession.selectOne(NAMESPACE + "getMealCount", keyword);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}