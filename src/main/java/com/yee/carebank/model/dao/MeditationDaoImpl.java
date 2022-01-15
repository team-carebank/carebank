package com.yee.carebank.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
import com.yee.carebank.model.dto.ExerciseDto;
import com.yee.carebank.model.dto.MeditationDto;

@Repository
public class MeditationDaoImpl implements MeditationDao{


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MeditationDto> selectList() { 
		
		
		List<MeditationDto> list=new ArrayList<MeditationDto>();
		
		try {
		list=sqlSession.selectList(NAMESPACE+"selectList"); 
		}catch(Exception e) {
			System.out.println("error, select list");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public MeditationDto selectOne(int meditate_id) { 
		MeditationDto dto=null;
		

		try {
		dto=sqlSession.selectOne(NAMESPACE+"selectOne", meditate_id);
		}catch(Exception e) {
			System.out.println("[error] : select one");
			e.printStackTrace();
		}
		
		return dto;
	}

	
	 
}
