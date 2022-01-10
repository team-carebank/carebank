package com.yee.carebank.model.dao;

import java.util.List;

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

	public List<MyMealDto> selectList(int user_no) {
		List<MyMealDto> res = new java.util.ArrayList<MyMealDto>();

		res = sqlSession.selectList(NAMESPACE + "selectList", user_no);

		return res;
	}

	public MyMealDto selectOne(int record_id) {
		MyMealDto res = new MyMealDto();

		res = sqlSession.selectOne(NAMESPACE + "selectOne", record_id);

		return res;
	}

	public int update(MyMealDto dto) {
		int res = 0;

		res = sqlSession.update(NAMESPACE + "update", dto);

		return res;
	}

	public int delete(int record_id) {
		int res = 0;

		res = sqlSession.delete(NAMESPACE + "delete", record_id);

		return res;
	}
}
