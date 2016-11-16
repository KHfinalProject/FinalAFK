package com.model.afk.infoboard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.infoboard.vo.InfoBoardVO;
import com.model.afk.infoboard.vo.InfoNotifyVO;

@Repository
public class InfoBoardDao {
	
	private static final String NAMESPACE = "infoboard.";
	
	@Autowired
	private SqlSession sqlsession;

	public int insertBoard(InfoBoardVO vo) {
		return sqlsession.insert(NAMESPACE + "insertBoard", vo);
	}

	public int deleteBoard(int info_no) {
		
		return sqlsession.delete(NAMESPACE + "deleteBoard", info_no);
	}

	public List<InfoBoardVO> getBoardList(Map<String, Integer> map) {
		Object obj = sqlsession.selectList(NAMESPACE + "selectAll", map);
		System.out.println("@@@@$$$$$$!!!!!!!!!!!!");
		System.out.println(obj);
		System.out.println("@@@@$$$$$$!!!!!!!!!!!!");
		return sqlsession.selectList(NAMESPACE + "selectAll", map);
	}

	public int updateBoard(InfoBoardVO vo) {	
		return sqlsession.update(NAMESPACE + "updateBoard", vo);
	}

	public InfoBoardVO getBoardDetail(int info_no) {
		
		return sqlsession.selectOne(NAMESPACE + "detail", info_no);
	}

	public List<InfoBoardVO> getBoardSelectList(Map<String, Object> map) {
		
		return sqlsession.selectList(NAMESPACE + "selectBoard", map);
	}

	public InfoBoardVO boardDetail(int info_no) {
		// 디테일 페이지
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE + "detail", info_no);
	}
		// 디테일 페이지 조회 카운트
	public int addCount(int info_no) {
		// TODO Auto-generated method stub
		return sqlsession.update(NAMESPACE + "addCount", info_no);
	}
	
	public int notify(int info_no, String user) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("info_no", info_no);
		map.put("user", user);
		return sqlsession.insert(NAMESPACE + "notify", map);
	}

	public int notifyCencel(int info_no, String user) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("info_no", info_no);
		map.put("user", user);
		return sqlsession.delete(NAMESPACE + "notifyCencel", map);
	}

	public List<InfoNotifyVO> notifyList(int info_no) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(NAMESPACE + "notifyList", info_no);
	}

}
