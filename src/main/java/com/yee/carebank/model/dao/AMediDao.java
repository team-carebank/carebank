package com.yee.carebank.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.ExerciseDto;
import com.yee.carebank.model.dto.MeditationDto;

@Repository
public class AMediDao {
	private final String NAMESPACE = "admin.medi.";

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<MeditationDto> selectList(Map<String, Object> map) {
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

	public MeditationDto selectOne(int meditate_id) {
		try {
			return sqlSession.selectOne(NAMESPACE + "selectOne", meditate_id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int insert(MeditationDto dto) {
		try {
			return sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public int update(MeditationDto dto) {
		try {
			return sqlSession.insert(NAMESPACE + "update", dto);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public int delete(int meditate_id) {
		try {
			return sqlSession.insert(NAMESPACE + "delete", meditate_id);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<MeditationDto> search(String selectId, Map<String, Object> map) {
		try {
			return sqlSession.selectList(NAMESPACE + selectId, map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int getCnt(String selectId, String keyword) {
		try {
			return sqlSession.selectOne(NAMESPACE + selectId, keyword);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public MeditationDto selectPlayList(int meditate_id) {
		try {
			return sqlSession.selectOne(NAMESPACE + "selectPlaylist", meditate_id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int updatePlaylist(MeditationDto dto) {
		try {
			return sqlSession.update(NAMESPACE + "updatePlaylist", dto);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
}