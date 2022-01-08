package com.yee.carebank.model.biz;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
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
		JsonArray items = api.shopping(supplement);
		List<ShoppingDto> list = new ArrayList<ShoppingDto>();

		if (items != null) {
			for (int i = 0; i < items.size(); i++) {
				list.add(new ShoppingDto(items.get(i).getAsJsonObject()));
			}
		}

		return list;

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
