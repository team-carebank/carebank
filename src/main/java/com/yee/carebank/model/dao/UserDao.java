package com.yee.carebank.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.UserDto;

@Repository

public class UserDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String NAMESPACE = "user.";
	
	public UserDto login(UserDto userdto) {
		UserDto res = null;
		try {
			res = sqlSession.selectOne(NAMESPACE + "login", userdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

}
