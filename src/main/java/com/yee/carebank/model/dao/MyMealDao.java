package com.yee.carebank.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.MyMealDto;

@Repository
public class MyMealDao {
	private final String NAMESPACE = "mymeal.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insert(MyMealDto dto) {
		int res = 0;

		res = sqlSession.insert(NAMESPACE + "insert", dto);

		return res;
	}
}
