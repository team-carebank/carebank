package com.yee.carebank.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PreferenceDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String NAMESPACE = "prefer.";
	
//	public List<PreferenceDto> selectAll(){
//		List<PreferenceDto> preferlist = new ArrayList<PreferenceDto>();
//		
//		try {
//			preferlist = sqlSession.selectList(NAMESPACE + "selectAll");
//		} catch (Exception e) {
//			System.out.println("[error]: select preferlist");
//			e.printStackTrace();
//		}
//		return preferlist;
//	}
	
	public int setprefer(List<Integer> subcat_id, int user_no) {
		int res = 0;
			
		try {
			res = sqlSession.delete(NAMESPACE + "delete", user_no);
			
			for(int i = 0; i < subcat_id.size(); i++) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("subcat_id", subcat_id.get(i));
				map.put("user_no", user_no);
				
				res = sqlSession.insert(NAMESPACE + "setprefer", map);
			}
		} catch (Exception e) {
			System.out.println("[error]: set prefer");
			e.printStackTrace();
		}
		
		return res;
	}
	
}
