package com.model.afk.message.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.afk.message.service.MessageService;
import com.model.afk.message.vo.MessageVO;

@RequestMapping("/msg")
@Controller
public class MessageController {
	@Autowired
	private MessageService ms;
	
	@RequestMapping("")
	public String getMsgList(){
		//문의 작성페이지로 이동
		return "message/messageDetail";
	}
	
	@RequestMapping(value="/msglist", produces = "text/json; charset=UTF-8")
	public String getMsgList(@RequestParam("loginId") String id, HttpServletResponse response) throws Exception{
		//마이페이지에서 메시지 리스트 보이게
		List<MessageVO> msglist = ms.getMsgList(id);
		System.out.println(msglist.toString());
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(MessageVO list : msglist){
			
			JSONObject job = new JSONObject();
			job.put("rid", list.getRecieve_id());
			job.put("sid", list.getSend_id());
			job.put("msgcontent", URLEncoder.encode(list.getMes_content(), "UTF-8"));
			
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
	
	@RequestMapping("/msgdetailList")
	public List<MessageVO> msgDetailList(@RequestParam("loginId") String id, @RequestParam("guideId") String gid, HttpServletResponse response) throws Exception{
		//주고받은 메세지 다 보이게
		MessageVO msgVO = new MessageVO(id, gid);
		
		List<MessageVO> msgdetailList = ms.getMsgDetailList(msgVO);
		//System.out.println(msgdetailList.toString());
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		DateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		for(MessageVO list : msgdetailList){
			JSONObject job = new JSONObject();
			job.put("rid", list.getRecieve_id());
			job.put("sid", list.getSend_id());
			job.put("msgcontent", URLEncoder.encode(list.getMes_content(), "UTF-8"));
			job.put("mes_no", list.getMes_no());
			
			Date send = list.getSend_date();
			String sendDate = sdFormat.format(send);			
			job.put("sendDate", sendDate);
			
			Date view = list.getSend_date();
			String viewDate = sdFormat.format(view);
			job.put("viewDate", viewDate);
			
			jarr.add(job);
		}
		
		json.put("list", jarr);
		System.out.println(json.toJSONString());
		response.setContentType("application/json"); 
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		out.close();
		
		return msgdetailList;
		
	}
	
	/*@RequestMapping("/msgdetailList")
	public @ResponseBody List<MessageVO> msgDetailList(@RequestParam("loginId") String id, @RequestParam("guideId") String gid) throws Exception{
		MessageVO msgVO = new MessageVO(id, gid);
		List<MessageVO> msgdetailList = ms.getMsgDetailList(msgVO);
		
		return msgdetailList;
	}*/
	
	/*@RequestMapping("/msgdetailList")
	public void msgDetailList(@RequestParam("loginId") String id, @RequestParam("guideId") String gid, HttpServletResponse  response) throws Exception{
		MessageVO msgVO = new MessageVO(id, gid);
		List<MessageVO> msgdetailList = ms.getMsgDetailList(msgVO);
		
		//전송할 최종 json 객체
		JSONObject json = new JSONObject();

		json.put("list", msgdetailList);                
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json.toString());
		
		//return msgdetailList;
	}*/
	
	@RequestMapping("/msgdelete")
	public String deleteMsg(@RequestParam("mesno") int mesNo, HttpSession session){
		//해당 메세지 삭제하는 기능
		return null;
	}
	
	@RequestMapping("/sendmsg")
	public @ResponseBody int insertMsg(@RequestParam("sendid") String sender, @RequestParam("msgcontent") String msgcontent, @RequestParam("recieveid") String receiver){
		//메세지 보내는 기능
		MessageVO msg = new MessageVO();
		msg.setSend_id(sender);
		msg.setMes_content(msgcontent);
		msg.setRecieve_id(receiver);
		
		int result = ms.insertMsg(msg);
		if(result > 0){
			System.out.println("msgController : " + sender + "가 " + receiver + "에게 " + msgcontent);
		}
		return result;
	}
}
