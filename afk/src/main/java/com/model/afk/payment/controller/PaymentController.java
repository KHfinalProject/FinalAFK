package com.model.afk.payment.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.model.afk.admin.Service.AdminMemberService;
import com.model.afk.admin.vo.AdminMember;
import com.model.afk.guide.service.GuideBoardService;
import com.model.afk.guide.vo.GuideItem;
import com.model.afk.member.vo.Member;
import com.model.afk.payment.service.PaymentService;
import com.model.afk.payment.vo.Payment;

@Controller
public class PaymentController {

	@Autowired
	private PaymentService ps;
	@Autowired
	private GuideBoardService gbs;
	@Autowired
	private AdminMemberService ams;
	
	
	// 결제페이지 이동
	@RequestMapping("/paymentProceed")
	public String paymentProceed(Model model){
		
		return "payment/paymentProceed";
	}
	
	// 결제 완료 페이지 이동
	@RequestMapping("/paymentComplete")
	public String getPurchasedList(Model model, int page){
		
		return "payment/paymentComplete";
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
