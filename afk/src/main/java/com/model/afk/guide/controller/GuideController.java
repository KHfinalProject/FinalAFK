package com.model.afk.guide.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.model.afk.guide.service.GuideBoardService;
import com.model.afk.guide.service.GuideCommentService;
import com.model.afk.guide.vo.GuideComment;
import com.model.afk.guide.vo.GuideItem;
import com.model.afk.guide.vo.NotifyGItem;
import com.model.afk.guide.vo.StarPoint;
import com.model.afk.guide.vo.Test;
import com.model.afk.member.vo.Member;


@RequestMapping("/guide")
@Controller("guideController")
public class GuideController {
	
	@Autowired 
	@Qualifier("guideBoardService")
	private GuideBoardService guideBoardService;
	
	@Autowired
	@Qualifier("guideCommentService")
	private GuideCommentService guideCommentService;
	
	//가이드 메인 페이지의 틀 로딩
	@RequestMapping("/guideMain")
	public String getGuideMain(Model model, 
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="code", defaultValue="gui_no") String code){
		System.out.println("======================guideMain=============");
		
		//DB에서 GuideItem list 가져옴 
		List<GuideItem> list = guideBoardService.getGuideList(page, code);
		list = getImagePath(list); //GuideItem 객체의 gui_content 중 이미지를 찾아 대표이미지로 만들고, 없으면 임의 사진을 넣어 리스트 재정비
		
		model.addAttribute("list", list);
			
		System.out.println(list.toString());
			
		return "guide/main";
	}
	
	//가이드 메인 페이지에서 더보기 클릭 시 추가 데이터 로딩
	@RequestMapping("/guideMore")
	public @ResponseBody List<GuideItem> getMoreGuideItems(@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="code", defaultValue="gui_no") String code) throws Exception{
		System.out.println("======================guideMore====================");
		List<GuideItem> list = guideBoardService.getGuideList(page, code);
		list = getImagePath(list);		
		
		return list;
	}
	
	//가이드 아이디 클릭 시 해당 가이드의 페이지로 이동
	@RequestMapping("/guideSub")
	public String getAllItems(Model model, @RequestParam String writer, 
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="code", defaultValue="gui_no") String code){
		System.out.println("=====================guideSub======================");
			
		List<GuideItem> list = guideBoardService.getAllItems(writer, page, code); 
		list = getImagePath(list);
		Member guide = guideBoardService.getGuideInfo(writer); //해당 페이지의 가이드 기본 정보 가져옴(Member 타입)
		int total = guideBoardService.getTotalCount(writer); //해당 가이드가 등록한 상품의 총수량 카운트
					
		model.addAttribute("list", list); 
		model.addAttribute("guide", guide);
		model.addAttribute("total", total);
			
		System.out.println(list.toString());
			
		return "guide/sub";
	}

	//서브 페이지에서 더보기 클릭 시 추가 데이터 로딩
	@RequestMapping("/subMore")
	public @ResponseBody List<GuideItem> getMoreSub(@RequestParam String writer, 
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="code", defaultValue="gui_no") String code){
		System.out.println("===========================subMore============================");
		
		List<GuideItem> list = guideBoardService.getAllItems(writer, page, code);
		list = getImagePath(list);	
		
		return list;		
	}	
	
	//gui_content 중 첨부된 이미지가 있을 시 대표 이미지로 사용하게 하는 메소드
	public List<GuideItem> getImagePath(List<GuideItem> list){
		String img_path = "";
		for(GuideItem g : list){
			String e = g.getGui_content();
			if(e.indexOf("/afk/resources/upload") != -1){ //gui_content 중 첨부이미지 있을 시
				//img_path 변수에 이미지 저장 경로만 추출하여 저장
				img_path = e.substring(e.indexOf("/afk/resources/upload"), e.indexOf(" title") -1);
				System.out.println("img_path : " + img_path);
				//GuideItem 객체에 이미지 저장 경로 공백을 제거하여 저장
				g.setGui_image(img_path.trim());
			}else{//첨부 이미지가 없을 경우 임의로 대표 이미지 설정
				g.setGui_image("../resources/images/guide/tempthumb.jpg");
			}				
		}
		return list;
	}

	//상품 사진 클릭 시 해당 상품 상세 페이지로 이동
	@RequestMapping("/guideDetail")
	public String getOneItem(Model model, @RequestParam int itemNo, 
			@RequestParam(value="page", defaultValue="1") int page, 
			@RequestParam String writer){
		System.out.println("==============guideDetail==================");
		
		int result = guideBoardService.addCount(itemNo); //조회수 증가처리 메소드
		
		List<GuideComment> commentList = null;
		GuideItem guideItem = null;
		Member guide = null;
		List<StarPoint> pointList = null;
		List<NotifyGItem> notifiedList = null;
		
		double avgPoint = 0;
				
		//조회수 증가처리 성공 시에만 객체 가져와서 넘김
		if(result > 0){
			commentList = guideCommentService.getAllComments(itemNo, page); //댓글 목록
			guideItem = guideBoardService.getOneItem(itemNo); //해당 가이드 상품 정보
			guide = guideBoardService.getGuideInfo(writer); //해당 가이드의 등록 정보
			pointList = guideBoardService.getPointList(itemNo); //해당 상품에 매겨진 별점 목록
			avgPoint = getAvgStarPoint(itemNo); //해당 상품의 별점 평균
			notifiedList = guideBoardService.getNotifiedList(itemNo); //해당 상품을 신고한 유저 목록
		}			
		
		System.out.println("guide : " + guide.toString());
		System.out.println("commentList : " + commentList.toString());
		System.out.println("guideItem : " + guideItem.toString());
		System.out.println("point : " + avgPoint);
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("guideItem", guideItem);
		model.addAttribute("guide", guide);
		model.addAttribute("pointList", pointList);
		model.addAttribute("notifiedList", notifiedList);
		System.out.println("notifiedList : " + notifiedList.toString());
		model.addAttribute("point", avgPoint);
				
		return "guide/detail";
	}
	
	//아이콘 클릭 시 신고 처리 기능
	@RequestMapping("/notifyGuideItem")
	public @ResponseBody int notifyItem(@RequestParam int itemNo, @RequestParam String user){
		int result = guideBoardService.notifyItem(itemNo, user);
		if(result > 0)
			System.out.println("글 신고 : 업데이트 성공");
		
		return result;
	}
	
	@RequestMapping("/cancelNotifyItem")
	public @ResponseBody int cancelNotifyItem(@RequestParam int itemNo, @RequestParam String user){
		int result = guideBoardService.cancelNotifyItem(itemNo, user);
		if(result > 0)
			System.out.println("글 신고 취소 : 업데이트 성공");
		
		return result;
	}
	
	//별점 입력
	@RequestMapping("/giveStarPoint")
	public @ResponseBody double giveStarPoint(@RequestParam String writer,
			@RequestParam int itemNo, @RequestParam int point){
		System.out.println("=================giveStarPoint=================");
		System.out.println("itemNo : " + itemNo);
		int result = guideBoardService.giveStarPoint(writer, itemNo, point);
		
		double avgPoint = 0;
		
		if(result > 0){//별점 입력 성공 시에만 별점 평균 다시 계산하여 가져옴
			avgPoint = getAvgStarPoint(itemNo);
		}
		
		return avgPoint;
	}
	
	//별점 평균 계산하여 반환
	@RequestMapping("/getAvgStarPoint")
	public @ResponseBody double getAvgStarPoint(@RequestParam int itemNo){
		System.out.println("================getAvgStarPoint==============");
		double average = 0; //반올림 전 평균
		double totalPoint = 0; //별점 총합산
		double count = 0; //별점 준 사람들 수
		double avgPoint = 0; //반올림 후 평균
		
		List<StarPoint> pointList = guideBoardService.getPointList(itemNo);
		if(pointList != null){ //별점 준 내역이 있을 때만 평균 계산
			for(StarPoint s : pointList){
				totalPoint += s.getPoint(); //별점을 꺼내 총 합산 구함
				count++;
			}
			average = totalPoint / count; //평균 계산
			avgPoint = Double.parseDouble(String.format("%.1f", average)); //소수점 첫째자리까지만 표기
		}
		
		if(Double.isNaN(avgPoint) == true) //만약 avgPoint의 값이 없을 경우 0을 대입함
			avgPoint = 0;
		
		return avgPoint;
	}
	
	@RequestMapping("/insertGuideForm")
	public String insertGuideForm(){
		//가이드 글쓰기 페이지로 이동하는 메소드
		return "guide/insertGuideForm";
	}
	
	@RequestMapping("/insertItem")
	public String insertItem(GuideItem gi, HttpServletResponse response){
		//가이드 글 등록하는 메소드
		int result = guideBoardService.insertItem(gi);
		
		if(result > 0){
			try {
				response.sendRedirect("/afk/guide/guideMain");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return "guide/detail";
	}	
	
	@RequestMapping("/addFavorite")
	public void addFavoriteGI(String user, int itemNo){
		int result = guideBoardService.addFavoriteGI(user, itemNo);
	}
	
	@RequestMapping("/removeFavorite")
	public void removeFavoriteGI(String user, int itemNo){
		int result = guideBoardService.removeFavoriteGI(user, itemNo);
		
	}
	
	public String searchGuide(Model model, String keyword){
		
		return "guide/main";
	}
	
	public String searchItem(Model model, String keyword){
		
		return "guide/sub";
	}
	

	@RequestMapping("/updateGuideForm")
	public String updateGuideForm(@RequestParam("itemNo") int itemNo, Model model){
		//가이드 글 수정 페이지로 이동하는 메소드
		GuideItem gi = guideBoardService.getOneItem(itemNo);
		
		if(gi != null){
			model.addAttribute("guideItem", gi);
			return "guide/updateGuideForm";
		}
		return null;	
	}
	
	@RequestMapping("/updateItem")
	public String updateItem(GuideItem gi, HttpServletResponse response){
		//가이드 글 수정하는 메소드
		int result = guideBoardService.updateItem(gi);
		
		if(result > 0){
			try {
				response.sendRedirect("/afk/guide/guideDetail?itemNo=" + gi.getGui_no() 
										+ "&writer=" + gi.getGui_writer());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	@RequestMapping("/deleteGuide")
	public String deleteItem(@RequestParam("itemNo") int guideNo, 
							 HttpServletResponse response) throws IOException{
		
		int result = guideBoardService.deleteItem(guideNo);
		
		if(result > 0){
			response.sendRedirect("/afk/guide/guideMain");
		}
		
		return null;
	}
	
	public String insertComment(Model model, HttpSession session, 
			SessionStatus sessionStatus, BindingResult result){
		
		return "guide/detail";
	}
	
	
	public String updatecomment(Model model, GuideComment gc, 
			BindingResult result, SessionStatus sessionStatus){
		
		return "guide/detail";
	}
	
	public String deleteCommennt(HttpSession session, int cmNo){
		
		return "guide/detail";
	}
	
	
	//페이지 로딩 시 전체적인 틀만 먼저 로딩
	@RequestMapping("/test.do")
		public String test(Model model, 
				@RequestParam(value="testNo", defaultValue= "1") int testNo){
			System.out.println("=================guideMain.do======================");
			List<Test> list = guideBoardService.paging(testNo);
			model.addAttribute("list", list);
			return "guide/test";
		}
		
		//더보기 버튼 클릭 시 다음 데이터 불러옴
	@RequestMapping("/testMore.do")
	public @ResponseBody List<Test> test2(HttpServletResponse response,
				@RequestParam int testNo) throws Exception{
			System.out.println("=================MoreList.do======================");
			
			//List<Test> list = guideBoardService.first();
			List<Test> list = guideBoardService.paging(testNo);
			JSONObject json = new JSONObject();
			JSONArray jarr = new JSONArray();
			
			for(Test t : list){
				JSONObject job = new JSONObject();
				job.put("col", t.getCol());
				job.put("title", URLEncoder.encode(t.getTitle(), "UTF-8"));//한글 깨지지 않도록 
				
				jarr.add(job);
			}
			
			json.put("list", jarr);
			System.out.println(json.toJSONString());
			response.setContentType("application/json"); 
			PrintWriter out = response.getWriter();
			out.print(json.toJSONString());
			out.flush();
			out.close();
			
			return list; //List<Test> list 형태로 반환
		}
}
