package com.yee.carebank.model.dao;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.PillsDto;

@Repository
public class PillsDaoImpl implements PillsDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(PillsDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error] : Pills insert");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int pills_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete", pills_no);
		} catch (Exception e) {
			System.out.println("[error] : Pills delete");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public PillsDto selectOne(int user_no) {
		PillsDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", user_no);
		} catch (Exception e) {
			System.out.println("[error] : pills selectOne");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<PillsDto> selectList(int user_no) {
		List<PillsDto> list = null;
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList", user_no);
		} catch (Exception e) {
			System.out.println("[error] : Pills selectList");
			e.printStackTrace();
		}
		return list;
	}

}
