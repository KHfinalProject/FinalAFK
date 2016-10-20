package com.model.afk.payment.service;

import java.util.ArrayList;

import com.model.afk.payment.vo.Payment;

public interface PaymentService {

	public ArrayList<Payment> getPurchasedList(int page);
	
	public int insertPayment(Payment payment);
	
	public int updatePayment(int payNo);
	
	public int deletePayment(int payNo);
}
