package com.model.afk.payment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.afk.guide.vo.GuideItem;
import com.model.afk.member.vo.Member;
import com.model.afk.payment.vo.Payment;

@Repository
public class PaymentDao {

	private static final String NAMESPACE = "paymentMapper.";
	
	@Autowired
	private SqlSession sqlSession;
	
/*	public ArrayList<Payment> getPurchasedList(int page){
		
		return sqlSession.selectList(NAMESPACE + "getPurchasedList", page);
	}*/
	
	public int insertPayment(Payment payment){
		
		return sqlSession.insert(NAMESPACE + "insertPayment", payment);
	}
	
	public int updatePayment(int payNo){
		
		return sqlSession.update(NAMESPACE + "updatePayment", payNo);
	}
	
	public int deletePayment(int payNo){
		
		return sqlSession.delete(NAMESPACE + "deletePayment", payNo);
	}

	public Member getGuideInfo(String writer) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + "getGuideInfo", writer);
	}

	public GuideItem getOneItem() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE + "getOneItem");
	}

	public List<Payment> getPurchasedList(int itemNo) {
		return sqlSession.selectList(NAMESPACE + "getPurchasedList", itemNo);
	}
}
