package com.yee.carebank.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.ASuppleDao;
import com.yee.carebank.model.dao.SuppleDao;
import com.yee.carebank.model.dto.EfficacyDto;
import com.yee.carebank.model.dto.SuppleDto;

import static com.yee.carebank.model.biz.AdminBiz.createParameter;

@Service
public class Admin2ndBiz {

	@Autowired
	ASuppleDao sDao;

	@Autowired
	SuppleDao dao;

	// Supplement
	public int getSuppleCnt() {
		return sDao.getSuppleCnt();
	}

	public List<SuppleDto> selectSupple(int page) {
		return sDao.selectList(createParameter(page));
	}

	public List<Map<Integer, List<String>>> selectCatBySId(List<SuppleDto> res) {
		return sDao.selectCById(res);
	}

	public EfficacyDto selectEffi(int supple_id) {
		EfficacyDto res = new EfficacyDto();

		res.setEfficacy(sDao.selectEffi(supple_id));
		res.setSupple(dao.selectOne(supple_id));

		return res;
	}

	public int updateS(EfficacyDto dto) {
		return sDao.update(dto);
	}

	public int deleteSupple(int supple_id) {
		return sDao.delete(supple_id);
	}

	public List<SuppleDto> searchSupple(String searchType, String keyword, int page) {
		switch (searchType) {
		case "name":
			return sDao.searchByName(keyword, createParameter(page));
		case "desc":
			return sDao.searchByDesc(keyword, createParameter(page));
		case "category":
			return sDao.searchByCategory(keyword, createParameter(page));
		default:
			return sDao.searchAll(keyword, createParameter(page));
		}
	}

	public int getSuppleCount(String searchType, String keyword) {
		switch (searchType) {
		case "name":
			return sDao.getCountByName(keyword);
		case "desc":
			return sDao.getCountByDesc(keyword);
		case "category":
			return sDao.getCountByCategory(keyword);
		default:
			return sDao.getCountAll(keyword);
		}
	}
}
