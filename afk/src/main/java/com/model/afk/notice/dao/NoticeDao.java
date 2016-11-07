package com.model.afk.notice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.notice.vo.Notice;

@Repository
public class NoticeDao {
	private static final String NAMESPACE = "noticeMapper.";
	@Autowired
	private SqlSession sqlSession;
	
	public int noticeInsert(Notice notice) {
		 System.out.println("::::::::::::::::::dao ::::"+notice+":::::::::::");
		 return sqlSession.insert(NAMESPACE+"noticeInsert", notice);
		
	}


}
