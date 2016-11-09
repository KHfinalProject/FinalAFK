package com.model.afk.notice.service;

import java.util.List;

import com.model.afk.notice.vo.Notice;

public interface NoticeService {

	

	public Notice noticeDelete(int noticeNo);

	public Notice noticeUpdate(int noticeNo);

	public Object noticeListAll();


	public int noticeInsert(Notice notice);

	public List<Notice> getNoticeList();
	


}
