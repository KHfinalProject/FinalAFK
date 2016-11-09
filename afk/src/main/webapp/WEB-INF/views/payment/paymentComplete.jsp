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

</style>

<body>

<div class="container">
	<div class="jumbotron">
		<h1>결제 완료</h1>
	</div><!--end of jumbotron-->

	<div class="row" id="ticket_header">
		<div class="col-md-3 col-md-offset-3">
			AFK
		</div>
		<div class="col-md-3 col-md-offset-3" style="border-left: 1px dashed gray">
			Boarding Pass
		</div>
	</div><!--end of ticket_header-->

	<div class="row" id="ticket_detail">
		<div class="col-md-4 col-md-offset-2">
			<table>
			<tr>
				<td>NAME </td>
				<td>ㅎㅎㅎ</td>
			</tr>
			<tr>
				<td>FLIGHT TO </td>
				<td>지역이름출력</td>
			</tr>
			<tr>
				<td>DEPT DATE</td>
				<td>2016-10-23</td>
			</tr>
			</table>
		</div>
		
		<div id="detail2" class="col-md-3 col-md-offset-3">
			<table>
			<tr>
				<td>담당 가이드</td>
				<td>ㅋㅋㅋ</td>
			</tr>
			<tr>
				<td>인원수</td>
				<td>3</td>
			</tr>
			<tr>
				<td>금액</td>
				<td>10000</td>
			</tr>
			</table>
		</div>
	</div><!--end of ticket_detail-->

	<div style="margin-top : 30px; text-align:center">
		<button class="btn btn-default">메인으로</button>
		&nbsp;&nbsp;
		<button class="btn btn-default">지난 구매내역 보기</button>
	</div>

</div><!--end of container-->

</body>
</html>

