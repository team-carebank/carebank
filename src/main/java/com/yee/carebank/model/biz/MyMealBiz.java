package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.MyMealDao;
import com.yee.carebank.model.dto.MyExerciseDto;
import com.yee.carebank.model.dto.MyMealDto;

@Service
public class MyMealBiz {

	@Autowired
	MyMealDao dao;

	public int insert(MyMealDto dto) {
		return dao.insert(dto);
	}

	public List<MyMealDto> selectList(int user_no) {
		return dao.selectList(user_no);
	}

	public MyMealDto selectOne(int record_id) {
		return dao.selectOne(record_id);
	}

	public int update(MyMealDto dto) {
		return dao.update(dto);
	}

	public int delete(int record_id) {
		return dao.delete(record_id);
	}

	public List<MyExerciseDto> selectList(int user_no, int i) {
		return dao.selectList(user_no, 1);
	}
}
