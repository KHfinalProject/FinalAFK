package com.model.afk.payment.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.payment.dao.PaymentDao;
import com.model.afk.payment.vo.Payment;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDao pd;
	
	@Override
	public ArrayList<Payment> getPurchasedList(int page) {
		return pd.getPurchasedList(page);
	}

	@Override
	public int insertPayment(Payment payment) {
		return pd.insertPayment(payment);
	}

	@Override
	public int updatePayment(int payNo) {
		return pd.updatePayment(payNo);
	}

	@Override
	public int deletePayment(int payNo) {
		return pd.deletePayment(payNo);
	}

}
