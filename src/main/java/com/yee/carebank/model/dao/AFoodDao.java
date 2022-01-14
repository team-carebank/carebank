package com.yee.carebank.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.FoodDto;

@Repository
public class AFoodDao {
	private final String NAMESPACE = "admin.food.";
	@Autowired
	SqlSessionTemplate sqlSession;

	public List<FoodDto> selectFList(Map<String, Object> map) {
		List<FoodDto> res = new ArrayList<FoodDto>();

		try {
			res = sqlSession.selectList(NAMESPACE + "selectFList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public int getFTotalCount() {
		return sqlSession.selectOne(NAMESPACE + "getTotalCnt");
	}

	public int deleteFood(int food_id) {
		try {
			return sqlSession.delete(NAMESPACE + "deleteFood", food_id);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public int insertFood(FoodDto food) {
		try {
			return sqlSession.insert(NAMESPACE + "insertFood", food);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public int checkFName(String food) {
		try {
			return sqlSession.selectOne(NAMESPACE + "checkFood", food);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public FoodDto selectFood(int food_id) {
		try {
			return sqlSession.selectOne(NAMESPACE + "selectFood", food_id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int updateF(FoodDto food) {
		try {
			return sqlSession.update(NAMESPACE + "updateFood", food);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<FoodDto> searchFood(String keyword, Map<String, Object> map) {
		map.put("keyword", keyword);

		try {
			return sqlSession.selectList(NAMESPACE + "searchFood", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int getSearchCnt(String keyword) {
		try {
			return sqlSession.selectOne(NAMESPACE + "getSearchCnt", keyword);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

}
