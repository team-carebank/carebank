package com.yee.carebank.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.TmMealDto;

@Repository
public class TmMealDaoImpl implements TmMealDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<TmMealDto> selectList(int user_no) {
		List<TmMealDto> dto = null;

		try {
			dto = sqlSession.selectList(NAMESPACE + "selectTM", user_no);
		} catch (Exception e) {
			System.out.println("error in TMDAO");
			e.printStackTrace();
		}
		return dto;
	}

}
