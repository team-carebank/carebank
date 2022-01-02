package com.yee.carebank.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.indexDao;

@Service
public class indexBiz {

	@Autowired
	private indexDao dao;
	
	public String getMain() {
		return dao.getMain();
	}
	
}
