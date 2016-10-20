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
	public List<MessageVO> getMsgList(Map<String, Object> map, int msgpage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MessageVO getMsgDetail(MessageVO mvo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteMsg(MessageVO mvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertMsg(MessageVO mvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOpen(MessageVO mvo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
