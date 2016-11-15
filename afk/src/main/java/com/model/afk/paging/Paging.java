package com.model.afk.paging;

import java.util.HashMap;
import java.util.Map;

public class Paging {
	/**
	 * Paging 클래스 사용법
	 * 
	 * 
	 * 
	 * **/
	 public Map Paging(int currentPage,int pageBlock, int blockCount){
	      Map<String,Integer> map = new HashMap<String,Integer>();
	      int startRn = 0;
	      int endRn = 0;
	      int resultPageNum = 0;
	      int forBegin = 0;
	      int forEnd = 0;
	      if(resultPageNum == 0){
	    	  resultPageNum = 1; 
	      }
	      
	     resultPageNum = (int)Math.ceil((double)currentPage / (double)blockCount);
	     forBegin = (resultPageNum -1) * blockCount +1;
	      forEnd = (resultPageNum -1) *blockCount + blockCount;
	      
	     /*currentPage = forBegin;*/

	      startRn = (currentPage -1 )* pageBlock +1;
	      endRn = currentPage * pageBlock;
	      map.put("forBegin", forBegin);
	      map.put("forEnd", forEnd);
	      map.put("startRn", startRn);
	      map.put("endRn", endRn);
	      return map;
	   }
	
	/**
	 * nextBlock : N:다음(▶) , P:이전(◀), S:처음(◀◀), E:끝 (▶▶)
	 * 
	 * **/
	
	 public Map Paging(int currentPage,int pageBlock,int blockCount,String nextBlock,int AllNoticeCount ){
	      Map<String,Integer> map = new HashMap<String,Integer>();
	      int startRn = 0;  				// 해당페이지 리스트 첫 rownum
	      int endRn = 0;					// 해당페이지 리스트 마지막 rownum
	      int cPageNum = 0;					// 현재 페이지 
	      int resultPageNum = 0;			// 페이지 결과
	      int forBegin = 0;					// 뷰 forEach begin
	      int forEnd = 0;					// 뷰 forEach end
	      
	      
	      int endPage = (int)Math.ceil((double)AllNoticeCount/(double)pageBlock);
	      int ePageNum = (int)Math.ceil((double)endPage / (double)blockCount);
	    
	      
	      cPageNum = (int)Math.ceil((double)currentPage / (double)blockCount);
	      
	      if(nextBlock.equals("N")){
	         resultPageNum = cPageNum +1;
	      }else if(nextBlock.equals("P")){
	         resultPageNum = cPageNum -1;
	      }else if(nextBlock.equals("S")){
	         resultPageNum = 1; 
	      }else if(nextBlock.equals("E")){
	        resultPageNum = ePageNum;
	      }
	       if(cPageNum== 0){
	            resultPageNum = 1;
	      }
	      forBegin = (resultPageNum -1) * blockCount +1;
	      
	      if(resultPageNum == ePageNum){
	         forEnd = endPage;
	      } else {
	         forEnd = (resultPageNum -1) *blockCount + blockCount;
	      }
	      
	      
	      currentPage = forBegin;
	      
	      startRn = (currentPage -1 )* pageBlock +1;
	      endRn = currentPage * pageBlock;
	      
	      
	      
	      map.put("forBegin", forBegin);
	      map.put("forEnd", forEnd);
	      map.put("currentPage", currentPage);
	      map.put("startRn", startRn);
	      map.put("endRn", endRn);
	      return map;
	   }
	   
}