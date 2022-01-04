package com.yee.carebank.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.FaqDto;


@Repository
public class FaqDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	String NAMESPACE = "faq.";
	
	public List<FaqDto> selectList(){
		List<FaqDto> list = new ArrayList<FaqDto>();
		//list안에 쿼리문 실행후 결과받기: mybatis를 통해 쿼리문 실행
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList");
		} catch (Exception e) {
			System.out.println("[error]:select list");
			e.printStackTrace();
		} 

	
		return list; //mapper로 넘어가자
		
	}
	public FaqDto selectOne(int faqno){
		return null;
		
	}
	public int insert(FaqDto faqdto) {
		return 0;
	}
	public int update(FaqDto faqdto) {
		return 0;
	}
	public int delete(int faqno) {
		return 0;
	}
	
}
