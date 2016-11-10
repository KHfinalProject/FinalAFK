package com.model.afk.notice.service;

import java.util.List;
import java.util.Map;

import com.model.afk.notice.vo.Notice;

public interface NoticeService {

	

	public int noticeDelete(int notice_no);


	public Object noticeListAll( );


	public int noticeInsert(Notice notice);

	public List<Notice> getNoticeList();

	

	/*public Notice noticeDetailView(Map<String, Integer> map);*/

	public Notice noticeDetailView(int notice_no);

	public int noticeCount(int notice_no);

	public Notice noticeUpdateView(int notice_no);

	public int noticeUpdate(Notice notice);
	
	

}
