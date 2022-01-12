package com.yee.carebank.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.CategoryDto;
import com.yee.carebank.model.dto.MealDto;

@Repository
public class AdminDao {

	private final String NAMESPACE = "admin.";

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

}
