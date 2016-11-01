package com.model.afk.infoboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.infoboard.vo.InfoBoardVO;

@Repository
public class InfoBoardDao {
	
	private static final String NAMESPACE = "infoboard.";
	
	@Autowired
	private SqlSession sqlsession;

	public int insertBoard(InfoBoardVO vo) { 
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteBoard(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<InfoBoardVO> getBoardList() {
		
		return sqlsession.selectList(NAMESPACE + "selectAll");
	}

	public int updateBoard(InfoBoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public InfoBoardVO getBoardDetail(int info_no) {
		
		return sqlsession.selectOne(NAMESPACE + "detail", info_no);
	}

}
