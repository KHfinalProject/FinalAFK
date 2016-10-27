<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" type="text/css" href="/afk/resources/css/test.css" />
  <title>infoboardlist</title>
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
</head>
<script>
	$(document).ready(function(){
		$('#continent-btn').click(function(){
			$('#continent-menu').toggle();
		});
	});
</script>
  <body>
	<!-- Start -->
	<div>
		<!-- header Start -->
		<div>
			<h1>header</h1>
		</div>
		<!-- header end -->
		<nav class="nabar-container" style="display:block;">
			<ul class="nav nav-pills">
				<li class="nav-item nav-arrow" id="continent-btn">지역</li>
				<li class="nav-item nav-arrow">나라</li>
				<li class="nav-item nav-arrow">도시</li>
			</ul>
			<div class="item-container" style="position:absolute; top:106px;">
				<div class="item-box continent">
					<ul class="dropdown-menu" id="continent-menu" style="display:none;">
						<li><a><span class="text">아메리카</span></a></li>
						<li><a><sapn class="text">유럽</sapn></a></li>
						<li><a><sapn class="text">아시아</sapn></a></li>
						<li><a><sapn class="text">오세아니아</sapn></a></li>
						<li><a><sapn class="text">아프리카</sapn></a></li>
						<li><a><sapn class="text">국내</sapn></a></li>
					</ul>
				</div>
				<div class="item-box country" style="display:block;">
					<ul class="dropdown-menu" style="width:117px;">
						<li><a><span class="text">미국</span></a></li>
						<li><a><span class="text">캐나다</span></a></li>
						<li><a><span class="text">아르헨티나</span></a></li>
						<li><a><span class="text">멕시코</span></a></li>
						<li><a><span class="text">페루</span></a></li>
						<li><a><span class="text"></span></a></li>
						<li><a><span class="text"></span></a></li>
						<li><a><span class="text"></span></a></li>
						<li><a><span class="text"></span></a></li>
					</ul>
				</div>
				<div class="item-box city solo"></div>
			</div>		
		</nav>	
		<!-- img content -->
		<div class="infolist-img">
			<h1><img src="/afk/resources/images/infoboard/HongKong2.jpg" width="100%" height="300" border="0" alt=""></h1>
		</div>
		<!-- img content end -->
		<h1  style="text-align:center">여행지를 구경해 보세요</h1>
		<!-- select bar start -->
		<div class="bselect">			
			<input type="button" value="인기순" onclick="">
			<input type="button" value="별점순" onclick="">
			<input type="button" value="조회순" onclick="">
			<input type="button" value="최신순" onclick="">
			<input type="button" value="가격순" onclick="">
		</div>
		<!-- select bar end -->
		
		<!-- content start -->
		<div class="kcol-lg-12">
		<div class="boardmain kcol-lg-3">
			<div class="boardtop">
				<div class="boardcount">조회수</div>
				<div class="boardreport">찜</div>
			</div>
			<div class="boardphoto"><img src="/afk/resources/images/infoboard/Hong_Kong_China_09.jpg"></div>
			<div class="boardfoot">
				<div class="boardstar">별점</div>
				<div class="boardinfo">사진</div>
				<div class="boardname">아이디</div>
				<div class="boardtitle">제목</div>
				<div class="boardpay">가격</div>
			</div>
		</div>
		
		<div class="boardmain kcol-lg-3">
			<div class="boardtop">
				<div class="boardcount">조회수</div>
				<div class="boardreport">찜</div>
			</div>
			<div class="boardphoto"><img src="/afk/resources/images/logo.png"></div>
			<div class="boardfoot">
				<div class="boardstar">별점</div>
				<div class="boardinfo">사진</div>
				<div class="boardname">아이디</div>
				<div class="boardtitle">제목</div>
				<div class="boardpay">가격</div>
			</div>
		</div>

		<div class="boardmain kcol-lg-3">
			<div class="boardtop">
				<div class="boardcount">조회수</div>
				<div class="boardreport">찜</div>
			</div>
			<div class="boardphoto"><img src="/afk/resources/images/infoboard/Hong_Kong_China_09.jpg"></div>
			<div class="boardfoot">
				<div class="boardstar">별점</div>
				<div class="boardinfo">사진</div>
				<div class="boardname">아이디</div>
				<div class="boardtitle">제목</div>
				<div class="boardpay">가격</div>
			</div>
		</div>

		<div class="boardmain kcol-lg-3">
			<div class="boardtop">
				<div class="boardcount">조회수</div>
				<div class="boardreport">찜</div>
			</div>
			<div class="boardphoto"><img src="/afk/resources/images/infoboard/Hong_Kong_China_09.jpg"></div>
			<div class="boardfoot">
				<div class="boardstar">별점</div>
				<div class="boardinfo">사진</div>
				<div class="boardname">아이디</div>
				<div class="boardtitle">제목</div>
				<div class="boardpay">가격</div>
			</div>
		</div>
		</div>

		<div class="kcol-lg-12">
		<div class="boardmain kcol-lg-3">
			<div class="boardtop">
				<div class="boardcount">조회수</div>
				<div class="boardreport">찜</div>
			</div>
			<div class="boardphoto"><img src="/afk/resources/images/infoboard/Hong_Kong_China_09.jpg"></div>
			<div class="boardfoot">
				<div class="boardstar">별점</div>
				<div class="boardinfo">사진</div>
				<div class="boardname">아이디</div>
				<div class="boardtitle">제목</div>
				<div class="boardpay">가격</div>
			</div>
		</div>
		
		<div class="boardmain kcol-lg-3">
			<div class="boardtop">
				<div class="boardcount">조회수</div>
				<div class="boardreport">찜</div>
			</div>
			<div class="boardphoto"><img src="/afk/resources/images/infoboard/Hong_Kong_China_09.jpg"></div>
			<div class="boardfoot">
				<div class="boardstar">별점</div>
				<div class="boardinfo">사진</div>
				<div class="boardname">아이디</div>
				<div class="boardtitle">제목</div>
				<div class="boardpay">가격</div>
			</div>
		</div>

		<div class="boardmain kcol-lg-3">
			<div class="boardtop">
				<div class="boardcount">조회수</div>
				<div class="boardreport">찜</div>
			</div>
			<div class="boardphoto"><img src="/afk/resources/images/infoboard/Hong_Kong_China_09.jpg"></div>
			<div class="boardfoot">
				<div class="boardstar">별점</div>
				<div class="boardinfo">사진</div>
				<div class="boardname">아이디</div>
				<div class="boardtitle">제목</div>
				<div class="boardpay">가격</div>
			</div>
		</div>
		<div class="boardmain kcol-lg-3">
			<div class="boardtop">
				<div class="boardcount">조회수</div>
				<div class="boardreport">찜</div>
			</div>
			<div class="boardphoto"><img src="/afk/resources/images/infoboard/Hong_Kong_China_09.jpg"></div>
			<div class="boardfoot">
				<div class="boardstar">별점</div>
				<div class="boardinfo">사진</div>
				<div class="boardname">아이디</div>
				<div class="boardtitle">제목</div>
				<div class="boardpay">가격</div>
			</div>
		</div>
		</div>
		<!-- content end -->
		
		<!-- footer start 인데 올라가서 이름씀 -->
		<div style="text-align:center">
			<h1></h1>
		</div>
		<!-- footer end 이상하다이거 -->
	</div>
	<!-- 이게푸터일듯 -->
	<div>
		<h1></h1>
	</div>

	<div class="but">
		<input type="button" value="더보기" onclick="">
	</div>

	<div>foot</div>
	<!-- end -->
 </body>
</html>