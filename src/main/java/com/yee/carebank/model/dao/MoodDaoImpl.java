package com.yee.carebank.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.MoodDto;

@Repository
public class MoodDaoImpl implements MoodDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(MoodDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert",dto);
		} catch (Exception e) {
			System.out.println("[error] : insert");
			e.printStackTrace();
		}
		return res;
	}	
	
}
