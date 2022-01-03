package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.CommentDao;
import com.yee.carebank.model.dto.CommentDto;

@Service
public class CommentBiz {
	@Autowired
	CommentDao dao;

	public List<CommentDto> selectList(int info_id, int type) {

		switch (type) {
		case 1:
			return dao.selectMealComment(info_id);
		}

		return null;
	}

	public int write(CommentDto dto, int type) {
		switch (type) {
		case 1:
			return dao.writeMealComment(dto);
		}
		return 0;
	}
}
