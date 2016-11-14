package com.model.afk.infoboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.infoboard.vo.InfoCommentVO;

@Repository
public class InfoBoardCommentDao { 
	private final static String NAMESPACE = "infoboard.";
	@Autowired private SqlSession sql;

	public int insertBoardComment(InfoCommentVO vo) {
		return sql.insert(NAMESPACE + "insertBoardComment", vo);
	}

	public int deleteBoardComment(int cno) {
		return sql.delete(NAMESPACE + "deleteBoardComment", cno);
	}

	public List<InfoCommentVO> selectBoardComment(int bno) {
		return sql.selectList(NAMESPACE + "selectBoardComment", bno);
	}
}
