package com.model.afk.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.notice.dao.NoticeDao;
import com.model.afk.notice.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired NoticeDao ndo;



	@Override
	public Notice noticeDelete(int noticeNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice noticeUpdate(int noticeNo) {
		// TODO Auto-generated method stub
		return null;
	}

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




}
