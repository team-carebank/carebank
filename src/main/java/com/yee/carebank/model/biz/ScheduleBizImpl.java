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
	public List<ScheduleDto> selectList(int user_no) {
		return dao.selectList(user_no);
	}

	@Override
	public int insert(ScheduleDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(ScheduleDto dto) {
		return dao.update(dto);
	}

	@Override
	public ScheduleDto selectOne(int hospital_no) {
		return dao.selectOne(hospital_no);
	}

}
