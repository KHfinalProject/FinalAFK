package com.model.afk.notice.dao;

import java.util.List;
import java.util.Map;

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
		 System.out.println(":::::::::: ::::::::dao ::::"+notice+":::::::::::");
		 return sqlSession.insert(NAMESPACE+"noticeInsert", notice);
		
	}


	public List<Notice> getNoticeList() {
		
		return sqlSession.selectList(NAMESPACE+"getNoticeList");
	}


	


	/*public Notice noticeDetailView(Map<String, Integer> map) {
		
		return sqlSession.selectOne(NAMESPACE+"noticeDetailView", map);
	}
*/

	public Notice noticeDetailView(int notice_no) {
		
		return sqlSession.selectOne(NAMESPACE+"noticeDetailView", notice_no);
	}


	public int noticeCount(int notice_no) {
		
		return sqlSession.update(NAMESPACE+"noticeCount",notice_no);
	}


	public Notice noticeUpdateView(int notice_no) {
		
		return sqlSession.selectOne(NAMESPACE+"noticeUpdateView",notice_no);
	}


	public int noticeUpdate(Notice notice) {
		
		return sqlSession.update(NAMESPACE+"noticeUpdate", notice);
	}


	public int noticeDelete(int notice_no) {
		
		return sqlSession.delete(NAMESPACE+"noticeDelete", notice_no);
	}



}
