package com.model.afk.notice.service;

import com.model.afk.notice.vo.Notice;

public interface NoticeService {

	public Notice noticeInsert();

	public Notice noticeDelete(int noticeNo);

	public Notice noticeUpdate(int noticeNo);

	public Object noticeListAll();

}
