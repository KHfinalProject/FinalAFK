package com.model.afk.infoboard.service;

import java.util.List;

import com.model.afk.infoboard.vo.InfoBoard;

public interface InfoBoardService { 

	int insertBoard(InfoBoard vo);

	int deleteBoard(int bno);

	List<InfoBoard> getBoardList(int bno);

	int updateBoard(InfoBoard vo);

	InfoBoard getBoardDetail(int bno);

}
