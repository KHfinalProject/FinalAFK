package com.model.afk.infoboard.service;

import java.util.List;

import com.model.afk.infoboard.vo.InfoCommentVO;

public interface InfoBoardCommentService { 

	int insertBoardComment(InfoCommentVO vo);

	int deleteBoardComment(int cno);

	List<InfoCommentVO> selectBoardComment(int bno);
}
