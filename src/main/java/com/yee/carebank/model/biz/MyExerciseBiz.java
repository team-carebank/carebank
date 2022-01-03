package com.yee.carebank.model.biz;

import java.util.List;

import com.yee.carebank.model.dto.ExerciseDto;
import com.yee.carebank.model.dto.MyExerciseDto;

public interface MyExerciseBiz {

	public List<MyExerciseDto> selectList();
}
