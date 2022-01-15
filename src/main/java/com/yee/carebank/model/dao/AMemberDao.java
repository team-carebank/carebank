package com.yee.carebank.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.StatDto;
import com.yee.carebank.model.dto.UserDto;

@Repository
public class AMemberDao {
	private final String NAMESPACE = "admin.member.";

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<UserDto> selectList(Map<String, Object> map) {
		try {
			return sqlSession.selectList(NAMESPACE + "selectList", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int getCnt() {
		try {
			return sqlSession.selectOne(NAMESPACE + "getCnt");
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public UserDto selectByNo(int user_no) {
		try {
			return sqlSession.selectOne(NAMESPACE + "selectByNo", user_no);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int updateEnabled(int user_no, String updateId) {
		try {
			return sqlSession.update(NAMESPACE + updateId, user_no);
		} catch (Exception e) {
			return -1;
		}
	}

	public int updatePassword(UserDto dto) {
		try {
			return sqlSession.update(NAMESPACE + "updatePwd", dto);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<UserDto> search(String selectId, Map<String, Object> map, String keyword) {
		map.put("keyword", keyword);

		try {
			return sqlSession.selectList(NAMESPACE + selectId, map);
		} catch (Exception e) {
			return null;
		}
	}

	public int getCnt(String selectId, String keyword) {
		try {
			return sqlSession.selectOne(NAMESPACE + selectId, keyword);
		} catch (Exception e) {
			return -1;
		}
	}

	public List<StatDto> getStat(String selectId) {
		try {
			return sqlSession.selectList(NAMESPACE + selectId);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
