package com.yee.carebank.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.QnaDto;

@Repository
public class QnaDaoImpl implements QnaDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insert(QnaDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"insert",dto);
		} catch (Exception e) {
			System.out.println("[error : qna insert]");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public List<QnaDto> selectList(int user_no) {
		List<QnaDto> list = new ArrayList<QnaDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE+"selectList", user_no);
		} catch (Exception e) {
			System.out.println("[error : qna selectList]");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public QnaDto selectOne(int qa_no) {
		QnaDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectOne", qa_no);
		} catch (Exception e) {
			System.out.println("[error : qna selectOne]");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int update(QnaDto dto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		} catch (Exception e) {
			System.out.println("[error : QNA UPDATE]");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int delete(int qa_no) {
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete", qa_no);
		} catch (Exception e) {
			System.out.println("[error : QNA DELETE");
			e.printStackTrace();
		}
		return res;
	}

	

}
