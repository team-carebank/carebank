package com.yee.carebank.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.UserDao;
import com.yee.carebank.model.dto.UserDto;

@Service
public class UserBiz {

	@Autowired
	private UserDao userdao;
	
	public UserDto login(UserDto userdto) {
		return userdao.login(userdto);
	}
}
