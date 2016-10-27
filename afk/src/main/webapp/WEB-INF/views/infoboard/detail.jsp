<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
 <head>
 <meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/afk/resources/css/boarddetail.css" />
  <title>detail</title>
  <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- 셀렉트박스를 위한 부트스트랩 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">

<!-- 셀렉트 박스를 위한 부트스트랩 JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- starpoint -->
<script src="/afk/resources/flag/raty-2.7.0/vendor/jquery.js"></script>
<script src="/afk/resources/flag/raty-2.7.0/lib/jquery.raty.js"></script>
<script src="/afk/resources/flag/raty-2.7.0/demo/javascripts/labs.js" type="text/javascript"></script>
 </head>

 <body>
	<!-- header start -->
	<div>
		header
	</div>
	<!-- header end -->

	<div class="main1">
	<div class="header-container">
		<div class="bg-blur bg-img">
			<img src="/afk/resources/images/infoboard/img1.PNG"/>
		</div>
		<div class="content10">
			<div class="title-box">
				<div class="text-xs">
					<div class="score1 rating-box">
						<!-- <span class="icon">별</span>
						<span class="icon">별</span>
						<span class="icon">별</span>
						<span class="icon">별</span>
						<span class="icon">별</span> -->
					</div>
					<span>후기 한 개</span>
				</div>
				<div class="text-lg item-inline">
					몰디브 투어
				</div>
			</div>
			<div class="info-box">
				<div class="text-xs label">
					지역
				</div>
				<div class="text-xs label">
					세부지역
				</div>
			</div>
		</div>
	</div>
		<div class="boo-bar">
			<div class="boo-center item-inline">
				<div class="report">
				하트
				</div>
				<div class="pay">
				가격
				</div>
			</div>
		</div>
	<div class="detail-board">
		<div class="detail-content">
		내용<br>
		내용<br>
		내용<br><br>
		내용<br>
		내용<br>
		내용<br>
		내용<br>
		내용<br>
		내용<br>
		내용<br>
		내용<br>
		내용<br>
		내용<br>
		</div>
		<div class="detail-view">
			지도
		</div>
		<div class="detail-star">
			별점주기
			
		</div>
		<div class="detail-review">
			댓글
		</div>
	</div>
	</div>
	<div class="ff">
	<h1>foot</h1>
	</div>
	<div class="score1"></div>
	<script>
		$.fn.raty.defaults.path = '/afk/resources/flag/raty-2.7.0/lib/images';
		$('.score1').raty({readOnly:true, score:5 });
	</script>
 </body>
</html>