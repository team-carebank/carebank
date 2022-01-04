package com.yee.carebank.model.biz;

import java.util.List;

import com.yee.carebank.model.dto.ExerciseDto;

public interface ExerciseBiz {

	public List<ExerciseDto> selectList();
	public ExerciseDto selectOne(Integer exer_id);
	
	
}
