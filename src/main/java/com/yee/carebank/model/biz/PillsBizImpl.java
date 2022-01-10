package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.PillsDao;
import com.yee.carebank.model.dto.PillsDto;

@Service
public class PillsBizImpl implements PillsBiz{

	@Autowired
	private PillsDao dao;
	
	@Override
	public int insert(PillsDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int delete(int pills_no) {
		return dao.delete(pills_no);
	}

	@Override
	public PillsDto selectOne(int user_no) {
		return dao.selectOne(user_no);
	}

	@Override
	public List<PillsDto> selectList(int user_no) {
		return dao.selectList(user_no);
	}

}
