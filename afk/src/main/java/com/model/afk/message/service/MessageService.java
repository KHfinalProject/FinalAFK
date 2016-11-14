package com.model.afk.message.service;

import java.util.*;

import com.model.afk.message.vo.MessageVO;

public interface MessageService {
	List<MessageVO> getMsgList(String id);
	MessageVO getMsgDetail(MessageVO mvo);
	int deleteMsgR(int msgNo);
	int deleteMsgS(int msgNo);
	int insertMsg(MessageVO mvo);
	int insertMsgG(MessageVO mvo);
	int updateOpen(MessageVO mvo);
	List<MessageVO> getMsgDetailList(MessageVO msgVO);
}
