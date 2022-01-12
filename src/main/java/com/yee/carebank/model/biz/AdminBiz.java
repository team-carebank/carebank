package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.AdminDao;
import com.yee.carebank.model.dto.MealDto;

@Service
public class AdminBiz {

	@Autowired
	AdminDao dao;

	public List<MealDto> selectMList(int pageNo) {
		int start = 1, end = 20;

		start = (20 * (pageNo - 1)) + 1;
		end = start + 19;

		return dao.selectMList(start, end);
	}

	public int getMTotalCnt() {
		return dao.getMTotalCnt();
	}

}
