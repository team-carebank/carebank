package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.MyExerciseDao;
import com.yee.carebank.model.dto.ExerciseDto;
import com.yee.carebank.model.dto.MyExerciseDto;

@Service
public class MyExerciseBizImpl implements MyExerciseBiz{

	@Autowired
	private MyExerciseDao dao;
	


	public List<MyExerciseDto> selectList(){
		
		return dao.selectList();
	}
 
	
}
