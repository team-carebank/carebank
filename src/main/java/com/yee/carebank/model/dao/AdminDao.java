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
public class AdminDao {

	private final String NAMESPACE_MEAL = "admin.meal.";
	private final String NAMESPACE_FOOD = "admin.food.";
	private final String NAMESPACE_SUPPLE = "admin.supple.";
	private final String NAMESPACE_EXER = "admin.exer.";
	private final String NAMESPACE_MEDI = "admin.medi.";

	@Autowired
	SqlSessionTemplate sqlSession;

	/*
	 * admin.meal
	 */

	public List<MealDto> selectMList(int start, int end) {
		List<MealDto> res = new ArrayList<MealDto>();
		Map<String, Integer> map = new HashMap<String, Integer>();

		map.put("start", start);
		map.put("end", end);

		try {
			res = sqlSession.selectList(NAMESPACE_MEAL + "selectMList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public int getMTotalCnt() {
		return sqlSession.selectOne(NAMESPACE_MEAL + "getMTotalCnt");
	}

	public List<CategoryDto> selectCList() {
		return sqlSession.selectList(NAMESPACE_MEAL + "selectCList");
	}

	@Transactional
	public int insertM(MealDto meal, List<FoodDto> foods) {
		try {
			sqlSession.insert(NAMESPACE_MEAL + "insertMeal", meal);

			for (int i = 0; i < foods.size(); i++) {
				FoodDto food = foods.get(i);
				sqlSession.insert(NAMESPACE_MEAL + "insertFood", food);

				Map<String, Object> map = new HashMap<String, Object>();

				map.put("meal_id", meal.getMeal_id());
				map.put("food_id", food.getFood_id());
				map.put("description", food.getDescription());

				sqlSession.insert(NAMESPACE_MEAL + "insertIng", map);
			}

			return 1;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return -1;
		}
	}

	public int deleteMeal(int meal_id) {
		return sqlSession.delete(NAMESPACE_MEAL + "deleteMeal", meal_id);
	}

	public int updateM(MealDto meal, List<FoodDto> food2) {
		try {
			// 재료 테이블에 존재하는 재료들 다 제거하기
			sqlSession.delete(NAMESPACE_MEAL + "deleteIng", meal.getMeal_id());

			sqlSession.update(NAMESPACE_MEAL + "updateMeal", meal);

			for (int i = 0; i < food2.size(); i++) {
				FoodDto food = food2.get(i);
				sqlSession.insert(NAMESPACE_MEAL + "insertFood", food);

				Map<String, Object> map = new HashMap<String, Object>();

				map.put("meal_id", meal.getMeal_id());
				map.put("food_id", food.getFood_id());
				map.put("description", food.getDescription());

				sqlSession.insert(NAMESPACE_MEAL + "insertIng", map);
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

		return sqlSession.selectList(NAMESPACE_MEAL + "searchMeal", map);
	}

	public List<MealDto> searchByCategory(String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);
		return sqlSession.selectList(NAMESPACE_MEAL + "searchCat", map);
	}

	public List<MealDto> searchAll(String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("start", start);
		map.put("end", end);
		map.put("keyword", keyword);
		return sqlSession.selectList(NAMESPACE_MEAL + "searchAll", map);
	}

	public int getAllCount(String keyword) {
		try {
			return sqlSession.selectOne(NAMESPACE_MEAL + "getAllCount", keyword);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int getCatCount(String keyword) {

		try {
			return sqlSession.selectOne(NAMESPACE_MEAL + "getCatCount", keyword);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int getMealCount(String keyword) {
		try {
			return sqlSession.selectOne(NAMESPACE_MEAL + "getMealCount", keyword);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	/*
	 * admin.food
	 */

	public List<FoodDto> selectFList(int start, int end) {
		List<FoodDto> res = new ArrayList<FoodDto>();
		Map<String, Integer> map = new HashMap<String, Integer>();

		map.put("start", start);
		map.put("end", end);

		try {
			res = sqlSession.selectList(NAMESPACE_FOOD + "selectFList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public int getFTotalCount() {
		return sqlSession.selectOne(NAMESPACE_FOOD + "getTotalCnt");
	}

	public int deleteFood(int food_id) {
		try {
			return sqlSession.delete(NAMESPACE_FOOD + "deleteFood", food_id);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public int insertFood(FoodDto food) {
		try {
			return sqlSession.insert(NAMESPACE_FOOD + "insertFood", food);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public int checkFName(String food) {
		try {
			return sqlSession.selectOne(NAMESPACE_FOOD + "checkFood", food);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public FoodDto selectFood(int food_id) {
		try {
			return sqlSession.selectOne(NAMESPACE_FOOD + "selectFood", food_id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int updateF(FoodDto food) {
		try {
			return sqlSession.update(NAMESPACE_FOOD + "updateFood", food);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
}