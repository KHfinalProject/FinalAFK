package com.model.afk.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.notice.dao.NoticeDao;
import com.model.afk.notice.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired NoticeDao ndo;





	@Override
	public Object noticeListAll() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public int noticeInsert(Notice notice) {
		System.out.println(" ::: serviceimpl :: " + notice);
		return ndo.noticeInsert(notice);
	}

	@Override
	public List<Notice> getNoticeList() {
		// TODO Auto-generated method stub
		return ndo.getNoticeList();
	}

	@Override
	public Notice noticeDetailView(int notice_no) {
		// TODO Auto-generated method stub
		return ndo.noticeDetailView(notice_no);
	}

	@Override
	public int noticeCount(int notice_no) {
		
		return ndo.noticeCount(notice_no);
	}

	@Override
	public Notice noticeUpdateView(int notice_no) {
		
		return ndo.noticeUpdateView(notice_no);
	}

	@Override
	public int noticeUpdate(Notice notice) {
		
		return ndo.noticeUpdate(notice);
	}



	@Override
	public int noticeDelete(int notice_no) {
		
		return ndo.noticeDelete(notice_no);
	}





/*	@Override
	public Notice noticeDetailView(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return ndo.noticeDetailView(map);
	}
*/




}
 