package com.yee.carebank.model.biz;

import java.util.List;

import com.yee.carebank.model.dto.ScheduleDto;

public interface ScheduleBiz {

	public List<ScheduleDto> selectList(int user_no);
	public int insert(ScheduleDto dto);
	public int update(ScheduleDto dto);
	public ScheduleDto selectOne(int hospital_no);
	
}
