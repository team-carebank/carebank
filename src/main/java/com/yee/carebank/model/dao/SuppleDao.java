package com.yee.carebank.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.SuppleDto;

@Repository
public class SuppleDao {
	private final String NAMESPACE = "supple.";

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<SuppleDto> selectList(int subcat_id) {
		List<SuppleDto> res = new ArrayList<SuppleDto>();

		try {
			res = sqlSession.selectList(NAMESPACE + "selectList", subcat_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}
}
