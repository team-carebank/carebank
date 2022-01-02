package com.yee.carebank.model.dao;

import java.util.List;

import com.yee.carebank.model.dto.ExerciseDto;

public interface ExerciseDao {

	String NAMESPACE="exercise.";
	
	public List<ExerciseDto> selectList();
	public ExerciseDto selectOne(Integer exer_id);
	
	
	
	
}
