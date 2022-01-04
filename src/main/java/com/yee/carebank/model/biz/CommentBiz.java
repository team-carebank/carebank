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
			return dao.selectListM(info_id);
		case 3:
			return dao.selectListS(info_id);
		}

		return null;
	}

	public int write(CommentDto dto, int type) {
		switch (type) {
		case 1:
			return dao.writeM(dto);
		case 3:
			return dao.writeS(dto);
		}
		return 0;
	}

	public int update(CommentDto dto, int type) {
		switch (type) {
		case 1:
			return dao.updateM(dto);
		case 3:
			return dao.updateS(dto);
		}

		return 0;
	}

	public int delete(int comm_no, int type) {
		switch (type) {
		case 1:
			return dao.deleteM(comm_no);
		case 3:
			return dao.deleteS(comm_no);
		}
		return 0;
	}
}
