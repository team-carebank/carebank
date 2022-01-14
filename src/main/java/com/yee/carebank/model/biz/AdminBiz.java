package com.yee.carebank.model.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yee.carebank.model.dao.AFoodDao;
import com.yee.carebank.model.dao.AMealDao;
import com.yee.carebank.model.dao.ASuppleDao;
import com.yee.carebank.model.dao.SuppleDao;
import com.yee.carebank.model.dto.CategoryDto;
import com.yee.carebank.model.dto.EfficacyDto;
import com.yee.carebank.model.dto.FoodDto;
import com.yee.carebank.model.dto.MealDto;
import com.yee.carebank.model.dto.SuppleDto;

@Service
public class AdminBiz {

	@Autowired
	AMealDao dao;

	@Autowired
	AFoodDao fDao;

	@Autowired
	ASuppleDao sDao;

	@Autowired
	SuppleDao s2Dao;

	private static Map<String, Object> createParameter(int page) {
		Map<String, Object> map = new HashMap<String, Object>();

		int start = 1, end = 20;

		start = (20 * (page - 1)) + 1;
		end = start + 19;

		map.put("start", start);
		map.put("end", end);

		return map;
	}

	// Meal
	public List<MealDto> selectMList(int page) {
		return dao.selectMList(createParameter(page));
	}

	public int getMTotalCnt() {
		return dao.getMTotalCnt();
	}

	public List<CategoryDto> selectCList() {
		return dao.selectCList();
	}

	public int insertM(MealDto meal, List<FoodDto> foods) {
		return dao.insertM(meal, foods);
	}

	public int deleteMeal(int meal_id) {
		return dao.deleteMeal(meal_id);
	}

	public int updateM(MealDto m, List<FoodDto> food) {
		return dao.updateM(m, food);
	}

	public List<MealDto> search(String searchType, String keyword, int page) {
		switch (searchType) {
		case "name":
			return dao.searchByName(keyword, createParameter(page));
		case "category":
			return dao.searchByCategory(keyword, createParameter(page));
		default:
			return dao.searchAll(keyword, createParameter(page));
		}
	}

	public int getCount(String searchType, String keyword) {
		switch (searchType) {
		case "name":
			return dao.getMealCount(keyword);
		case "category":
			return dao.getCatCount(keyword);
		default:
			return dao.getAllCount(keyword);
		}
	}

	// Food(Nutrients)

	public List<FoodDto> selectFList(int page) {
		return fDao.selectFList(createParameter(page));
	}

	public int getFTotalCount() {
		return fDao.getFTotalCount();
	}

	public int deleteFood(int food_id) {
		return fDao.deleteFood(food_id);
	}

	public int insertF(FoodDto food) {
		return fDao.insertFood(food);
	}

	public int checkFName(String foodname) {
		return fDao.checkFName(foodname);
	}

	public FoodDto selectFood(int food_id) {
		return fDao.selectFood(food_id);
	}

	public int updateF(FoodDto food) {
		return fDao.updateF(food);
	}

	public List<FoodDto> searchFood(String keyword, int page) {
		return fDao.searchFood(keyword, createParameter(page));
	}

	public int getSearchCntFood(String keyword) {
		return fDao.getSearchCnt(keyword);
	}

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
		res.setSupple(s2Dao.selectOne(supple_id));

		return res;
	}

	public int updateS(EfficacyDto dto) {
		return sDao.update(dto);
	}

	public int deleteSupple(int supple_id) {
		return sDao.delete(supple_id);
	}
}
