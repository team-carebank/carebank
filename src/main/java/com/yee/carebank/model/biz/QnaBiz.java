package com.yee.carebank.model.biz;

import java.util.List;

import com.yee.carebank.model.dto.QnaDto;

public interface QnaBiz {

	public int insert(QnaDto dto);
	public List<QnaDto> selectList(int user_no);
	
}
