package com.model.afk.payment.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.support.SessionStatus;

import com.model.afk.guide.service.GuideBoardService;
import com.model.afk.guide.vo.GuideItem;
import com.model.afk.payment.vo.Payment;

@Controller
public class PaymentController {

	@Autowired
	private GuideBoardService gbs;
	
	public String getPurchasedList(Model model, int page){
		
		return "payment/purchasedList";
	}
	
	public String insertPayment(Model model, HttpSession session, GuideItem gi,
			 SessionStatus sessionStatus, BindingResult result){
		
		return "payment/purchaseProceed";
	}
	
	public String updatePayment(Model model, Payment payment, BindingResult result,
			SessionStatus sessionStatus, HttpServletRequest request){
		
		return "payment/purchasedList"; 
	}
	
	public String deletePaymennt(HttpSession session, int payNo){
		
		return "payment/purchasedList";
	}
}
