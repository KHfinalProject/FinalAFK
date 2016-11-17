<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
<style type="text/css">
.when_load_data{ 
	  border:0;
	  width:300px;
	  height : 200px; 
	  padding:0px;
	  text-align : center;
	  position : relative;
	  bottom : 500px;
	  z-index : 99999;
	  background-color : rgb(182, 182, 182);
	  opacity : 0.95;
	  display : none;
	}
	
	#to_main {
		width : 100px;
		height : 50px;
		font-size : 13pt;
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
		border-radius:10px;
		background-color : white;
	}

</style>

  <body>
	<!-- Start -->
	<div>
		<!-- header Start -->
		<div>
			<c:import url="../header.jsp"></c:import>
			<%-- <c:forEach var="a" items="${boardlist}">
				<h2>${a.info_no}</h2><br>
				<h3>${a.info_writer}</h3>
			</c:forEach> --%>
		</div>
		<!-- header end -->
		<nav class="nabar-container" style="display:block;">
			<!-- <ul class="nav nav-pills">
				<li class="nav-item nav-arrow" id="continent-btn">지역</li>
				<li class="nav-item nav-arrow">나라</li>
				<li class="nav-item nav-arrow">도시</li>
			</ul> -->
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
					
				</div>
			</div>
		</div>
		</div>
		<br>
		<!-- img content end -->
		<center>
		<div id="sort_search">
				<input type="text" id="search_box" name="keyword" placeholder="검색어 입력">
				<button id="search_icon" class="btn btn-default">
					<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
				</button>
		</div>
		</center>
		<h1  style="text-align:center">여행지를 구경해 보세요</h1>
		<!-- select bar start -->
		<c:if test="${!(loginUser eq null)}">
		<div class="infoinput">
			<input type="button" value="글쓰기" onclick="location.href='/afk/infoboard/insertForm'" class="btn btn-success">
		</div>
		</c:if>
		<div class="bselect">		
			<input type="button" value="별점순" onclick="load_select('info_point')" class="btn btn btn-info">
			<input type="button" value="조회순" onclick="load_select('info_count')" class="btn btn btn-info">
			<input type="button" value="최신순" onclick="load_select('info_enrolldate')" class="btn btn btn-info">
			<input type="button" value="가격순" onclick="load_select('info_price')" class="btn btn btn-info">
		</div>
		<!-- select bar end -->
		
		<!-- content start -->
	<script>
	var code = "info_no";
function load_select(cmd){
	var code = cmd;
	
	$('.kcol-lg-12 div').each(function(){
		$('.kcol-lg-12 div:eq(0)').remove();
	})
		
	$.ajax({
		url : "/afk/infoboard/infoup.do",
		data : {code : code},
		type : "post",
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
					/* result += "<div class='boardreport'>";
					result += "<img src=/afk/resources/images/favorite2.png></div>"; */
					result += "</div><div class='boardphoto'>";
					result += "<a href=/afk/infoboard/"+ data[i].info_no + ">";
					/* result += "<img src=/afk/resources/images/infoboard/Hong_Kong_China_09.jpg></a></div>"; */
					result += "<img src="+data[i].info_image+"></img></a></div>"				
					result += "<div class='boardfoot'>";
					result += "<div class='boardstar "+ data[i].info_no + "'></div>";
					result += "<div class='board1'>";
					result += "<div class='boardinfo'>";
					/* result += "<img src='/afk/resources/images/infoboard/top.jpg' /></div>"; */
					
					if(data[i].mb_rename_pic == null){
						result += "<img src='${pageContext.request.contextPath}/resources/images/mypage/jo.jpg'></div>"
					}else{
						result += "<img src='${pageContext.request.contextPath}/resources/images/mypage/"+ data[i].mb_rename_pic +"></div>"
					}
					
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
			for(var i in data){
				$('.' + data[i].info_no).raty({readOnly:true, score:data[i].info_point });
				console.log(data);
			}
			
			$('#ppap').val(code);
			$('#pppp').val('1');
			
		}
	
	});

}
	
	
$(function(){
		
		
		var count = Number($('#pppp').val());
	
		$('#paging').click(function(){
			console.log(count);	
			count += 10;
			var code = $('#ppap').val();
			
			$.ajax({
				
				url : "/afk/infoboard/infomore.do",
				type : "post",
				data : {page : count , code : code},
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
							/* result += "<div class='boardreport'>";
							result += "<img src=/afk/resources/images/favorite2.png></div>"; */
							result += "</div><div class='boardphoto'>";
							result += "<a href=/afk/infoboard/"+ data[i].info_no + ">";							
							/* result += "<img src=/afk/resources/images/infoboard/Hong_Kong_China_09.jpg></a></div>"; */
							result += "<img src="+data[i].info_image+"></img></a></div>"
							result += "<div class='boardfoot'>";
							result += "<div class= 'boardstar "+ data[i].info_no + "'></div>";
							result += "<div class='board1'>";
							result += "<div class='boardinfo'>";
							/* result += "<img src='/afk/resources/images/infoboard/top.jpg' /></div>"; */
							
							if(data[i].mb_rename_pic == null){
								result += "<img src='${pageContext.request.contextPath}/resources/images/mypage/jo.jpg'></div>"
							}else{
								result += "<img src='${pageContext.request.contextPath}/resources/images/mypage/"+ data[i].mb_rename_pic +"></div>"
							}
							
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
					for(var i in data){
						$('.' + data[i].info_no).raty({readOnly:true, score:data[i].info_point });
						
					}
					
					
				}

			})
		});
		
	});
	
//검색 기능
$(function(){
$('#search_icon').on('click', function(){
	var keyword = $('#search_box').val();
	
	$.ajax({
		url : "/afk/infoboard/infoSearch",
		type : "post",
		data : {keyword : keyword},
		dataType : "json",
		beforeSend : function(){
			$(".when_load_data").css('display', 'block');
		},
		success : function(data){
			$(".when_load_data").css('display', 'none');
			console.log("success");
			var result = "";
			
			if(data.length > 0){
				for(var i in data){
					result += "<div class='boardmain kcol-lg-3'>";
					result += "<div class='bt'>";
					result += "<div class='boardtop'>";
					/* result += "<div class='boardreport'>";
					result += "<img src=/afk/resources/images/favorite2.png></div>"; */
					result += "</div><div class='boardphoto'>";
					result += "<a href=/afk/infoboard/"+ data[i].info_no + ">";
					/* result += "<img src=/afk/resources/images/infoboard/Hong_Kong_China_09.jpg></a></div>"; */
					result += "<img src="+data[i].info_image+"></img></a></div>"					
					result += "<div class='boardfoot'>";
					result += "<div class= 'boardstar "+ data[i].info_no + "'></div>";
					result += "<div class='board1'>";
					result += "<div class='boardinfo'>";
					/* result += "<img src='/afk/resources/images/infoboard/top.jpg' /></div>"; */
					
					if(data[i].mb_rename_pic == null){
						result += "<img src='${pageContext.request.contextPath}/resources/images/mypage/jo.jpg'></div>"
					}else{
						result += "<img src='${pageContext.request.contextPath}/resources/images/mypage/"+ data[i].mb_rename_pic +"></div>"
					}
					
					result += "<div class='boardname'>" + data[i].info_writer + "</div>";
					result += "<div class='boardtitle'> " + data[i].info_title + "</div>";
					result += "<div class='boardpay'>" + data[i].info_price + "</div>";
					result += "</div></div></div></div>";
				}
			
				$('.kcol-lg-12').html(result);
				$('#ppap').val(1);
				$('#pppp').val(code);
				
			}
			if(data.length < 8){
				$('#read_more').remove();
				var new_button = "<br><a href='/afk/infoboard'><button id='to_main'>";
				new_button += "목록으로</button></a>";
				var old = $('.kcol-lg-12').html();
				$('.kcol-lg-12').html(old + new_button);
			}
				
		},
		error : function(e){
			console.log("error");
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
				<!-- <div class="boardreport">
					<img src="/afk/resources/images/favorite2.png">
				</div> -->
			</div>
			<div class="boardphoto">
				<a href="/afk/infoboard/${list.info_no }">
					<img src="${list.info_image} ">
				</a>				
			</div>
			<div class="boardfoot">
				<div class="${list.info_no } boardstar"></div>
				<div class="board1">
					<div class="boardinfo">
				<c:if test="${list.mb_rename_pic eq null }">
					<img src="/afk/resources/images/mypage/jo.jpg" width="100%" height="250px" border="1" alt="">
				</c:if>
				<c:if test="${list.mb_rename_pic ne null }">
					<img src="/afk/resources/images/mypage/${list.mb_rename_pic }" width="100%" height="250px" border="1" alt="">
				</c:if>
					</div>
					<div class="boardname">${list.info_writer }</div>
					<div class="boardtitle">${list.info_title }</div>
					<div class="boardpay">${list.info_price }</div>
				</div>
			</div>
		</div>
		</div>
		</c:forEach>
		</div>

		</div>
		
		<!-- content end -->
		
		<!-- footer start 인데 올라가서 이름씀 -->
		<div style="text-align:center">
			<h1></h1>
		</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!-- footer end 이상하다이거 --> 
	</div>
	
	<!-- <div class="when_load_data">
				<div class="spin"></div>
				<h4>loading...</h4>
			</div> -->

	<div class="but">
		<button id="paging" class="btn btn-success">더보기
			<input id="ppap" type="hidden" />
			<input id="pppp" type="hidden" />
		</button>
	</div>
	
	<div class="when_load_data">
				<div class="spin"></div>
				<h4>loading...</h4>
			</div>

	<%-- <footer>
	
   <c:import url="../footer.jsp"></c:import>
   </footer> --%>
	<!-- end -->
	<script>
	$.fn.raty.defaults.path = '/afk/resources/flag/raty-2.7.0/lib/images';		
		
		
		<c:forEach items="${boardlist}" var="i">
			$('.' + '${i.info_no}').raty({readOnly:true, score:'${i.info_point}' });
		</c:forEach>
		
		
	</script>
 </body>