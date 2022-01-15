package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.AExerDao;
import com.yee.carebank.model.dto.ExerciseDto;

import static com.yee.carebank.model.biz.Admin1stBiz.createParameter;

@Service
public class Admin3rdBiz {

	@Autowired
	AExerDao exer;

	public List<ExerciseDto> selectExerList(int page) {
		return exer.selectList(createParameter(page));
	}

	public ExerciseDto selectExer(int exer_id) {
		return exer.selectOne(exer_id);
	}

	public int insertExer(ExerciseDto dto) {
		return exer.insert(dto);
	}

	public int deleteExer(int exer_id) {
		return exer.delete(exer_id);
	}

	public int getExerCnt() {
		return exer.getCount();
	}

	public List<ExerciseDto> searchExer(String searchType, String keyword, int page) {
		switch (searchType) {
		case "type":
			return exer.search("searchByType", keyword, createParameter(page));
		case "name":
			return exer.search("searchByName", keyword, createParameter(page));
		case "category":
			return exer.search("searchByCategory", keyword, createParameter(page));
		}
		return null;
	}

	public int getExerCntBySearch(String searchType, String keyword) {
		switch (searchType) {
		case "type":
			return exer.getCnt("getByType", keyword);
		case "name":
			return exer.getCnt("getByName", keyword);
		case "category":
			return exer.getCnt("getByCategory", keyword);
		}
		return 0;
	}

	public int updateExer(ExerciseDto dto) {
		return exer.update(dto);
	}
}
