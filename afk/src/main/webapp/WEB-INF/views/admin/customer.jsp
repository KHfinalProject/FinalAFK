<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	});
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


</style>

<body>

<!-- 고객센터 시작 -->

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

<div id ="notice">
		
		<table class = "notice" cellspacing="0">
			<tr>
				<th width="10%">글번호</th>
				<th width="65%">제목</th>
				<th width="10%">작성일자</th>
				<th width="10%">조회수</th>
			</tr>
			<tr>
				<td>1</td>
				<td>ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</td>
				<td align="center">2016-10-20</td>
				<td align="right">0</td>
			</tr>
			<tr>
				<td>2</td>
				<td>ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</td>
				<td align="center">2016-10-20</td>
				<td align="right">0</td>
			</tr>
			<tr>
				<td>3</td>
				<td>ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</td>
				<td align="center">2016-10-20</td>
				<td align="right">0</td>
			</tr>
			<tr>
				<td>4</td>
				<td>ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ</td>
				<td align="center">2016-10-20</td>
				<td align="right">0</td>
			</tr>
		  </table>

	<!-- 글쓰기 버튼 -->
		 <div id="insert_notice" align="right">
			<br><input type="button" value="글쓰기">
		</div>
	<!-- 버튼 끝 -->
		</div>
	<!-- 공지사항 끝-->

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
		</form>
		</center>
	</div>
		 <!--  <nav id="paging">
		  <ul class="pagination">
		  			<li>
		  			  <a href="#" aria-label="Previous">
		  				<span aria-hidden="true">&laquo;</span>
		  			  </a>
		  			</li>
		  			<li><a href="#">1</a></li>
		  			<li><a href="#">2</a></li>
		  			<li><a href="#">3</a></li>
		  			<li><a href="#">4</a></li>
		  			<li><a href="#">5</a></li>
		  			<li>
		  			  <a href="#" aria-label="Next">
		  				<span aria-hidden="true">&raquo;</span>
		  			  </a>
		  			</li>
		  </ul>
		  		</nav> -->

		  </div><!--end of table-responsive-->
		</div><!--end of third tab-content-->
		<!-- 공지사항 탭 끝 -->

	</div><!--end of tab-content-->
</div>
</div><!--end of container-->

<!-- 푸터 시작 -->
<!-- <footer>
	<div id = "fwrap">
	<div class = "fd hidden-xs">스마트폰 크기에서는 안보이게
		<ul id="fmenu">
				<li class="footMenu"><a href="#">GUIDE</a></li>
				<li class="footMenu"><a href="#">CUSTOMER SERVICE</a></li>
				<li class="footMenu"><a href="#">BANK INFO</a></li>
				<li class="footMenu"><a href="#">DELIVERY</a></li>
		</ul>
	</div>
	<div class = "fd">
	<h1><img src="img/tel.png" width="50" height="50" border="0" alt="">&nbsp;1600-7000</h1>
	</div>
	<div class = "fd">
	AFK away from keyboard <br>
	copyright by take AFK<br>
	All right reserved<br>
	</div>
	
	</div>
	</footer> -->


</body>
</html>