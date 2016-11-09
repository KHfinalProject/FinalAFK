<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>상품 결제</title>
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
		/*border : 1px solid red;*/
	}
	
	#img {
		float : left;
	}

	#info {
		padding-left : 30px;
	}

	#info table{
		height : 200px;
	}

	#amount {
		margin-top : 30px;
		border-top : 1px solid #c1c1c1;
		margin-bottom : 40px;
		font-size : 18pt;
	}

	#buy_btn {
		width : 150px;
		height : 40px;
		color : white;
		font-size : 18pt;
		background-color : #04378c;
		-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	}

	#cancel_btn {
		width : 150px;
		height : 40px;
		font-size : 18pt;
		background-color : white;
		-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	}

	#btns {
		text-align : center;
	}

	#btns button:hover {
		background-color : #e64928;
		color : white;
	}

</style>

<body>

<div class="container">
	<div class="jumbotron">
		<h1>상품 결제</h1>
	</div><!--end of jumbotron-->

	<div id="detail">
		<div class="row" style="padding-left:5%">
			<div id="img" class="col-md-4" style="width:200px; height:200px; background-color:#333399">
				img
			</div><!--end of img-->
			<div id="info" class="col-md-8">
				<table>
				<tr>
					<td colspan="2"><h3>상품명</h3></td>
				</tr>
				<tr>
					<td width="70%">출발일</td>
					<td>2016-10-23</td>
				</tr>
				<tr>
					<td>담당 가이드</td>
					<td>ㅋㅋㅋ</td>
				</tr>
				<tr>
					<td>인원수</td>
					<td>1</td>
				</tr>
				</table>
			</div><!--end of info-->
		</div>
		
		<div id="amount">
			<div class="row">
				<div class="col-md-3 col-sm-offset-1"><span>결제금액 : <span></div>
				<div class="col-md-3 col-md-offset-2"><span id="total_amount">10000</span><span>원</span></div>
			</div>
		</div>

		<div class="row">
			<div id="btns">
				<button type="button" id="cancel_btn">취소</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="button" id="buy_btn">결제</button>
			</div><!--end of btns-->
		</div>

	</div><!--end of detail-->

</div><!--end of container-->

</body>
</html>

