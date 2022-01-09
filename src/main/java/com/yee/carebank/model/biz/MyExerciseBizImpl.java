 package com.yee.carebank.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.MyExerciseDao;
import com.yee.carebank.model.dto.MyExerciseDto;

@Service
public class MyExerciseBizImpl implements MyExerciseBiz{
	
	@Autowired
	private MyExerciseDao dao;
	
	public List<MyExerciseDto> selectList(){
		
		return dao.selectList();
	}
	
//	public MyExerciseDto selectOne(Integer user_no) {
//		return dao.selectOne(user_no);
//	}

	@Override
	public int insert(MyExerciseDto dto) { 
		//return dao.insert(exer_count); 
		return dao.insert(dto);
	}
//
//	@Override
//	public int selectOne(Integer user_no) { 
//		return dao.selectOne(user_no);
//	}

	public int selectOne(Integer user_no) { 
		return dao.selectOne(user_no);
	}
	
//	@Override
//	public int insert(MyExerciseDto dto) throws Exception{
//		return dao.insert(dto);
//	}
 
	
	
 
	
//	public int insert(MyExerciseDto dto) {
//		return dao.insert(dto);
//	}
 
	
	

}
