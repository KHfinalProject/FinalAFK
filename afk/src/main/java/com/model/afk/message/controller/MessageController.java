package com.model.afk.message.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.afk.message.service.MessageService;
import com.model.afk.message.vo.MessageVO;

@Controller
public class MessageController {
	@Autowired
	private MessageService ms;
	
	//@RequestMapping("")
	public String getMsgList(Model model, HttpSession session, int page){
		//메세지 리스트 불러오는 & 이동 기능
		return null;
	}
	
	//@RequestMapping("")
	public String getMsgDetail(int mesNo, Model model, HttpSession session){
		//해당 메세지 디테일 불러오는 기능
		return null;
	}
	
	//@RequestMapping("")
	public String deleteMsg(int mesNo, HttpSession session){
		//해당 메세지 삭제하는 기능
		return null;
	}
	
	//@RequestMapping("")
	public String insertMsg(MessageVO msgvo, Model model, HttpSession session){
		//메세지 보내는 기능
		return null;
	}
}
