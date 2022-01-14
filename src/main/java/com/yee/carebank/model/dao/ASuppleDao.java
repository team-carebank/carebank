package com.yee.carebank.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yee.carebank.model.dto.EfficacyDto;
import com.yee.carebank.model.dto.SuppleDto;

@Repository
public class ASuppleDao {
	private final String NAMESPACE = "admin.supple.";

	@Autowired
	SqlSessionTemplate sqlSession;

	public List<SuppleDto> selectList(Map<String, Object> map) {
		try {
			return sqlSession.selectList(NAMESPACE + "selectList", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int getSuppleCnt() {
		try {
			return sqlSession.selectOne(NAMESPACE + "getCnt");
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<Map<Integer, List<String>>> selectCById(List<SuppleDto> supple) {
		List<Map<Integer, List<String>>> res = new ArrayList<Map<Integer, List<String>>>();
		try {
			for (int i = 0; i < supple.size(); i++) {
				int supple_id = supple.get(i).getSupple_id();
				Map<Integer, List<String>> map = new HashMap<Integer, List<String>>();
				map.put(supple_id, sqlSession.selectList(NAMESPACE + "selectCById", supple_id));
				res.add(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		return res;
	}

	public List<SuppleDto> selectEffi(int supple_id) {
		try {
			return sqlSession.selectList(NAMESPACE + "selectEffi", supple_id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int update(EfficacyDto dto) {
		try {
			List<SuppleDto> efficacy = dto.getEfficacy();
			SuppleDto supple = dto.getSupple();

			int res = 0;

			res += sqlSession.insert(NAMESPACE + "insertSupple", supple);

			for (int i = 0; i < efficacy.size(); i++) {
				SuppleDto tmp = efficacy.get(i);
				tmp.setSupple_id(supple.getSupple_id());

				res += sqlSession.insert(NAMESPACE + "insertEffi", tmp);
			}

			return res;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public int delete(int supple_id) {
		try {
			return sqlSession.delete(NAMESPACE + "deleteSupple", supple_id);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<SuppleDto> searchByName(String keyword, Map<String, Object> map) {
		try {
			map.put("keyword", keyword);
			return sqlSession.selectList(NAMESPACE + "searchByName", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int getCountByName(String keyword) {
		try {
			return sqlSession.selectOne(NAMESPACE + "getCountByName", keyword);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<SuppleDto> searchByDesc(String keyword, Map<String, Object> map) {
		try {
			map.put("keyword", keyword);
			return sqlSession.selectList(NAMESPACE + "searchByName", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int getCountByDesc(String keyword) {
		try {
			return sqlSession.selectOne(NAMESPACE + "getCountByName", keyword);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<SuppleDto> searchAll(String keyword, Map<String, Object> map) {
		try {
			map.put("keyword", keyword);
			return sqlSession.selectList(NAMESPACE + "searchAll", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int getCountAll(String keyword) {
		try {
			return sqlSession.selectOne(NAMESPACE + "getCountAll", keyword);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<SuppleDto> searchByCategory(String keyword, Map<String, Object> map) {
		try {
			map.put("keyword", keyword);
			return sqlSession.selectList(NAMESPACE + "searchByCategory", map);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int getCountByCategory(String keyword) {
		try {
			return sqlSession.selectOne(NAMESPACE + "getCountByCategory", keyword);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

}
