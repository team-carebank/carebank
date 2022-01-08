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
	
	//로그인 처리
	public UserDto login(UserDto userdto) {
		UserDto login_info = null;
		try {
			login_info = sqlSession.selectOne(NAMESPACE + "login", userdto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return login_info;
	}

	
	//회원가입
	public int regis(UserDto userdto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "register",userdto);
		} catch (Exception e) {
			System.out.println("[error] : register");
			e.printStackTrace();
		}
		return res;
	}
	
	//아이디 중복확인
	public int idchk(String user_id) {
		int res = 0;
		
		try {
			res = sqlSession.selectOne(NAMESPACE + "idchk", user_id);
		} catch (Exception e) {
			System.out.println("[error] : idchk");
			e.printStackTrace();
		}
		return res;
	}
	
}
