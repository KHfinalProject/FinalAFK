package com.model.afk.message.service;

import java.util.*;

import com.model.afk.message.vo.MessageVO;

public interface MessageService {
	List<MessageVO> getMsgList(String id);
	int deleteMsgR(int msgNo);
	int deleteMsgS(int msgNo);
	int insertMsg(MessageVO mvo);
	int insertMsgG(MessageVO mvo);
	List<MessageVO> getMsgDetailList(MessageVO msgVO);
	List<MessageVO> getMsgListG(String id);
}
