package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.MealDao;
import com.yee.carebank.model.dto.MealDto;

@Service
public class MealBiz {

	@Autowired
	MealDao dao;

	public List<MealDto> selectList(int subcat_id) {
		return dao.selectList(subcat_id);
	}
}
