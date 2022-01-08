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
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList");
		} catch (Exception e) {
			System.out.println("[error]:select list");
			e.printStackTrace();
		} 
		return list; 

	}
	/*public FaqDto selectOne(int faqno){
		return null;
		
	}*/
	public int insert(FaqDto faqdto) {
		int res = 0;
		try {
			res = sqlSession.insert(NAMESPACE + "insertList", faqdto);
		} catch (Exception e) {
			System.out.println("[error] : insert");
			e.printStackTrace();
		}
		return res;
	
	}
	public int update(FaqDto faqdto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "updateList", faqdto);
		} catch (Exception e) {
			System.out.println("[error] : update");
			e.printStackTrace();
		}
		return res;
	}
	
	public int delete(int faqno) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE + "deleteList",faqno);
		} catch (Exception e) {
			System.out.println("[error] : update");
			e.printStackTrace();
		}
		return res;
	}
	
}
