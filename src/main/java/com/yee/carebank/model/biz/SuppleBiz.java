package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.api.NaverSearchAPI;
import com.yee.carebank.model.dao.SuppleDao;
import com.yee.carebank.model.dto.ShoppingDto;
import com.yee.carebank.model.dto.SuppleDto;

@Service
public class SuppleBiz {
	@Autowired
	SuppleDao dao;

	@Autowired
	NaverSearchAPI api;

	public List<SuppleDto> selectList(int subcat_id) {
		return dao.selectList(subcat_id);
	}

	public List<String> selectInfo(int supple_id) {
		return dao.selectInfo(supple_id);
	}

	public SuppleDto selectOne(int supple_id) {
		return dao.selectOne(supple_id);
	}

	public List<Integer> selectCatList() {
		return dao.selectCatList();
	}

	public List<ShoppingDto> getShopping(String supplement) {

		return api.parse(api.shopping(supplement).toString());

	}

	public List<SuppleDto> selectRandom(int user_no) {
		return dao.selectRandom(user_no);
	}

	public List<SuppleDto> selectByComment() {
		return dao.selectByComment();
	}

	public List<Integer> selectPreferCat(int user_no) {
		return dao.selectPreferCat(user_no);
	}
}
