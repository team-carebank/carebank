package com.yee.carebank.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	 private static final String NAMESPACE = "com.doubles.ex03.mapper.BoardMapper";

	    // 입력
	    public void create(BoardVO boardVO) throws Exception {
	        sqlSession.insert(NAMESPACE + ".create", boardVO);
	    }

	    // 조회
	    public BoardVO read(Integer post_no) throws Exception {
	        return sqlSession.selectOne(NAMESPACE + ".read", post_no);
	    }

	    // 수정
	    public void update(BoardVO boardVO) throws Exception {
	        sqlSession.update(NAMESPACE + ".update", boardVO);
	    }

	    // 삭제
	    public void delete(Integer post_no) throws Exception {
	        sqlSession.delete(NAMESPACE + ".delete", post_no);
	    }

	    // 목록 : 기본
	    public List<BoardVO> list() throws Exception {
	        return sqlSession.selectList(NAMESPACE + ".list");
	    }

	    // 목록 : 페이징

	    // 목록 : 페이징 + 검색
	}
