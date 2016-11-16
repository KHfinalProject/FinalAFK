package com.model.afk.infoboard.service;

import java.util.List;

import com.model.afk.infoboard.vo.InfoBoardVO;
import com.model.afk.infoboard.vo.InfoNotifyVO;

public interface InfoBoardService { 

	int insertBoard(InfoBoardVO vo);

	int deleteBoard(int info_no);

	List<InfoBoardVO> getBoardList(int page);

	int updateBoard(InfoBoardVO vo);

	InfoBoardVO getBoardDetail(int info_no);

	List<InfoBoardVO> getBoardSelectList(int page, String code);
	
	// 디테일 페이지
	public InfoBoardVO boardDetail(int info_no);
	
	// 카운트
	int addCount(int info_no);
	
	// 신고
		public int notify(int info_no, String user);
		// 신고취소
		public int notifyCencel(int info_no, String user);

		public List<InfoNotifyVO> getNotifyList(int info_no);


}
