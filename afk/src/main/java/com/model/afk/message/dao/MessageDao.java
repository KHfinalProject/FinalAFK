package com.model.afk.message.dao;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.message.vo.MessageVO;

@Repository
public class MessageDao {
	private static final String NAMESPACE = "msgMapper.";
	
	@Autowired 	
	private SqlSession sqlSession;
	
	public List<MessageVO>getMsgList(String id){
		return sqlSession.selectList(NAMESPACE + "selectmsgList", id);
		
	}
	
	public int deleteMsgR(int msgNo){
		return sqlSession.delete(NAMESPACE + "deletemsgR", msgNo);
		
	}
	
	public int deleteMsgS(int msgNo){
		return sqlSession.delete(NAMESPACE + "deletemsgS", msgNo);
		
	}
	
	public int insertMsg(MessageVO mvo){
		return sqlSession.insert(NAMESPACE + "insertmsg", mvo);
		
	}
	
	public int insertMsgG(MessageVO mvo){
		return sqlSession.insert(NAMESPACE + "insertmsg", mvo);
		
	}

	public List<MessageVO> getMsgDetailList(MessageVO msgVO) {
		return sqlSession.selectList(NAMESPACE + "selectMsgDetailList", msgVO);
	}
}
