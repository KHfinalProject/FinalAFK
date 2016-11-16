package com.model.afk.payment.service;

import java.util.ArrayList;
import java.util.List;

import com.model.afk.guide.vo.GuideItem;
import com.model.afk.member.vo.Member;
import com.model.afk.payment.vo.Payment;

public interface PaymentService {

	public List<Payment> getPurchasedList(int page);
	
	public int insertPayment(Payment payment);
	
	public int updatePayment(int payNo);
	
	public int deletePayment(int payNo);
}
