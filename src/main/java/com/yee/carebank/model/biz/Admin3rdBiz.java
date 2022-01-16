package com.yee.carebank.model.biz;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.AExerDao;
import com.yee.carebank.model.dao.AMediDao;
import com.yee.carebank.model.dto.ExerciseDto;
import com.yee.carebank.model.dto.MeditationDto;

import static com.yee.carebank.model.biz.Admin1stBiz.createParameter;

@Service
public class Admin3rdBiz {

	@Autowired
	AExerDao exer;

	@Autowired
	AMediDao medi;

	public List<ExerciseDto> selectExerList(int page) {
		return exer.selectList(createParameter(page));
	}

	public ExerciseDto selectExer(int exer_id) {
		return exer.selectOne(exer_id);
	}

	public int insertExer(ExerciseDto dto) {
		return exer.insert(dto);
	}

	public int updateExer(ExerciseDto dto) {
		return exer.update(dto);
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

	/*
	 * 명상 crud
	 */

	public List<MeditationDto> selectMediList(int page) {
		return medi.selectList(createParameter(page));
	}

	public MeditationDto selectMedi(int id) {
		return medi.selectOne(id);
	}

	public int insertMedi(MeditationDto dto) {
		return medi.insert(dto);
	}

	public int updateMedi(MeditationDto dto) {
		return medi.update(dto);
	}

	public int deleteMedi(int id) {
		return medi.delete(id);
	}

	public int getMediCnt() {
		return medi.getCnt();
	}

	public List<MeditationDto> searchMedi(String searchType, String keyword, int page) {
		Map<String, Object> map = createParameter(page);
		map.put("keyword", keyword);
		switch (searchType) {
		case "name":
			return medi.search("searchByName", map);
		case "category":
			return medi.search("searchByCategory", map);
		}
		return null;
	}

	public int getMediCnt(String searchType, String keyword) {
		switch (searchType) {
		case "name":
			return medi.getCnt("getCntByName", keyword);
		case "category":
			return medi.getCnt("getCntByCategory", keyword);
		}
		return 0;
	}

	public MeditationDto selectPlaylist(int meditate_id) {
		return medi.selectPlayList(meditate_id);
	}

	public int updatePlaylist(MeditationDto dto) {
		return medi.updatePlaylist(dto);
	}

	public ExerciseDto selectTM(int exer_id) {
		return exer.selectTM(exer_id);
	}

	public int updateTM(ExerciseDto dto) {
		return exer.updateTM(dto);
	}
}
