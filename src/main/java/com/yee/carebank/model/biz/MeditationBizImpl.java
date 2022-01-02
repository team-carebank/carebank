package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.MeditationDao;
import com.yee.carebank.model.dto.MeditationDto;

@Service
public class MeditationBizImpl implements MeditationBiz{

	@Autowired
	private MeditationDao dao;
	
	public List<MeditationDto> selectList(){
	
	return dao.selectList();
	}
	
	
	public MeditationDto selectOne(int meditate_id) {
		
		return dao.selectOne(meditate_id);
	}
	
}
