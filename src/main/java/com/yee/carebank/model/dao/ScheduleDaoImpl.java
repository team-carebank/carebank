package com.yee.carebank.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.ScheduleDto;

@Repository
public class ScheduleDaoImpl implements ScheduleDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<ScheduleDto> selectList(int user_no) {
		List<ScheduleDto> list = new ArrayList<ScheduleDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList", user_no);
		} catch (Exception e) {
			System.out.println("[error] : select list");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int insert(ScheduleDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert", dto);
		} catch (Exception e) {
			System.out.println("[error] : insert");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(ScheduleDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update",dto);
		} catch (Exception e) {
			System.out.println("[error] : update ");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public ScheduleDto selectOne(int hospital_no) {
		ScheduleDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", hospital_no);
		} catch (Exception e) {
			System.out.println("[error] : selectOne");
			e.printStackTrace();
		}
		return dto;
	}

}
