<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>결제 화면</title>
  <meta charset="utf-8">
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
		
	});
</script>

<style type="text/css">
	div {
		
	}
	
	#ticket {
		margin-top : 100px;
		margin-bottom : 100px;
	}
	
	#ticket_header {
		background-color : #04378c;
		color : white;
		font-size : 20pt;
		border-radius : 12px 12px 0 0;
	}
	
	#ticket_detail {
		border-radius : 0 0 12px 12px;
		border-left : 1px solid #000000;
		border-right : 1px solid black;
		border-bottom : 1px solid black;
		
	}

	#ticket_detail table td{
		padding : 20px;
		font-weight : bold;
		font-size : 15pt;
	}
	
	#detail2 {
		border-left: 1px dashed gray;
	}
	
	@media all and (max-width : 991px){
	
		#detail2 {
			border-left : 1px solid black;
		}
	}
	
	#buttons {
		margin-top : 30px; 
		text-align : center;
		margin-bottom : 200px;
	}
	#buttons button {
		width : 150px;
		height : 40px;
		font-size : 12pt;
		background-color : #ebf7fc;
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
		border-radius:10px;
		/* border : none; */
	}

</style>

<body>

<div class="container">
	<div class="jumbotron">
		<h1>결제 완료</h1>
	</div><!--end of jumbotron-->
	
	<div id="ticket">
	<div class="row" id="ticket_header">
		<div class="col-md-3 col-md-offset-3">
			AFK
		</div>
		<div class="col-md-3 col-md-offset-3" style="border-left: 1px dashed gray">
			Boarding Pass
		</div>
	</div><!--end of ticket_header-->

	<div class="row" id="ticket_detail">
		<div class="col-md-4 col-md-offset-2" id="detail1">
			<table>
			<tr>
				<td>NAME </td>
				<td>${userName}</td>
			</tr>
			<tr>
				<td>FLIGHT TO </td>
				<td>${city }</td>
			</tr>
			<tr>
				<td>DEPT DATE</td>
				<td>${payment.departure_date}</td>
			</tr>
			</table>
		</div>
		
		<div id="detail2" class="col-md-3 col-md-offset-3">
			<table>
			<tr>
				<td>담당 가이드</td>
				<td>${guide }</td>
			</tr>
			<tr>
				<td>인원수</td>
				<td>${payment.travel_num }</td>
			</tr>
			<tr>
				<td>금액</td>
				<td>${payment.price }</td>
			</tr>
			</table>
		</div>
	</div><!--end of ticket_detail-->
	</div><!-- end of ticket -->

	<div id="buttons">
		<a href="/afk/guide/guideMain"><button onclick="location='guide/guideMain'">메인으로</button></a>
		&nbsp;&nbsp;
		<button>지난 구매내역</button>
	</div>

</div><!--end of container-->
<jsp:include page="../footer.jsp"/>

</body>
</html>

