package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.FaqDao;
import com.yee.carebank.model.dto.FaqDto;



@Service
public class FaqBiz {
	
	@Autowired
	private FaqDao dao; 
	
	public List<FaqDto> selectList() {
		return dao.selectList(); //리턴값을 받아 바로 controller로 보내준다 
	}

}
