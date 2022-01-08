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

	public List<String> selectInfo(int supple_id) {
		List<String> res = new ArrayList<String>();

		try {
			res = sqlSession.selectList(NAMESPACE + "selectInfo", supple_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public SuppleDto selectOne(int supple_id) {
		SuppleDto res = new SuppleDto();

		try {
			res = sqlSession.selectOne(NAMESPACE + "selectOne", supple_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public List<Integer> selectCatList() {
		List<Integer> res = new ArrayList<Integer>();

		try {
			res = sqlSession.selectList(NAMESPACE + "selectCatList");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}
}
