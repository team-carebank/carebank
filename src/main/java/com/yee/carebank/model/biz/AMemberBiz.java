package com.yee.carebank.model.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.AMemberDao;
import com.yee.carebank.model.dto.UserDto;

import static com.yee.carebank.model.biz.Admin1stBiz.createParameter;

import java.util.List;

@Service
public class AMemberBiz {

	@Autowired
	AMemberDao dao;

	public List<UserDto> selectList(int page) {
		return dao.selectList(createParameter(page));
	}

	public int getCnt() {
		return dao.getCnt();
	}

	public UserDto selectByNo(int user_no) {
		return dao.selectByNo(user_no);
	}

	public int updateEnabled(int user_no, String updateId) {
		return dao.updateEnabled(user_no, updateId);
	}

	public int updatePassword(UserDto dto) {
		return dao.updatePassword(dto);
	}

}
