package com.yee.carebank.model.biz;

import java.util.List;

import com.yee.carebank.model.dto.MeditationDto;

public interface MeditationBiz {

	public List<MeditationDto> selectList();
	public MeditationDto selectOne(int meditate_id);
}
