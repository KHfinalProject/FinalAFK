package com.model.afk.infoboard.service;

import java.util.List;

import com.model.afk.infoboard.vo.InfoBoardVO;

public interface InfoBoardService { 

	int insertBoard(InfoBoardVO vo);

	int deleteBoard(int info_no);

	List<InfoBoardVO> getBoardList(int page);

	int updateBoard(InfoBoardVO vo);

	InfoBoardVO getBoardDetail(int info_no);

	List<InfoBoardVO> getBoardSelectList(int page, String code);
	
	public InfoBoardVO boardDetail(int info_no);
	
	int addCount(int info_no);


}
