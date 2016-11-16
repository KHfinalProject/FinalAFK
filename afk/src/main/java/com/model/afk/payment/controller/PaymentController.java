package com.model.afk.payment.controller;

import java.text.ParseException;

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
import com.model.afk.guide.service.GuideBoardService;
import com.model.afk.guide.vo.GuideItem;
import com.model.afk.member.vo.Member;
import com.model.afk.payment.service.PaymentService;
import com.model.afk.payment.vo.Payment;

@Controller
public class PaymentController {

	@Autowired
	private PaymentService paymentService;
	@Autowired
	private GuideBoardService guideBoardService;
	@Autowired
	private AdminMemberService ams;
	
	
	// 결제페이지 이동
	@RequestMapping("/paymentProceed")
	public String paymentProceed(Model model, @RequestParam String date,
			@RequestParam int num, @RequestParam int itemNo, @RequestParam String guideName,
			@RequestParam String guideId){
		
		System.out.println("===============paymentProceed=======================");
		System.out.println("date : " + date);
		GuideItem item = guideBoardService.getOneItem(itemNo);
		
		model.addAttribute("item", item);
		model.addAttribute("date", date);
		model.addAttribute("num", num);
		model.addAttribute("guideName", guideName);
		model.addAttribute("guideId", guideId);
						
		return "payment/paymentProceed";
	}
	
	// 결제 완료 페이지 이동
	@RequestMapping("/insertPayment")
	public String insertPayment(Model model, @RequestParam String userId,
			@RequestParam String userName, @RequestParam int price, 
			@RequestParam String depart_date, @RequestParam int travel_num,
			@RequestParam String email, @RequestParam String phone,
			@RequestParam String guideId, @RequestParam int itemNo) throws ParseException{
					
		Payment payment = new Payment();
		payment.setPay_id(userId);
		payment.setPay_name(userName);
		payment.setPay_phone(phone);
		payment.setPay_email(email);
		payment.setGui_no(itemNo);
		payment.setGuide_id(guideId);
		payment.setPrice(price);
		payment.setDeparture_date(depart_date);
		payment.setTravel_num(travel_num);
		
		System.out.println(payment.toString());
		System.out.println("date 어케 저장했지 : " + payment.getDeparture_date());
		
		int result = paymentService.insertPayment(payment);
		String view = "";
		
		if (result > 0){
			System.out.println("결제 DB 입력 성공");
			
			Member guide = guideBoardService.getGuideInfo(guideId);
			GuideItem g = guideBoardService.getOneItem(itemNo);
						
			model.addAttribute("payment", payment);
			model.addAttribute("userName", userName);
			model.addAttribute("guide", guide.getMb_name());
			model.addAttribute("city", g.getCity_name());
			
			view = "payment/paymentComplete";	
		}else{
			System.out.println("결제 DB 입력 실패");
			
		}
		
		return view;
	}
	
	
	
	public String updatePayment(Model model, Payment payment, BindingResult result,
			SessionStatus sessionStatus, HttpServletRequest request){
		
		return "payment/purchasedList"; 
	}
	
	public String deletePaymennt(HttpSession session, int payNo){
		
		return "payment/purchasedList";
	}
	
	
}
