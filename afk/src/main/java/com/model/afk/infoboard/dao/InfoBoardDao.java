package com.model.afk.infoboard.dao;

import java.util.List;
import java.util.Map;

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
		System.out.println(vo);
		return sqlsession.insert(NAMESPACE + "insertBoard", vo);
	}

	public int deleteBoard(int bno) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<InfoBoardVO> getBoardList(Map<String, Integer> map) {
		Object obj = sqlsession.selectList(NAMESPACE + "selectAll", map);
		System.out.println("@@@@$$$$$$!!!!!!!!!!!!");
		System.out.println(obj);
		System.out.println("@@@@$$$$$$!!!!!!!!!!!!");
		return sqlsession.selectList(NAMESPACE + "selectAll", map);
	}

	public int updateBoard(InfoBoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	public InfoBoardVO getBoardDetail(int info_no) {
		
		return sqlsession.selectOne(NAMESPACE + "detail", info_no);
	}

	public List<InfoBoardVO> getBoardSelectList(Map<String, Object> map) {
		
		return sqlsession.selectList(NAMESPACE + "selectBoard", map);
	}

}
