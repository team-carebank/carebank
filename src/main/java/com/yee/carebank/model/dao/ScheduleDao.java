package com.yee.carebank.model.dao;

import java.util.List;

import com.yee.carebank.model.dto.ScheduleDto;

public interface ScheduleDao {

	String NAMESPACE = "visit.";
	
	public List<ScheduleDto> selectList();
	public int insert(ScheduleDto dto);
	public int update(ScheduleDto dto);
	public int delete(ScheduleDto dto);
	public ScheduleDto selectOne(int hospital_no);
}
