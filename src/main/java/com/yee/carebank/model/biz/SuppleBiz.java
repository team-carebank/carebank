package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.SuppleDao;
import com.yee.carebank.model.dto.SuppleDto;

@Service
public class SuppleBiz {
	@Autowired
	SuppleDao dao;

	public List<SuppleDto> selectList(int subcat_id) {
		return dao.selectList(subcat_id);
	}
}
