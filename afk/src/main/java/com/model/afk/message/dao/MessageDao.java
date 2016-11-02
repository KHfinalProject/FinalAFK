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
	
	public MessageVO getMsgDetail(MessageVO mvo){
		return mvo;
		
	}
	
	public int deleteMsg(int mesNo, HttpSession session){
		return mesNo;
		
	}
	
	public int insertMsg(MessageVO mvo){
		return sqlSession.insert(NAMESPACE + "insertmsg", mvo);
		
	}
	
	public int updateOpen(MessageVO mvo){
		return 0;
		
	}
}
