package com.yee.carebank.model.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.FaqDao;
import com.yee.carebank.model.dto.FaqDto;



@Service
public class FaqBiz {
	
	@Autowired
	private FaqDao faqdao; 
	
	//조회
	public List<FaqDto> selectList() {
		return faqdao.selectList();
	}

	//작성
	public int insert(FaqDto faqdto) {
		return faqdao.insert(faqdto);
	}
	
	//수정
	public int update(FaqDto faqdto) {
		return faqdao.update(faqdto);
	}
	
	//삭제
	public int delete(int faqno) {
		return faqdao.delete(faqno);
	}
}
