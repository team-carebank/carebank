package com.yee.carebank.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.UserDao;
import com.yee.carebank.model.dto.UserDto;

@Service
public class UserBiz {

	@Autowired
	private UserDao userdao;
	
	
	//로그인 처리
	public UserDto login(UserDto userdto) {
		return userdao.login(userdto);
	}
	
	//회원가입
	public int regis(UserDto userdto) {
		return userdao.regis(userdto);
	}
	
	public int idchk(String user_id) {
		return userdao.idchk(user_id);
	}
}
