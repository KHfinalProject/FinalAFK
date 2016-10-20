package com.model.afk.infoboard.service;

import com.model.afk.infoboard.vo.InfoComment;

public interface InfoBoardCommentService {

	int insertBoardComment(InfoComment vo);

	int deleteBoardComment(int cno);

	int updateBoardComment(InfoComment vo);

}
