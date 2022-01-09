	package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.ExerciseDao;
import com.yee.carebank.model.dto.ExerciseDto;

@Service
public class ExerciseBizImpl implements ExerciseBiz{ 

	@Autowired
	private ExerciseDao dao;
	
	
	
	
	public List<ExerciseDto> selectList() {
		
		return dao.selectList();
	}

	public ExerciseDto selectOne(Integer exer_id) {
		return dao.selectOne(exer_id);
	}

	
	
}
