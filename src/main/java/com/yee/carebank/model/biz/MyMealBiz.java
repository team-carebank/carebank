package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.MyMealDao;
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
}
