 package com.yee.carebank.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.MyExerciseDao;
import com.yee.carebank.model.dto.MyExerciseDto;
import com.yee.carebank.model.dto.UserDto;

@Service
public class MyExerciseBizImpl implements MyExerciseBiz{
	
	@Autowired
	private MyExerciseDao dao;
	
	public List<MyExerciseDto> selectList(int user_no){
		
		return dao.selectList(user_no);
	}
	 

	@Override
	public int insert(MyExerciseDto dto) { 
		//return dao.insert(exer_count); 
		return dao.insert(dto);
	}

 
 

//	public int selectOne(int user_no) { 
//		return dao.selectOne(user_no);
//	}
//	 
	
	

}
