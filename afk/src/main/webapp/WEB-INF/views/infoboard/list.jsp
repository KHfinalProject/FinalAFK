<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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

<!-- starpoint -->
<script src="/afk/resources/flag/raty-2.7.0/vendor/jquery.js"></script>
<script src="/afk/resources/flag/raty-2.7.0/lib/jquery.raty.js"></script>
<script src="/afk/resources/flag/raty-2.7.0/demo/javascripts/labs.js" type="text/javascript"></script>
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
			<%-- <c:forEach var="a" items="${boardlist}">
				<h2>${a.info_no}</h2><br>
				<h3>${a.info_writer}</h3>
			</c:forEach> --%>
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
		<div class="header-container">
		<div class="content10">
			<div class="infolist-img">
				<img src="/afk/resources/images/infoboard/HongKong2.jpg">
			</div>
			<div class="title-box">
				<div class="text-lg">
					나라 & 도시 이름
				</div>
			</div>
		</div>
		</div>
		<!-- img content end -->
		<h1  style="text-align:center">여행지를 구경해 보세요</h1>
		<!-- select bar start -->
		<div class="infoinput">
			<input type="button" value="글쓰기" onclick="location.href='/afk/infoboard/insertForm'">
		</div>
		<div class="bselect">			
			<input type="button" value="인기순" onclick="load_select('popular')">
			<input type="button" value="별점순" onclick="load_select('info_point')">
			<input type="button" value="조회순" onclick="load_select('info_count')">
			<input type="button" value="최신순" onclick="load_select('info_enrolldate')">
			<input type="button" value="가격순" onclick="load_select('info_price')">
		</div>
		<!-- select bar end -->
		
		<!-- content start -->
	<script>
	
	
	
$(function(){
		
		var count = 1;
		
		$('#paging').click(function(){
			
			count += 10;
			
		alert(code);
			$.ajax({
				
				url : "/afk/infoboard/infomore.do",
				type : "post",
				data : {page : count},
				dataType : "json",
				success : function(data){
					console.log("success");
					var result = "";
					var old = $('.kcol-lg-12').html();
					
					if(data.length > 0){
						for(var i in data){
							result += "<div class='boardmain kcol-lg-3'>";
							result += "<div class='bt'>";
							result += "<div class='boardtop'>";
							result += "<div class='boardreport'>";
							result += "<img src=/afk/resources/images/favorite2.png></div></div>";
							result += "<div class='boardphoto'>";
							result += "<a href=/afk/infoboard/"+ data[i].info_no + ">";
							result += "<img src=/afk/resources/images/infoboard/Hong_Kong_China_09.jpg></a></div>";
							result += "<div class='boardfoot'>";
							result += "<div class='score1 boardstar'></div>";
							result += "<div class='board1'>";
							result += "<div class='boardinfo'>";
							result += "<img src='/afk/resources/images/infoboard/top.jpg' /></div>";
							result += "<div class='boardname'>" + data[i].info_writer + "</div>";
							result += "<div class='boardtitle'> " + data[i].info_title + "</div>";
							result += "<div class='boardpay'>" + data[i].info_price + "</div>";
							result += "</div></div></div></div>";
						}
						console.log("데이터 길이 : " + data.length);
					}else {
						result = "<h3>더이상 불러올 글이 없습니다.<h3>"
					}
					$('.kcol-lg-12').html(old + result);
					$.fn.raty.defaults.path = '/afk/resources/flag/raty-2.7.0/lib/images';
					$('.score1').raty({readOnly:true, score:5 });
					
					
				}

			})
		});
		
	});
	
	</script>
		
		<div class="kcol-lg-12">
		
		<c:forEach var="list" items="${boardlist }">
		
		<div class="boardmain kcol-lg-3">
		<div class="bt">
			<div class="boardtop">
				<div class="boardreport">
					<img src="/afk/resources/images/favorite2.png">
				</div>
			</div>
			<div class="boardphoto">
				<a href="/afk/infoboard/${list.info_no }">
					<img src="/afk/resources/images/infoboard/Hong_Kong_China_09.jpg">
				</a>				
			</div>
			<div class="boardfoot">
				<div class="score1 boardstar"></div>
				<div class="board1">
					<div class="boardinfo">
						<img src="/afk/resources/images/infoboard/top.jpg" />
					</div>
					<div class="boardname">${list.info_writer }</div>
					<div class="boardtitle">${list.info_title }</div>
					<div class="boardpay">${list.info_price }</div>
				</div>
			</div>
		</div>
		</div>
			<%-- <c:choose>
			<c:when test="${empty boardlist }">
				</div>
			</c:when>
			
			<c:when test="${boardlist.size%4 == 0 }">
				</div>
				<div class="kcol-lg-12">
			</c:when>
			</c:choose> --%>
		</c:forEach>
		
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
		<button id="paging">더보기</button>
	</div>

	<div>foot</div>
	<!-- end -->
	<script>
		$.fn.raty.defaults.path = '/afk/resources/flag/raty-2.7.0/lib/images';
		$('.score1').raty({readOnly:true, score:5 });
		
		
	</script>
 </body>
