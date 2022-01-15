package com.yee.carebank.model.biz;

import java.util.List;

import com.yee.carebank.model.dto.TmMealDto;
 

public interface TmMealBiz {
	public List<TmMealDto> selectList(int user_no);
 
}
