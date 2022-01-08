package com.yee.carebank.model.dao;

import java.util.List;

import com.yee.carebank.model.dto.MyExerciseDto;

public interface MyExerciseDao {

	String NAMESPACE="myexercise.";
	
	public List<MyExerciseDto> selectList();
	
}
