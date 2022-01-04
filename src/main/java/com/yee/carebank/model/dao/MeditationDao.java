package com.yee.carebank.model.dao;

import java.util.List;

import com.yee.carebank.model.dto.MeditationDto;

public interface MeditationDao {

	String NAMESPACE="meditation.";
	
	public List<MeditationDto> selectList();
	public MeditationDto selectOne(int meditate_id);
	
	
}
