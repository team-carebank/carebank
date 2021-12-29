package com.yee.carebank.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.MealDto;

@Repository
public class MealDao {
	private final String NAMESPACE = "meals.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<MealDto> selectGallery(int subcat_id) {
		List<MealDto> list = new ArrayList<MealDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectGallery", subcat_id);
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
}