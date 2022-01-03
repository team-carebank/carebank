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

	public int writeMealComment(CommentDto comment) {
		int res = 0;

		try {
			res = sqlSession.insert(NAMESPACE + "writeMealComment", comment);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}

	public List<CommentDto> selectMealComment(int meal_id) {
		List<CommentDto> res = new ArrayList<CommentDto>();

		try {
			res = sqlSession.selectList(NAMESPACE + "selectMealComment", meal_id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	}
}
