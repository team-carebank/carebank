package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.QnaDao;
import com.yee.carebank.model.dto.QnaDto;

@Service
public class QnaBizImpl implements QnaBiz{

	@Autowired
	private QnaDao dao;
	
	@Override
	public int insert(QnaDto dto) {
		return dao.insert(dto);
	}

	@Override
	public List<QnaDto> selectList(int user_no) {
		return dao.selectList(user_no);
	}

}
