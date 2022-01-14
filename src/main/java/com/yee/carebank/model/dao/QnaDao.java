package com.yee.carebank.model.dao;

import java.util.List;

import com.yee.carebank.model.dto.QnaDto;

public interface QnaDao {

	String NAMESPACE = "qna.";
	
	public int insert(QnaDto dto);
	public List<QnaDto> selectList(int user_no);
	
}