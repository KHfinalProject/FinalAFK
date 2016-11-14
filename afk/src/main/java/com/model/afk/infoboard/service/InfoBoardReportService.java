package com.model.afk.infoboard.service;

import com.model.afk.infoboard.vo.InfoReportVO;

public interface InfoBoardReportService { 

	int insertBoardReport(InfoReportVO vo);

	InfoReportVO selectBoardReport(InfoReportVO vo);

	int deleteBoardReport(int no);

	

}
