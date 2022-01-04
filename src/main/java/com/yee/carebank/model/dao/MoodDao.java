package com.yee.carebank.model.dao;

import com.yee.carebank.model.dto.MoodDto;

public interface MoodDao {

	String NAMESPACE = "mood.";
	
	public int insert(MoodDto dto);
}
