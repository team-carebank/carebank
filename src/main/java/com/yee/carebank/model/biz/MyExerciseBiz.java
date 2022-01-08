package com.yee.carebank.model.biz;

import java.util.List;
import java.util.Map;

import com.yee.carebank.model.dto.MyExerciseDto;

public interface MyExerciseBiz {

	public List<MyExerciseDto> selectList();
	public MyExerciseDto selectOne(Integer user_no);  
	//public int insert(MyExerciseDto dto); 
	public int insert(MyExerciseDto dto) throws Exception;
 
	
	
	
}

