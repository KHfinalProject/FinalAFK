package com.model.afk.infoboard.service;

import com.model.afk.infoboard.vo.InfoCommentVO;

public interface InfoBoardCommentService { 

	int insertBoardComment(InfoCommentVO vo);

	int deleteBoardComment(int cno);

	int updateBoardComment(InfoCommentVO vo);

}
