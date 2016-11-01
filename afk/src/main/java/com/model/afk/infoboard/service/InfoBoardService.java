package com.model.afk.infoboard.service;

import java.util.List;

import com.model.afk.infoboard.vo.InfoBoardVO;

public interface InfoBoardService { 

	int insertBoard(InfoBoardVO vo);

	int deleteBoard(int bno);

	List<InfoBoardVO> getBoardList(int page);

	int updateBoard(InfoBoardVO vo);

	InfoBoardVO getBoardDetail(int info_no);


}
