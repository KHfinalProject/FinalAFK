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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.afk.guide.service.GuideBoardService;
import com.model.afk.guide.service.GuideCommentService;
import com.model.afk.guide.vo.GuideComment;
import com.model.afk.guide.vo.GuideFavorite;
import com.model.afk.guide.vo.GuideItem;
import com.model.afk.guide.vo.NotifyGItem;
import com.model.afk.guide.vo.StarPoint;
import com.model.afk.guide.vo.Test;
import com.model.afk.member.vo.Member;
import com.model.afk.payment.service.PaymentService;
import com.model.afk.payment.vo.Payment;


@RequestMapping("/guide")
@Controller("guideController")
public class GuideController {
	
	@Autowired 
	@Qualifier("guideBoardService")
	private GuideBoardService guideBoardService;
	
	@Autowired
	@Qualifier("guideCommentService")
	private GuideCommentService guideCommentService;
	
	@Autowired
	@Qualifier("paymentService")
	private PaymentService paymentService;
	
	//가이드 메인 페이지의 틀 로딩
	@RequestMapping("/guideMain")
	public String getGuideMain(Model model, HttpSession session, 
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="code", defaultValue="gui_no") String code, String keyword){
		System.out.println("======================guideMain=============");
		
		//DB에서 GuideItem list 가져옴 
		List<GuideItem> list = guideBoardService.getGuideList(page, code, keyword);
		
		model.addAttribute("list", list);
		
		System.out.println("list : " + list.toString());
			
		return "guide/main";
	}
	
	//가이드 메인 페이지에서 더보기 클릭 시 추가 데이터 로딩
	@RequestMapping("/guideMore")
	public @ResponseBody List<GuideItem> getMoreGuideItems(HttpSession session, 
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="code", defaultValue="gui_no") String code, String keyword) throws Exception{
		System.out.println("======================guideMore====================");
		List<GuideItem> list = guideBoardService.getGuideList(page, code, keyword);
				
		
		return list;
	}
	
	@RequestMapping("/guideSearch")
	public @ResponseBody List<GuideItem> getSearchedList(HttpSession session, 
			@RequestParam String keyword) throws Exception{
		System.out.println("======================guideSearch");
		List<GuideItem> list = guideBoardService.getSearchedList(keyword);
		
		return list;
	}
	
	//가이드 아이디 클릭 시 해당 가이드의 페이지로 이동
	@RequestMapping("/guideSub")
	public String getAllItems(Model model, HttpSession session, @RequestParam String writer, 
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="code", defaultValue="gui_no") String code){
		System.out.println("=====================guideSub======================");
			
		List<GuideItem> list = guideBoardService.getAllItems(writer, page, code); 
		
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
	public @ResponseBody List<GuideItem> getMoreSub(HttpSession session, 
			@RequestParam String writer, 
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam(value="code", defaultValue="gui_no") String code){
		System.out.println("===========================subMore============================");
		
		List<GuideItem> list = guideBoardService.getAllItems(writer, page, code);
		
		return list;		
	}	
	
	//대표 이미지 및 즐겨찾기 추가 여부 추가해서 가이드 상품 목록 리턴
	/*public List<GuideItem> getImageAndFavor(HttpSession session, List<GuideItem> list){
		
		
		//로그인한 사용자가 추가한 즐겨찾기가 있는지 체크하여 객체에 추가
		Member user = (Member) session.getAttribute("loginUser");
		List<GuideFavorite> myFavorList = null; 
		
		if(user != null){
			
			//로그인한 아이디를 DB에서 조회, 해당 사용자의 즐겨찾기 목록 가져옴
			myFavorList = guideBoardService.getMyFavorList(user.getMb_id());
			System.out.println("myFavorList : " + myFavorList.toString());
			
			if(myFavorList != null){
				for(int i = 0; i < list.size(); i++){
					for(int j = 0; j < myFavorList.size(); j++){
						if(list.get(i).getGui_no() == myFavorList.get(j).getFa_bd_no()){
							list.get(i).setGui_favorite('y');
						}else
							list.get(i).setGui_favorite('n');
					}//end of inner for
				}//end of outer for
			}
		}else{
			for(GuideItem g : list){
				g.setGui_favorite('n');
			}
		}
		
		return list;
	}*/
	

	//상품 사진 클릭 시 해당 상품 상세 페이지로 이동
	@RequestMapping("/guideDetail")
	public String getOneItem(Model model, @RequestParam int itemNo, 
			@RequestParam(value="page", defaultValue="1") int page, 
			@RequestParam String writer, HttpSession session){
		System.out.println("==============guideDetail==================");
		
		int result = guideBoardService.addCount(itemNo); //조회수 증가처리 메소드
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		List<GuideComment> commentList = null;
		GuideItem guideItem = null;
		Member guide = null;
		List<StarPoint> pointList = null;
		List<NotifyGItem> notifiedList = null;
		List<GuideFavorite> favorList = null;
		List<Payment> purchasedList = null;
		boolean purchased = false;
		boolean rated = false;
		int stars = 0;
		
		double avgPoint = 0;
				
		//조회수 증가처리 성공 시에만 객체 가져와서 넘김
		if(result > 0){
			//commentList = guideCommentService.getAllComments(itemNo, page); //댓글 목록
			commentList = getCommentList(itemNo);
			guideItem = guideBoardService.getOneItem(itemNo); //해당 가이드 상품 정보
			guide = guideBoardService.getGuideInfo(writer); //해당 가이드의 등록 정보
			pointList = guideBoardService.getPointList(itemNo); //해당 상품에 매겨진 별점 목록
			avgPoint = getAvgStarPoint(itemNo); //해당 상품의 별점 평균
			notifiedList = guideBoardService.getNotifiedList(itemNo); //해당 상품을 신고한 유저 목록
			favorList = guideBoardService.getOneGuideFavoriteList(itemNo); //해당 상품에 대한 즐겨찾기 목록
			purchasedList = paymentService.getPurchasedList(itemNo); //해당 상품의 구매목록
			
			//로그인 상태이고 구매 목록도 있다면
			if(purchasedList != null && loginUser != null){
				for(Payment p : purchasedList){
					if(p.getPay_id().equals(loginUser.getMb_id())) //로그인 유저가 해당 상품을 구매했는지 확인
						purchased = true; //구매했다면 purchased 변수에 true 저장
				}
			}
			
			//구매한 적이 있고 해당 상품에 대한 별점 리스트도 있다면
			if(pointList != null && purchased == true){
				for(StarPoint s : pointList){
					if(s.getMb_id().equals(loginUser.getMb_id())){ //로그인한 유저가 이미 별점을 준 적이 있는지 확인
						rated = true; //이미 별점을 준 유저라면 rated 변수에 true 저장
						if(rated) //이미 별점 준 내역이 있다면
							stars = s.getPoint(); //stars 변수에 해당 유저가 남긴 별점을 저장
						
					}//end of if
				}//end of for
			}//end of outer if
		}//end of if result			
		
		System.out.println("guide : " + guide.toString());
		System.out.println("commentList : " + commentList.toString());
		System.out.println("guideItem : " + guideItem.toString());
		System.out.println("point : " + avgPoint);
		System.out.println("purchased : " + purchased);
		System.out.println("rated : " + rated);
		System.out.println("stars : " + stars);
		
		model.addAttribute("commentList", commentList);
		model.addAttribute("guideItem", guideItem);
		model.addAttribute("guide", guide);
		model.addAttribute("pointList", pointList);
		model.addAttribute("notifiedList", notifiedList);
		model.addAttribute("favorList", favorList);
		model.addAttribute("point", avgPoint);
		model.addAttribute("stars", stars);
		model.addAttribute("purchased", purchased);
				
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
	
	//이미 해당 글을 신고했을 시 신고 취소 기능
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
		int result = guideBoardService.giveStarPoint(writer, itemNo, point);
		
		double avgPoint = 0;
		
		if(result > 0){//별점 입력 성공 시에만 별점 평균 다시 계산하여 가져옴
			avgPoint = getAvgStarPoint(itemNo);
		}
		
		return avgPoint;
	}
	
	//별점 수정
	@RequestMapping("/reviseStarPoint")
	public @ResponseBody double reviseStarPoint(@RequestParam String writer,
			@RequestParam int itemNo, @RequestParam int point){
		System.out.println("==================reviseStarPoint==============");
		
		double avgPoint = 0;
		StarPoint star = new StarPoint();
		star.setBoard_no(itemNo);
		star.setMb_id(writer);
		star.setPoint(point);
		
		int result = guideBoardService.reviseStarPoint(star);
		
		if(result > 0)
			avgPoint = getAvgStarPoint(itemNo);
			
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
		
		//gui_content 중 첨부된 이미지가 있을 시 대표 이미지로 사용
		String img_path = "";
		String content = gi.getGui_content();
		if(content.indexOf("/afk/resources/upload") != -1){ //gui_content 중 첨부이미지 있을 시
			//img_path 변수에 이미지 저장 경로만 추출하여 저장
			img_path = content.substring(content.indexOf("/afk/resources/upload"), content.indexOf(" title") -1);
			System.out.println("img_path : " + img_path);
			//GuideItem 객체에 이미지 저장 경로 공백을 제거하여 저장
			gi.setGui_image(img_path.trim());
		}else{//첨부 이미지가 없을 경우 임의로 대표 이미지 설정
			gi.setGui_image("../resources/images/guide/tempthumb.jpg");
		}
		
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
	public @ResponseBody int addFavoriteGI(@RequestParam String user, @RequestParam int itemNo){
		System.out.println("====================addFavorite==================");
		int result = guideBoardService.addFavoriteGI(user, itemNo);
		
		if(result > 0)
			System.out.println("즐겨찾기 추가 성공");
		
		return result;
	}
	
	@RequestMapping("/removeFavorite")
	public @ResponseBody int removeFavoriteGI(@RequestParam String user, @RequestParam int itemNo){
		System.out.println("====================removeFavorite==================");
		int result = guideBoardService.removeFavoriteGI(user, itemNo);
		
		if(result > 0)
			System.out.println("즐겨찾기 해제 성공");
		
		return result;
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
	
	@RequestMapping("/getAllComments")
	public List<GuideComment> getAllComments(@RequestParam int guideNo,
			@RequestParam(value="page", defaultValue="1") int page){
		List<GuideComment> commentList = guideCommentService.getAllComments(guideNo, page);
		
		return commentList;
	}
	
	//상품에 대한 댓글 작성
	@RequestMapping("/insertComment")
	public @ResponseBody List<GuideComment> insertComment(@RequestParam String writer, @RequestParam int itemNo, 
			@RequestParam String content){
		List<GuideComment> list = null;
		int result = guideCommentService.insertComment(writer, itemNo, content);
		if(result > 0){
			System.out.println("코멘트 입력 완료");
			list = getCommentList(itemNo);
			System.out.println("commentList" + list.toString());
		}			
		return list;
	}
	
	//댓글 리스트 가져옴
	public List<GuideComment> getCommentList(int itemNo) {
		List<GuideComment> commentList = guideCommentService.getCommentList(itemNo);
		return commentList;
	}

	//댓글 수정
	@RequestMapping("/updateComment")
	public @ResponseBody List<GuideComment> updateComment(@RequestParam int cmNo, 
			@RequestParam int itemNo, @RequestParam String content){
		System.out.println("================updateComment==============");
		List<GuideComment> list = null;
		int result = guideCommentService.updateComment(cmNo, content);
		if(result > 0){
			System.out.println("코멘트 수정 완료");
			list = getCommentList(itemNo);		
		}
		return list;
	}
	
	//댓글 삭제
	@RequestMapping("/deleteComment")
	public @ResponseBody List<GuideComment> deleteCommennt(@RequestParam int cmNo, 
			@RequestParam int itemNo){
		List<GuideComment> list = null;
		int result = guideCommentService.deleteComment(cmNo);
		if(result > 0){
			System.out.println("코멘트 삭제 완료");
			list = getCommentList(itemNo);			
		}
		return list;
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
