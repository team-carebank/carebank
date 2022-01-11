package com.yee.carebank.model.biz;

import java.util.List;

import com.yee.carebank.model.dto.PillsDto;

public interface PillsBiz {

	public int insert(PillsDto dto);
	public int delete(int pills_no);
	public PillsDto selectOne(int user_no);
	public List<PillsDto> selectList(int user_no);
}
