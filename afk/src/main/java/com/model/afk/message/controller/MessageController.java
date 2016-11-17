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
	public String getMsgList(@RequestParam("guideId") String guideId, Model model){
		//문의 작성페이지로 이동
		model.addAttribute("guideId", guideId);
		return "message/messageDetail";
	}
	
	@RequestMapping("/list")
	public String getMsgListGuide(@RequestParam("gId") String gId, @RequestParam("askId") String askId, Model model){
		//문의 작성페이지로 이동
		model.addAttribute("gId", gId);
		model.addAttribute("askId", askId);
		return "message/messageDetail";
	}
	
	/*@RequestMapping("")
	public String getMsgList(){
		//문의 작성페이지로 이동
		//model.addAttribute("guideId", guideId);
		return "message/messageDetail";
	}*/
	
	@RequestMapping(value="/msglist")
	public @ResponseBody List<MessageVO> getMsgList(@RequestParam("loginId") String id, HttpServletResponse response) throws Exception{
		//마이페이지에서 메시지 리스트 보이게
		List<MessageVO> msglist = ms.getMsgList(id);
		System.out.println(msglist.toString());
		return msglist;
	}
	
	@RequestMapping(value="/msglistG")
	public @ResponseBody List<MessageVO> getMsgListG(@RequestParam("loginId") String id, HttpServletResponse response) throws Exception{
		//마이페이지에서 메시지 리스트 보이게
		List<MessageVO> msglist = ms.getMsgListG(id);
		System.out.println(msglist.toString());
		return msglist;
	}
	
	@RequestMapping("/msgdetailList")
	public void msgDetailList(@RequestParam("loginId") String id, @RequestParam("guideId") String gid, HttpServletResponse response) throws Exception{
		//일반 유저인 경우, 주고받은 메세지 다 보이게
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
			job.put("rpic", list.getMb_rename_pic());
			
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
		
		//return msgdetailList;
		
	}
	
	@RequestMapping("/msgdetailListGuide")
	public void msgDetailListGuide(@RequestParam("askId") String id, @RequestParam("gId") String gid, HttpServletResponse response) throws Exception{
		//가이드인 경우, 주고받은 메세지 다 보이게
		MessageVO msgVO = new MessageVO(id, gid);
		
		List<MessageVO> msgdetailListG = ms.getMsgDetailListG(msgVO);
		System.out.println("메세지 디테일 리스트 가이드 : "+msgdetailListG.toString());
		JSONObject json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		DateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		
		for(MessageVO list : msgdetailListG){
			JSONObject job = new JSONObject();
			job.put("rid", list.getRecieve_id());
			job.put("sid", list.getSend_id());
			job.put("msgcontent", URLEncoder.encode(list.getMes_content(), "UTF-8"));
			job.put("mes_no", list.getMes_no());
			job.put("spic", list.getMb_rename_pic());
			
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
		
		//return msgdetailListG;
		
	}
	
	@RequestMapping("/msgdeleteR")
	public String deleteMsgR(@RequestParam("mesno") int mesNo){
		//로그인유저와 받는사람이 같은 경우, 해당 메세지 삭제하는 기능
		ms.deleteMsgR(mesNo);
		return "redirect:/mypage";
	}
	
	@RequestMapping("/msgdeleteS")
	public String deleteMsgS(@RequestParam("mesno") int mesNo){
		//로그인유저와 보낸 사람이 같은 경우, 해당 메세지 삭제하는 기능
		ms.deleteMsgS(mesNo);
		return "redirect:/mypage";
	}
	
	@RequestMapping("/sendmsg")
	public @ResponseBody int insertMsg(@RequestParam("parentno") int parentno, @RequestParam("sendid") String sender, @RequestParam("msgcontent") String msgcontent, @RequestParam("recieveid") String receiver){
		//메세지 보내는 기능
		MessageVO msg = new MessageVO();
		msg.setSend_id(sender);
		msg.setMes_content(msgcontent);
		msg.setRecieve_id(receiver);
		msg.setMes_no(parentno);
		
		int result = ms.insertMsg(msg);
		if(result > 0){
			System.out.println("msgController : " + sender + "가 " + receiver + "에게 " + msgcontent +parentno);
		}
		return result;
	}
	
	@RequestMapping("/sendmsgG")
	public @ResponseBody int insertMsgG(@RequestParam("parentno") int parentno, @RequestParam("sendid") String sender, @RequestParam("msgcontent") String msgcontent, @RequestParam("recieveid") String receiver){
		//메세지 보내는 기능
		MessageVO msg = new MessageVO();
		msg.setSend_id(sender);
		msg.setMes_content(msgcontent);
		msg.setRecieve_id(receiver);
		msg.setMes_no(parentno);
		
		int result = ms.insertMsg(msg);
		if(result > 0){
			System.out.println("msgController : " + sender + "가 " + receiver + "에게 " + msgcontent +parentno);
		}
		return result;
	}
}
