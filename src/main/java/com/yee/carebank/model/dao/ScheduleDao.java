package com.yee.carebank.model.dao;

import java.util.List;

import com.yee.carebank.model.dto.ScheduleDto;

public interface ScheduleDao {

	String NAMESPACE = "visit.";
	
	public List<ScheduleDto> selectList();
	public int insert(ScheduleDto dto);
}
