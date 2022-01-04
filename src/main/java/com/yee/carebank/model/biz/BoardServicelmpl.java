package com.yee.carebank.model.biz;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.yee.carebank.model.dao.BoardDAO;
import com.yee.carebank.model.dto.BoardVO;

@Service
public class BoardServicelmpl implements BoardService {

	@Inject
	private BoardDAO boardDAO;

    // 입력
    public void register(BoardVO boardVO) throws Exception {
        boardDAO.create(boardVO);
    }

    // 조회
    public BoardVO read(Integer bno) throws Exception {
        return boardDAO.read(bno);
    }

    // 수정
    public void modify(BoardVO boardVO) throws Exception {
        boardDAO.update(boardVO);
    }

    // 삭제
    public void remove(Integer post_no) throws Exception {
        boardDAO.delete(post_no);
    }

    // 목록 : 기본
    public List<BoardVO> list() throws Exception {
        return boardDAO.list();
    }

    // 목록 : 페이징

    // 목록 : 페이징 + 검색
}
