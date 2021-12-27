package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.ScheduleDao;
import com.yee.carebank.model.dto.ScheduleDto;

@Service
public class ScheduleBizImpl implements ScheduleBiz{

	@Autowired
	private ScheduleDao dao;
	
	@Override
	public List<ScheduleDto> selectList() {
		return dao.selectList();
	}

	@Override
	public int insert(ScheduleDto dto) {
		return dao.insert(dto);
	}

}
