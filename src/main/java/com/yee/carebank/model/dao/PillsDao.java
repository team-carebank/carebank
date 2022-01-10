package com.yee.carebank.model.dao;

import java.util.List;

import com.yee.carebank.model.dto.PillsDto;

public interface PillsDao {

	String NAMESPACE = "pills.";
	
	public int insert(PillsDto dto);
	public int delete(int pills_no);
	public PillsDto selectOne(int user_no);
	public List<PillsDto> selectList(int user_no);
}
