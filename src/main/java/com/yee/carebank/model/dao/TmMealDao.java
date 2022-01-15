package com.yee.carebank.model.dao;

import java.util.List;

import com.yee.carebank.model.dto.TmMealDto;

public interface TmMealDao {

	String NAMESPACE = "tmmeal.";

	public List<TmMealDto> selectList(int user_no);
}
