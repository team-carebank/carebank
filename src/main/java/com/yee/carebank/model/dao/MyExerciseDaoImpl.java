package com.yee.carebank.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.ExerciseDto;
import com.yee.carebank.model.dto.FaqDto;
import com.yee.carebank.model.dto.MyExerciseDto;
import com.yee.carebank.model.dto.UserDto;

@Repository
public class MyExerciseDaoImpl implements MyExerciseDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	 
//	
//	@Override
//	public int selectOne(int user_no) {
//		
//		int dto=0;
//		
//		try {
//			dto=sqlSession.selectOne(NAMESPACE+"selectOne",user_no);
//		}catch(Exception e) {
//			System.out.println("error:selectone");
//			e.printStackTrace();
//		}
//		return dto;
//	}
// 
// 
	@Override
	public int insert(MyExerciseDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert",dto);
		} catch (Exception e) {
			System.out.println(" DAOinsert error ");
			e.printStackTrace();
		}
		return res;
	}

@Override
public List<MyExerciseDto> selectList(int user_no) { 
	List<MyExerciseDto> dto=null;
	
	try {
		dto=sqlSession.selectList(NAMESPACE+"selectList",user_no);
	}catch(Exception e) {
		System.out.println("errorin DAOㅡㅡ");
		e.printStackTrace();
	} 
	return dto;
}
 
 
	
	 

	
}
