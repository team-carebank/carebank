package com.yee.carebank.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.MyInfoDao;
import com.yee.carebank.model.dto.UserDto;

@Service
public class MyInfoBiz {

	@Autowired
	private MyInfoDao userdao;
	
	public int myinfoUpdate(UserDto newdto) {
		return userdao.myinfoUpdate(newdto);
	}
}
