<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>   
 
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>

<script type="text/javascript">
   
   
   
    $(function(){
      showNotice();
      customerInit();
   });
   function customerInit(currentPage){
   	 	$("#pageNum_" + currentPage).css("font-weight","bold");
   }
   function showNotice(){
         $("#notice").show();
         $("#faq").hide();
         $("#direct_q").hide();
      };
      function showFaq(){
         $("#notice").css("display","none");
         $("#faq").css("display","block");
         $("#direct_q").css("display","none");
      };

      function showDq(){
         $("#notice").css("display","none");
         $("#faq").css("display","none");
         $("#direct_q").css("display","block");
      };

      $(document).on("click",".question", function(){
         $(this).next().slideToggle();
      });
      function checkDelete(currentPage){
    	  if(confirm("체크된 항목의 글을 삭제하시겠습니까?") == true){
    			chekDelete(currentPage);
    		}
      }
      function chekDelete(currentPage){
    	
    	  chk = document.getElementsByName("deleteChk")
    	  var chek = new Array();
    	  var cnt = 0;
    	  for( var i = 0; i < chk.length; i++ ){
    		  if(chk[i].checked){
  				chek[cnt] = chk[i].value;
  				cnt++
    		  }
    	  }
    	
    	  location.replace("/afk/checkDelete?chek="+chek+"&currentPage="+currentPage) 
    	 
      }
</script>

<style type="text/css">
   .tab-content {
      margin : 50px;
      display : block;
      margin-left : auto;
      margin-right : auto;
   }

   #notice_table {
      border : 1px solid #d9d9d9;
      width : 100%;
      height : auto;
      
   }

   #notice_table th, tr, td {
      border : 1px solid #d1d1d1;
   }

   #paging {
      text-align : center;
   }

   #1to1inquiry_table {
      border : 1px solid #d1d1d1;
      width : 100%;
      height : auto;
   }

   #1to1inquiry_table th, tr, td{
      border : 1px solid #d1d1d1;
   }

    #faq {
      display : none;
   } 
   .faq {
      margin:0 auto;
      BORDER-TOP: 2px solid #3300cc;
      BORDER-BOTTOM: 2px solid #3300cc;
      background : white;

      width : 80%;
   }
   
   .faq tr th, .faq tr td{
      BORDER-BOTTOM: 1px solid #d9d9d9;
      padding : 10px;
   }
   .faq tr th {
      text-align : center;
   }
   .faq tr td:nth-child(2n+1), .faq tr th:nth-child(2n+1){
      background: #ebebeb;
   }
   .faq .question:hover {
      cursor : pointer;
      background : #ebebeb;
   }

   .faq .answer{
      display : none;
   }

   #direct_q {
      display : none;
   }
   .direct_q {
      margin:0 auto;
      BORDER-TOP: 2px solid #3300cc;
      BORDER-BOTTOM: 2px solid #3300cc;
      background : white;
      width : 80%;
   }
   .direct_q tr th{
      BORDER-BOTTOM: 1px solid #d9d9d9;
      padding : 10px;
      width : 20%;
   }
   /* 미디어쿼리 이용하여 글자크기 조정 */
   @media all and (max-width: 750px){
      .direct_q tr th{
         font-size : 10pt;
      }
   }

   @media all and (max-width: 300px){
      .direct_q tr th{
         font-size : 3pt;
      }
   
   }
    .direct_q tr td{
      BORDER-BOTTOM: 1px solid #d9d9d9;
      padding : 10px;
      text-align : left;
   }
   .direct_q tr td:nth-child(2n+1), .direct_q tr th:nth-child(2n+1){
      background: #ebebeb;
   }
   .direct_q select {
      width : 30%;
   }
   .direct_q input[name*="title"]{
      width : 98%;
   }
   .direct_q textarea{
      width : 98%;
      height : 200px;
   }
   #direct_q #dqBtn {
      background : #3399ff;
      border :1px solid #3399ff;
      color : white;
      font-size : 12pt;
   }

   .notice {
      margin:0 auto;
      BORDER-TOP: 2px solid #3300cc;
      BORDER-BOTTOM: 2px solid #3300cc;
      background : white;

      width : 80%;
      min-width : 280px;
   }
   @media all and (max-width: 750px){
      .notice {
         font-size : 8pt; 
      }
   }

   .notice tr th, .notice tr td{
      BORDER-BOTTOM: 1px solid #d9d9d9;
      padding : 10px;
   }
   .notice tr th {
      text-align : center;
   }
   .notice tr td:nth-child(3n+1), .notice tr th:nth-child(3n+1){
      background: #ebebeb;
   }
   .notice textarea{
      width : 98%;
      height : 200px;
   }

   .notice .question:hover {
      cursor : pointer;
      background : #ebebeb;
   }

   .cs_navi{
      list-style-type : none;
      padding : 0;
      margin : 0;
   }
   .cs_navi li {
      float : left;
      width : 33.33%;
      padding : 0;
      position : relative;
      line-height : 30px;
   }
   .cs_navi li a{
      font-size : 18px;
      font-weight:900;
      color : black;
      text-decoration:none;
      padding : 5px;/*변경*/
      display : block;
      
   }
   .cs_navi li a:hover{
      color : white;
      background : #3399ff;
      cursor : pointer;
   }
   @media all and (max-width: 1000px){
      .cs_navi li a{
         font-size : 17px;
      }
   }

   @media all and (max-width: 750px){
      .cs_navi li a{
         font-size : 13px;
         padding : 10px 0;
      }   
   }

   @media all and (max-width: 300px){
      .cs_navi li a{
         font-size : 11px;
         padding : 10px 0;
      }   
   }

   #contents{
      width :100%;
      min-height : 600px;
      margin : 5px auto;
      padding : 5px;
   }
   input[type=checkbox]
{
  /* Double-sized Checkboxes */
  -ms-transform: scale(2); /* IE */
  -moz-transform: scale(2); /* FF */
  -webkit-transform: scale(2); /* Safari and Chrome */
  -o-transform: scale(2); /* Opera */
  padding: 10px;
}

</style>

<body onload="customerInit(${currentPage})">
<!-- 고객센터 시작 --> 
<header>
<c:import url="../header.jsp"></c:import>
</header>

<div class="container">
   <div class="jumbotron">
      <h1 id="which">고객센터</h1>
   </div><!--end of jumbotron-->


   <div id="wrapper">
   <div id = "cs_menu">
      <ul class = "cs_navi">
         <li><a onclick="showNotice();" id = "no_btn">공지사항</a></li>
         <li><a onclick="showFaq();" id = "q_btn">FAQ</a></li>
         <li><a onclick="showDq();" id = "dq_btn">1:1문의</a></li>
      </ul>
   </div><!-- cs_menu -->

<!-- 공지사항 시작  -->   
<div id ="notice">
      
      <table class = "notice" cellspacing="0">
         <tr>
            <th width="5%">체크</th>
            <th width="10%">글번호</th>
            <th width="60%">제목</th>
            <th width="10%">작성일자</th>
            <th width="10%">조회수</th>
         </tr>
           <c:forEach var="n" items="${NoticeList}" varStatus="status">
          
         <tr>
            <td align="center"><input type="checkbox" class="cb1" name="deleteChk" value = "${n.notice_no}"></td>
            <td align="center">${n.notice_no }</td>
            <td align="center"><a href="/afk/noticeDetailView?notice_no=${n.notice_no}&currentPage=${currentPage}">${n.notice_title}</a></td>
            <td align="center">${n.notice_enrolldate }</td>
            <td align="right">${n.notice_count}</td>
         </tr>
         </c:forEach>
        
        </table><br>
  		<center> <div><a href="customer?currentPage=${currentPage}&nextBlock=S">[◀◀]</a><a href="customer?currentPage=${currentPage}&nextBlock=P">[◀]</a>
  		<c:forEach var="i" begin="${map.forBegin }" end="${map.forEnd  }" step="1">
  		<a id="pageNum_${i}" href="customer?currentPage=${i}&nextBlock=">[${i}]</a>&nbsp;
  		</c:forEach> 
  		<a href="customer?currentPage=${currentPage}&nextBlock=N">[▶]</a><a href="customer?currentPage=${currentPage}&nextBlock=E">[▶▶]</a> </div></center>
   <!-- 글쓰기 버튼 -->
     <c:if test="${loginUser.mb_grade eq '1'}">
        <div id="insert_notice" align="right">
   <br><input type="button" value="삭제하기" onclick="checkDelete(${currentPage})"/> &nbsp;<input type="button" value="글쓰기" onclick="location.href='/afk/noticeWrite?currentPage=${currentPage}'"/>
      </div> <!--  글쓰기 버튼 끝 -->
      </c:if>
</div><!-- 공지사항 끝-->

   <!-- faq 시작-->
   <div id = "faq">
   <table class = "faq" cellspacing ="0">
   <tr>
      <th width = "10%">No.</th><th>FAQ</th>
   </tr>
   <tr class = "question"><td>1</td><td>자주하는질문1</td></tr>
   <tr class = "answer"><td></td><td>만들어진답변1</td></tr>
   <tr class = "question"><td>2</td><td>자주하는질문2</td></tr>
   <tr class = "answer"><td></td><td>만들어진답변2</td></tr>
   <tr class = "question"><td>3</td><td>자주하는질문3</td></tr>
   <tr class = "answer"><td></td><td>만들어진답변3</td></tr>
   </table>
   </div>
<!-- FAQ 탭 끝 -->


   <div id = "direct_q">
   <form action="mail" method="post">
   <center>
   <table class="direct_q" cellspacing="0">

   <tr>
      <th>제목</th>
      <td><input type="text" name="subject"></td>
   </tr>
   <tr>
      <th>연락처</th>
      <td><input type="text" name="phone" size="20"></td>
   </tr>
   <tr>
      <th>이메일</th>
      <td>
      <input type="text" name="email">
      </td>
   </tr>
   <tr>
      <th>문의내용</th>
      <td><textarea name="content" rows="5" cols="50"></textarea></td>
   </tr>
   </table><br>
      <input type="submit" value = "문의하기" id = "dqBtn">
      </center>
      </form>
   </div>

        </div><!--end of table-responsive-->
      </div><!--end of third tab-content-->
      <!-- 공지사항 탭 끝 -->

   <!-- </div>end of tab-content
</div>
</div>end of container -->
<footer>
<c:import url="../footer.jsp"></c:import>
</footer>
</body>
</html>