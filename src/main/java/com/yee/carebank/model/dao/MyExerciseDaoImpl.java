package com.yee.carebank.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.FaqDto;
import com.yee.carebank.model.dto.MyExerciseDto;

@Repository
public class MyExerciseDaoImpl implements MyExerciseDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<MyExerciseDto> selectList(){
		
		List<MyExerciseDto> list=new ArrayList<MyExerciseDto>();
		
		try {
			list=sqlSession.selectList(NAMESPACE+"selectList");
		}catch(Exception e) {
			System.out.println("selectlist error");
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public int selectOne(Integer user_no) {
		
		int dto=0;
		
		try {
			dto=sqlSession.selectOne(NAMESPACE+"selectOne",user_no);
		}catch(Exception e) {
			System.out.println("error:selectone");
			e.printStackTrace();
		}
		return dto;
	}
 

//	@Override
//	public int insert(MyExerciseDto dto) throws Exception{
//		return sqlSession.insert(NAMESPACE+"insert", dto);
//	}
	
//	public int insert(MyExerciseDto dto) {
//		int res = 0;
//		
//		try {
//			res = sqlSession.insert(NAMESPACE + "insert", dto);
//		} catch (Exception e) {
//			System.out.println(" insert error ");
//			e.printStackTrace();
//		}
//		return res;
//	
//	}

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
 
	
	
	 

	
}
