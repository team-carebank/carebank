package com.yee.carebank.model.biz;

import java.util.List;

import com.yee.carebank.model.dto.ScheduleDto;

public interface ScheduleBiz {

	public List<ScheduleDto> selectList();
	public int insert(ScheduleDto dto);
}
