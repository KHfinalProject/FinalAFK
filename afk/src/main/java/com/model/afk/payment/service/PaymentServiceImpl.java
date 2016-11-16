package com.model.afk.payment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.model.afk.payment.dao.PaymentDao;
import com.model.afk.payment.vo.Payment;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDao paymentDao;
	
	/*@Override
	public ArrayList<Payment> getPurchasedList(int page) {
		return pd.getPurchasedList(page);
	}*/

	@Override
	public int insertPayment(Payment payment) {
		return paymentDao.insertPayment(payment);
	}

	@Override
	public int updatePayment(int payNo) {
		return paymentDao.updatePayment(payNo);
	}

	@Override
	public int deletePayment(int payNo) {
		return paymentDao.deletePayment(payNo);
	}

	@Override
	public List<Payment> getPurchasedList(int itemNo) {
		return paymentDao.getPurchasedList(itemNo);
	}

}
