package com.model.afk.message.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.message.dao.MessageDao;
import com.model.afk.message.vo.MessageVO;

@Service
public class MessageServiceImpl implements MessageService{
	@Autowired 	
	private MessageDao msgDao;
	
	@Override
	public List<MessageVO> getMsgList(String id) {
		return msgDao.getMsgList(id);
	}

	@Override
	public MessageVO getMsgDetail(MessageVO mvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteMsgR(int msgNo) {
		return msgDao.deleteMsgR(msgNo);
	}
	
	@Override
	public int deleteMsgS(int msgNo) {
		return msgDao.deleteMsgS(msgNo);
	}

	@Override
	public int insertMsg(MessageVO mvo) {
		return msgDao.insertMsg(mvo);
	}

	@Override
	public int insertMsgG(MessageVO mvo) {
		return msgDao.insertMsgG(mvo);
	}
	
	@Override
	public int updateOpen(MessageVO mvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MessageVO> getMsgDetailList(MessageVO msgVO) {
		return msgDao.getMsgDetailList(msgVO);
	}


}
