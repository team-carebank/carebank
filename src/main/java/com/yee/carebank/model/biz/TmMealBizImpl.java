package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.TmMealDao;
import com.yee.carebank.model.dto.TmMealDto;

@Service
public class TmMealBizImpl implements TmMealBiz {

	@Autowired
	private TmMealDao dao;

	public List<TmMealDto> selectList(int user_no) {
		return dao.selectList(user_no);
	}

}
