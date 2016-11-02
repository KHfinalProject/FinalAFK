package com.model.afk.message.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model.afk.message.service.MessageService;
import com.model.afk.message.vo.MessageVO;

@RequestMapping("/msg")
@Controller
public class MessageController {
	@Autowired
	private MessageService ms;
	
	@RequestMapping("")
	public String getMsgList(){
		//문의 작성
		return "message/messageDetail";
	}
	
	@RequestMapping("/msglist")
	public String getMsgList(@RequestParam("loginId") String id, HttpServletResponse response) throws Exception{
		List<MessageVO> msglist = ms.getMsgList(id);
		System.out.println(msglist.toString());
		
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(MessageVO list : msglist){
			JSONObject job = new JSONObject();
			job.put("rid", list.getRecieve_id());
			job.put("sid", list.getSend_id());
			job.put("msgcontent", list.getMsg_content());
			
			jarr.add(job);
		}
		
		json.put("list", jarr);
		System.out.println(json.toJSONString());
		response.setContentType("application/json"); 
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		out.close();
		
		return "redirect:/msg/messageDetail";
	}
	
	@RequestMapping("/msgdelete")
	public String deleteMsg(@RequestParam("mesno") int mesNo, HttpSession session){
		//해당 메세지 삭제하는 기능
		return null;
	}
	
	@RequestMapping("/sendmsg")
	public String insertMsg(@RequestParam("sendid") String sender, @RequestParam("msgcontent") String msgcontent, @RequestParam("recieveid") String receiver){
		//메세지 보내는 기능
		MessageVO msg = new MessageVO();
		msg.setSend_id(sender);
		msg.setMsg_content(msgcontent);
		msg.setRecieve_id(receiver);
		
		int result = ms.insertMsg(msg);
		if(result > 0){
			System.out.println("메세지 보냄");
		}
		System.out.println("msgController : " + sender + ", " + msgcontent);
		return "redirect:/message/messageWrite";
	}
}
