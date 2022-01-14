package com.yee.carebank.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.ExerciseDto;

@Repository
public class AExerDao {
	private final String NAMESPACE = "admin.exer.";

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<ExerciseDto> selectList(Map<String, Object> createParameter) {
		try {
			return sqlSession.selectList(NAMESPACE + "selectList", createParameter);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public ExerciseDto selectOne(int exer_id) {
		try {
			return sqlSession.selectOne(NAMESPACE + "selectOne", exer_id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int getCount() {
		try {
			return sqlSession.selectOne(NAMESPACE + "getCount");
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public int insert(ExerciseDto dto) {
		try {
			return sqlSession.insert(NAMESPACE + "merge", dto);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public int update(ExerciseDto dto) {
		try {
			return sqlSession.insert(NAMESPACE + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public int delete(int exer_id) {
		try {
			return sqlSession.delete(NAMESPACE + "delete", exer_id);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<ExerciseDto> search(String select_id, String keyword, Map<String, Object> createParameter) {
		createParameter.put("keyword", keyword);

		try {
			return sqlSession.selectList(NAMESPACE + select_id, createParameter);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int getCnt(String select_id, String keyword) {
		try {
			return sqlSession.selectOne(NAMESPACE + select_id, keyword);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
}
