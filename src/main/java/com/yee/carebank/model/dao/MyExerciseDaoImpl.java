package com.yee.carebank.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.ExerciseDto;
import com.yee.carebank.model.dto.MyExerciseDto;

@Repository
public class MyExerciseDaoImpl implements MyExerciseDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MyExerciseDto> selectList(){

		
		List<MyExerciseDto> list=new ArrayList<MyExerciseDto>();
		
		try {
		list=sqlSession.selectList(NAMESPACE+"selectList"); 
		}catch(Exception e) {
			System.out.println("error, select list");
			e.printStackTrace();
		}
		return list;
		
	}
	
}
