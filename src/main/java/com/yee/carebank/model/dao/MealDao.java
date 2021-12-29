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

	public List<MealDto> selectList(int subcat_id) {
		List<MealDto> list = new ArrayList<MealDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList", subcat_id);
		} catch (Exception e) {
			System.out.println("[error] : select list");
			e.printStackTrace();
		}

		return list;
	}
}
