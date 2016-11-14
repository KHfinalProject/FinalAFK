package com.model.afk.infoboard.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.infoboard.vo.InfoReportVO;

@Repository
public class InfoBoardReportDao { 
	private static final String NAMESPACE = "infoboard.";
	
	@Autowired private SqlSession sql;
	
	public int insertBoardReport(InfoReportVO vo) {
		return sql.insert(NAMESPACE + "insertBoardReport", vo);
	}

	public InfoReportVO selectBoardReport(InfoReportVO vo) {
		System.out.println(vo);
		return sql.selectOne(NAMESPACE + "selectBoardReport", vo);
	}

	public int deleteBoardReport(int no) {
		return sql.delete(NAMESPACE + "deleteBoardReport", no);
	}

}
