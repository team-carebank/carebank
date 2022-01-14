package com.yee.carebank.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.CommentDto;

@Repository
public class CommentDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NAMESPACE = "comment.";

	/*
	 * MEAL
	 */

	public List<CommentDto> selectListM(int meal_id) {
		List<CommentDto> res = new ArrayList<CommentDto>();

		try {
			res = sqlSession.selectList(NAMESPACE + "selectListM", meal_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public CommentDto selectM(int comm_no) {
		return sqlSession.selectOne(NAMESPACE + "selectM", comm_no);
	}

	public int writeM(CommentDto comment) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "writeM", comment);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public int updateM(CommentDto comment) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "updateM", comment);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public int deleteM(int comm_no) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "deleteM", comm_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	/*
	 * SUPPLEMENT
	 */

	public List<CommentDto> selectListS(int supple_id) {
		List<CommentDto> res = new ArrayList<CommentDto>();

		try {
			res = sqlSession.selectList(NAMESPACE + "selectListS", supple_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public CommentDto selectS(int comm_no) {
		return sqlSession.selectOne(NAMESPACE + "selectS", comm_no);
	}

	public int writeS(CommentDto comment) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "writeS", comment);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public int updateS(CommentDto comment) {
		int res = 0;

		try {
			res = sqlSession.update(NAMESPACE + "updateS", comment);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public int deleteS(int comm_no) {
		int res = 0;

		try {
			res = sqlSession.delete(NAMESPACE + "deleteS", comm_no);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}
}
