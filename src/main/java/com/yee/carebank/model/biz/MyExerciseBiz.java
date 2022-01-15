package com.yee.carebank.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.yee.carebank.model.dto.MyExerciseDto;
import com.yee.carebank.model.dto.UserDto;
 
public interface MyExerciseBiz {

	public List<MyExerciseDto> selectList(int user_no);
	
	public int insert( MyExerciseDto dto);
 

	
}

