package com.yee.carebank.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.MealDto;

@Repository
public class AdminDao {

	private final String NAMESPACE = "admin.";

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<MealDto> selectMList(@Param(value = "start") int start, @Param(value = "end") int end) {
		List<MealDto> res = new ArrayList<MealDto>();

		try {
			res = sqlSession.selectList(NAMESPACE + "selectMList");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

}
