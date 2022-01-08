package com.yee.carebank.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.MoodDao;
import com.yee.carebank.model.dto.MoodDto;

@Service
public class MoodBizImpl implements MoodBiz{

	@Autowired
	private MoodDao dao;
	
	@Override
	public int insert(MoodDto dto) {
		return dao.insert(dto);
	}

}
