package com.yee.carebank.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.UserDto;

@Repository
public class MyInfoDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String NAMESPACE = "user.";

	public int myinfoUpdate(UserDto newdto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "infoUpdate", newdto);
		} catch (Exception e) {
			System.out.println("[error] : my info update");
			e.printStackTrace();
		}
		return res;
	}
	
	public int disable(int user_no) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "disable", user_no);
		} catch (Exception e) {
			System.out.println("[error]: user disable");
			e.printStackTrace();
		}
		return res;
		
		
		
	}
}
