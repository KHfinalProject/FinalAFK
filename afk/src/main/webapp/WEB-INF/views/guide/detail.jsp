<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
 <head>
  <meta charset="UTF-8">
  <title>가이드 상세 상품 보기</title>
     
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
     
  <!-- 합쳐지고 최소화된 최신 CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
  <!-- 부가적인 테마 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	

  <!--jQuery ui css파일-->
  <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
  
   <!--jQuery ui js파일(달력용)-->
  <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

  <script>
 
  /*별 클릭 시 찜하기 추가, 다시 클릭하면 삭제*/
  function add_favorite(obj){
	  var check = $(obj).children('span').hasClass('glyphicon glyphicon-star');
	  if(check === false){
		$(obj).children('span').attr('class', 'glyphicon glyphicon-star');
	  }else{
		$(obj).children('span').attr('class', 'glyphicon glyphicon-star-empty');
	  }
  }
  
  /* /*댓글 수정하기 버튼 클릭 시 모달창 생성*/
  function update_comment(obj){
	 
	  $('#update_comment_area').empty();
	  $('#update_comment_cm_no').empty();
	  
	  var cmNo = "";
	  var content = "";
	  
	  //수정하기 버튼을 누른 행의 댓글번호 가져옴
	  cmNo = $(obj).parent().parent().siblings('td:first').children('input').val();
	  //수정하기 버튼을 누른 행의 댓글 내용 가져옴
	  content = $(obj).parent().parent().prev().children('textarea').text();
	  
	  alert(cmNo + ", " + content);
	 
	  $('div.modal').modal(); //모달창 팝업
	  $('#update_comment_area').text(content); //모달창에 댓글 내용 출력
	  $('#update_comment_cm_no').text(cmNo); //모달창에 댓글 번호 보냄
  }
  
  /*댓글 삭제하기*/
  function delete_comment(obj){
	  var cmNo = $(obj).parent().parent().siblings('td:first').children('input').val();
	  var itemNo = ${guideItem.gui_no};
	  
	  $.ajax({
		  url : "deleteComment",
		  type : "post",
		  data : {itemNo : itemNo, cmNo : cmNo},
		  dataType : "json",
		  success : function(data){
			  alert("삭제 성공");
			  var result = "";
				
			  if(data.length > 0){
				for(var i in data){
					result += "<tr><td width='auto'>";
					result += "<img src='" + data[i].mb_rename_pic + "' class='img-circle' width='50px' height='50px'>";
					result += "<input type='hidden' id='cmNo' value='" + data[i].cm_no + "'/>";
					result += "</td><td width='70%'><textarea name='content' id='content' disabled>" + data[i].cm_content;
					result += "</textarea></td><td>";
					result += "<span id='revise_remove'><button class='btn btn-default' id='update_comment' onclick='update_comment(this)'>";
					result += "<span class='glyphicon glyphicon-pencil'></span></button>";
					result += "<button class='btn btn-default' id='delete_comment' onclick='delete_comment(this)'><span class='glyphicon glyphicon-trash'>";
					result += "</span></button></span>";
					result += "<input type='hidden' id='" + data[i].cm_no + "'/></td></tr>";
				}
				$('#user_rep table tr').remove();
				$('#user_rep table').append(result);
			}  
		  },
		  error : function(e){
			  alert("삭제 실패");
		  } 
	  });
  }
  

  $(function(){
	
	/*메뉴 고정*/
	var nav = $('#sub_nav');
	$(window).scroll(function(){
		if($(this).scrollTop() > 500){
			nav.addClass('fixing');
		}else{
			nav.removeClass('fixing');
		}
	});

	/*별점용*/
	$(".star_point a").click(function() {
		$(this).nextAll(this).removeClass("on");
		$(this).addClass("on").prevAll("a").addClass("on");
			
		return false;			
	});

	$(".star_point a").click(function(){
		$("#selected_point").text();
			var star_num = $(".star_point .on").length;
			var point = "";

			if(star_num == 1){
				point = 1;
			}else if(star_num == 2){
				point = 2;
			}else if(star_num == 3){
				point = 3;
			}else if(star_num == 4){
				point = 4;
			}else if(star_num == 5){
				point = 5;
			}
		$("#selected_point").text(point);
	});
	
	//별점 입력 메소드
	$('#send_star_point').on('click', function(){
		var selected_point = $('#selected_point').text();
		var check = confirm("이 글에 별 " + selected_point + "개를 주시겠습니까?");
		var gui_no = ${guideItem.gui_no};
		var user = "${loginUser.mb_id}";
		if(check){
			$.ajax({
				url : "giveStarPoint",
				type: "post",
				data : {itemNo : gui_no, writer : user, point : selected_point},
				success : function(data){
					alert("별점 등록>.ㅇ");
					$('#avg_point').text(data);
				},
				error : function(e){
					alert("별점 등록 실패ㅠㅠㅠ");
				}
			});
		}
	});
	
	//아이콘 클릭 시 해당 글 신고 또는 신고 취소
	$("#notify").on('click', function(){
		var gui_no = ${guideItem.gui_no};
		var user = "${loginUser.mb_id}";
		var notified = $('#notify').hasClass('notified');
		
		if(notified == false){
			var check = confirm("이 글을 신고하시겠습니까?");
			if(check){
				$.ajax({
					url : "notifyGuideItem",
					type : "post",
					data : {itemNo : gui_no, user : user},
					success : function(data){
						var count = $('#print_notify').html();
						console.log("notify success");
						alert("신고 처리되었습니다.");
						console.log("신고");
						count++;
						$('#print_notify').html(count);
						$('#notify').removeClass('notify_default');
						$('#notify').addClass('notified');
					},
					error : function(e){
						alert("ERROR TT_TT");
					}
				});
			}			
		}else{
			var check = confirm("이 글에 대한 신고를 취소하시겠습니까?");
			if(check){
				$.ajax({
					url : "cancelNotifyItem",
					type : "post",
					data : {itemNo : gui_no, user : user},
					success : function(data){
						var count = $('#print_notify').html();
						console.log("cancel notify success");
						alert("신고 취소 >.ㅇ");
						count--;
						$('#print_notify').html(count);
						$('#notify').removeClass('notified');
						$('#notify').addClass('notify_default');
					},
					error : function(e){
						alert("ERROR TT_TT");
					}
				});	
			}	
		}		
	});
	
	$('#buy_btn').on('click', function(){
		var check = confirm("이 상품을 구매하시겠습니까?");
		/* if(check){
			/* var guide = ${guide}; 
			var guideItem = ${guideItem};
			var user = ${loginUser.mb_id};
		} */
	});
	
	//쪽지 보내기 버튼 클릭 시 새로 form 생성하여 메시지 송수진 페이지로 이동
	$('#send_msg').on('click', function(){
		var guide_id = $('#guide_id').val();
		var loginUser = "${loginUser.mb_id}";
		alert("login : " + loginUser + "guide : " + guide_id);
		
		var form = document.createElement("form");
		form.method = 'get';
		form.action = '/afk/msg';
		
		var input = document.createElement("input");
		input.type = "hidden";
		input.name = "guideId";
		input.value = guide_id;
		$(form).append(input);
		
		var input = document.createElement("input");
		input.type = "hidden";
		input.name = "loginId";
		input.value = loginUser;
		$(form).append(input);
		
		$('#body').append(form);
		form.submit();		
	});
	
	//댓글 입력
	$('#comment_submit').on('click', function(){
		var user = "${loginUser.mb_id}";
		var itemNo = ${guideItem.gui_no};
		var content = $('#comment').val();
		alert("content" + content);
				
		$.ajax({
			url : "insertComment",
			type : "post",
			data : {writer : user, itemNo : itemNo, content : content},
			dataType : "json",
			success : function(data){
				var result = "";
				
				if(data.length > 0){
					for(var i in data){
						result += "<tr><td width='auto'>";
						result += "<img src='" + data[i].mb_rename_pic + "' class='img-circle' width='50px' height='50px'>";
						result += "<input type='hidden' id='cmNo' value='" + data[i].cm_no + "'/>";
						result += "</td><td width='70%'><textarea name='content' id='content' disabled>" + data[i].cm_content;
						result += "</textarea></td><td>";
						result += "<span id='revise_remove'><button class='btn btn-default' id='update_comment' onclick='update_comment(this)'>";
						result += "<span class='glyphicon glyphicon-pencil'></span></button>";
						result += "<button class='btn btn-default' id='delete_comment' onclick='delete_comment(this)'><span class='glyphicon glyphicon-trash'>";
						result += "</span></button></span>";
						result += "<input type='hidden' id='" + data[i].cm_no + "'/></td></tr>";
					}
					$('#comment').val("");
					$('#user_rep table tr').remove();
					$('#user_rep table').append(result);
				}
			},
			error : function(e){
				alert("댓글 달기 실패");
				$('#comment').val("");
			}
		});
	});
	
	/*모달창에서 댓글 내용 수정*/  
	$('#update_complete').on('click', function(){
		var cmNo =  $('#update_comment_cm_no').text();
		var content = $('#update_comment_area').val();
		var itemNo = ${guideItem.gui_no};
		alert(cmNo + ", " + content);
		
		$.ajax({
			url : "updateComment",
			type : "post",
			data : {cmNo : cmNo, content : content, itemNo : itemNo},
			success : function(data){
				alert("댓글 수정 완료 >.ㅇ");
				var origin = document.getElementById(cmNo);
				var originNo = $(origin).val();
				alert("원래 여기 수정하려고 했지롱 : " + originNo);
				$(origin).parent().prev().children('textarea').text(content);
			},
			error : function(e){
				alert("댓글 수정 실패 ㅠ");
			}
		}); 
	});
	
	/*달력용*/
	$('#datepicker').datepicker({
		dateFormat : 'yy-mm-dd',
		showAnim : "slide",
		showMonthAfterYear : true,
		yearRange : 'c-0:c+2',
		yearSuffix : '년 ',
		changeYear : true,
		changeMonth : true,
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
	});
  });
  
  </script>

  <style type="text/css">

	div { 
		margin : 0 auto;
		vertical-align:middle;
		text-align : center;
		
	}

	#guide_detail_main {
		width : 100%;
		height : 500px;
		margin-bottom : 3%;
	}
	
	#img_title{
		position : absolute;
		top : 5%;
		left : 5%;
		color : white;
	}

	#img_title h1 {
		background-color : #5d5d5d;
		opacity : 7%;
	}

	#writer {
		position : absolute;
		top : 50%;
		right : 10%;
		z-index : 1;
	}

	#guide_detail_top {
		width : 100%;
		height : auto;
	}
	
	#notify {
		border-radius : 5px;
		-moz-border-radius: 5px;
		-webkit-border-radius: 5px;
		border : 1px solid gray;
	}
	
	#notify:hover {
		background-color : red;
	}
	
	.notify_default {
		background-color : white;
	}
	
	.notified {
		background-color : #b7b7b7;
		
	}

	/*별점 부분*/
	.star_point {
		font-size: 30px;
		letter-spacing: -4px;
	}

	.star_point a {
		font-size : 30px;
		letter-spacing: 0;
		display : inline-block;
		margin-left: 5px;
		color : #ccc;
		text-decoration : none;
	}

	.star_point a : first-child {
		margin-left : 0;
	}

	.star_point a.on {
		color : #ffcc00; 
	}

	#guide_profile {
		text-align : left; 
		margin-top : 2%;
		float : left;
	}

	#select_num_people {
		width : 100px;
		height : 30px;
		border : 1px solid #ccc;
		border-radius : 5px;
		-moz-border-radius: 5px;
		-webkit-border-radius: 5px;
		overflow: hidden;
		background-color : #fff;
		background: #fff;
		margin-bottom : 3%;
	}

	#intro {
		font-size : 16pt;
		height : 400px;
	}

	#intro table {
		margin : 0 auto;
		margin-top : 8%;
		margin-left : 8%;
		text-align : left;
		width : 100%;
		height : 80%;
	}

	#intro td {
		border-spacing : 5px;
	}

	#sub_nav {
		display : inline-block;
		clear : both;
		width : 100%;
		margin-top : 2%;
	}

	.fixing {
		display : inline-block;
		z-index: 9999;
		position : fixed;
		left : 0;
		top : 0;
		width : 100%;
	}
	
	#add_favorite {
		width : 150px;
		height : 40px;
		font-size : 14pt;
		color : black;
		background-color :white;
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
		border-radius:10px;
	}

	#add_favorite span{
		color : yellow;
	}

	#buy_btn {
		width : 150px;
		height : 40px;
		color : white;
		font-size : 14pt;
		background-color : #04378c;
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
		border-radius:10px;
	}
	
	#btns button:hover {
		background-color : #ba012b;
		color : white;
	}

	#guide_comment {
		width : 100%;
		height : 300px;
	}

	#guide_comment p {
		padding-top : 10%;
		margin : 0 auto;
		width : 70%;
		vertical-align : middle;
		text-align : center;
		font-size : 18pt;
	}

	#item_detail {
		border-top : 1px solid gray;
	}

	#item_reviews, #item_reply{
		width : 100%;
		margin-top : 5%;
		padding-top : 5%;
		border-top : 1px solid gray;
	}

	#user_review, #user_rep{
		padding : 1%;
		width : 80%;
		margin-left : 5%;
		text-align : left;
		display : inline-block;	
	}

	#write_rep {
		display : block;
	}

	#write_rep textarea{
		width : 70%;
	}
	
	#comment_submit {
		position : relative;
		top : -20px;
		height : 40px;
	}
	
	#comment {
		width : 100%;
	}
	
	#content, #update_comment_area {
		width : 100%;
		background : none;
		border : none;
	}

	#revise_remove{
		right : -70%;
		text-align : right;
		z-index: 1;
		visibility : hidden;
	}

	#user_rep tr:hover #revise_remove{
		visibility : visible;
	}
	

	/*달력용*/
	.ui-datepicker {
		width : 300px;
	}

	.ui-datepicker-header {
		background : #04378c;
	}
 
	.ui-datepicker-calendar {
		background : white;
		color : #000066;
	}

	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a, .ui-datepicker-calendar > tbody td.ui-datepicker-week-end:last-child a
	{ color: red; }

	.ui-datepicker select.ui-datepicker-month, 
	.ui-datepicker select.ui-datepicker-year {
		width : 30%;
		font-size : 13px;
		color : black;
	}


  </style>
 </head>
 <body>
  <jsp:include page="../header.jsp"/>
  <div id="container">
	<div id="guide_detail_main">
		<img src="${guideItem.gui_image}" width="100%" height="500px" style="opacity:0.7">
		<div id="img_title">
			<h1><b>"${guideItem.gui_title}"</b></h1>
		</div><!-- end of img_text -->
			
		<c:if test="${loginUser.mb_id eq guide.mb_id}">
			<div id="writer">
				<button id="revise_btn" class="btn btn-default btn-lg" onclick="location.href='/afk/guide/updateGuideForm?itemNo=${guideItem.gui_no}'">
					<span class="glyphicon glyphicon-erase"></span>수정하기
				</button>
				&nbsp;
				<button id="delete_btn" class="btn btn-default btn-lg" onclick="location.href='/afk/guide/deleteGuide?itemNo=${guideItem.gui_no}'">
					<span class="glyphicon glyphicon-trash"></span>삭제하기
				</button>
			</div><!--end of writer-->
		</c:if>
	</div><!--guide_detail_main-->
	
	<div class="container">
	<div id="guide_detail_top">
		<div class="row">
		<div class="col-md-4">
			<div>
				<img src="#" width="100%" height="250px" border="1" alt="">
			</div>

			<div id="guide_profile">
				<table width="100%">
				<tr>
					<td style="font-size:22pt">
						${guide.mb_name}
						<input type="hidden" id="guide_id" value="${guide.mb_id}">
					</td>
					<td>&nbsp;&nbsp;
						<button type="button" class="btn btn-default" id="send_msg">
							<span class="glyphicon glyphicon-envelope">쪽지보내기</span>
						</button>
					</td>
				</tr>
			
				<tr style="font-size:12pt">
					<td>
						이메일 
					</td>
					<td>
						${guide.mb_email}
					</td>
				</tr>
				<tr style="font-size:12pt">
					<td>
						현지 연락처
					</td>
					<td>
						${guide.mb_loc_phone}
					</td>
				</tr>	
				</table>	
				
				</div>
			</div>	<!--end of guide_profile-->
			
			<div class="row">
			<div id="intro" class="col-md-6 col-sm-offset-1">
				<table cellpadding="2" border="0">
				<tr>
					<td>지역</td>
					<td colspan="2">${guideItem.area_name}</td>
				</tr>
				<tr>
					<td>국가</td>
					<td colspan="2">${guideItem.country_name}</td>
				</tr>
				<tr>
					<td>주요 장소</td>
					<td colspan="2">${guideItem.city_name}</td>
				</tr>
			
				<tr>
					<td>가격대</td>
					<td colspan="2">${guideItem.gui_price }</td>
				</tr>
				<tr>
					<td>
						<span class="glyphicon glyphicon-eye-open"></span> ${guideItem.gui_count}
					</td>
					<td>
						<span class="glyphicon glyphicon-star" style="color:#ffcc33"></span> 
						<span id="avg_point">${point}</span>
					</td>
					<td>			
					<c:choose>
						<c:when test="${empty loginUser}">
							<button id="notify" class="notify_default" disabled="true" title="로그인 후 신고해주세요">
							<span class="glyphicon glyphicon-thumbs-down"></span>
							</button>
							&nbsp;<span id="print_notify">${guideItem.gui_notify}</span>
						</c:when>
						<c:otherwise>	
							<c:if test="${!empty notifiedList}">
							<c:forEach var="n" items="${notifiedList}">
								<c:choose>
								<c:when test="${n.mb_id eq loginUser.mb_id}">
									<button id="notify" class="notified">
									<span class="glyphicon glyphicon-thumbs-down"></span>
									</button>
									&nbsp;<span id="print_notify">${guideItem.gui_notify}</span>
								</c:when>
								<c:otherwise>
									<button id="notify" class="notify_default">
									<span class="glyphicon glyphicon-thumbs-down"></span>
									</button>
									&nbsp;<span id="print_notify">${guideItem.gui_notify}</span>
								</c:otherwise>
								</c:choose>	
							</c:forEach>
							</c:if>
								
							<c:if test="${empty notifiedList}">
								<button id="notify" class="notify_default">
								<span class="glyphicon glyphicon-thumbs-down"></span>
								</button>
								&nbsp;<span id="print_notify">${guideItem.gui_notify}</span>
							</c:if>	
						</c:otherwise>
					</c:choose>					
					</td>
				</tr>
				<tr>
					<td colspan="3" style="margin-left:10%">
					<c:choose>
						<c:when test="${!empty loginUser}">
							구매 목록 가져와서 구매 목록이랑 후기 목록 비교, 
							로그인 사용자 id == 구매 목록 id && 후기 목록에 없음 => 별점 입력창
							로그인 사용자 id == 구매 목록 id && 후기 목록에 있음 => 별점 수정창 
						</c:when>
						<c:otherwise>
							<h4>해당 여행상품을 이용하신 분만 별점을 남길 수 있습니다.</h4>
						</c:otherwise>
					</c:choose>
					
					<c:if test="${!empty loginUser}">
						<span class="star_point">
							<a href="#" class="on">★</a>
							<a href="#" class="on">★</a>
							<a href="#" class="on">★</a>
							<a href="#">★</a>
							<a href="#">★</a>
						</span>
						<span style="font-size:12pt; margin-left:5%"><span id="selected_point">3</span>점</span>&nbsp;
						<button class="btn btn-default" id="send_star_point">별점 주기</button>
					</c:if>	
					
					</td>
				</tr>
				</table>
			</div><!--end of intro-->
			</div>
	</div><!--end of guide_detail_top-->
	<div id="sub_nav">
	<div class="row">
		<div class="col-md-6">
			<select name="select_num_people" id="select_num_people">
				<option value="default" selected>인원 선택
				<option value="1">1명
				<option value="2">2명
				<option value="3">3명
				<option value="4">4명
			</select>
			&nbsp;&nbsp;
			<input type="text" name="" id="datepicker" value="날짜 선택">
		</div>
		<div class="col-md-6" id="btns">
			<button id="add_favorite" onclick="add_favorite(this);" class"btn btn-default">
			<span class="glyphicon glyphicon-star-empty"></span> 찜하기
			</button>
	
			<button id="buy_btn">구매하기</button>
		</div>
		
	</div>
	</div><!--end of sub_nav-->

	<div id="item_detail">
		<div id="item_contents">
			${guideItem.gui_content}
		</div>

		<div id="item_maps" align="center">
			<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1930.5432756838056!2d129.31058764132314!3d35.534586152691354!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x35662d66cf9ecfaf%3A0x2d8f16207dd9335b!2zS0jsoJXrs7TqtZDsnKHsm5A!5e0!3m2!1sko!2skr!4v1477440467383" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
			</div>
			</div>
		</div><!--end of item_maps-->

		<div id="item_reviews">
		<h3>후기</h3>
			<div id="user_review">
				<p><img src="#" alt="..." class="img-circle" width="50px" height="80px">
				좋았어요 ㅑㅋ캬
				</p>
			</div><!--end of user_review-->

			<div id="user_review">
				<a>
					<img src="#" alt="..." class="img-circle" width="100px" height="100px">
				</a>
				<a>
				좋았어요 ㅑㅋ캬캬ㅑ캬캬캬컄캬캬캬캬캬캬캬캬캬캬캬캬컄캬캬캬컄캬컄캬컄컄캬컄컄캬컄캬캬컄캬<!--후기 보드의 타이틀 불러옴-->	</a>			
			</div><!--end of user_review-->

			<div id="user_review">
				<img src="#" alt="..." class="img-circle" width="100px" height="100px">
				좋았어요 ㅑㅋ캬캬ㅑ캬캬캬컄캬캬캬캬캬캬캬캬캬캬캬캬컄캬캬캬컄캬컄캬컄컄캬컄컄캬컄캬캬컄캬<!--후기 보드의 타이틀 불러옴-->				
			</div><!--end of user_review-->
		</div><!--end of item_reviews-->

		<div id="item_reply">
			
			<c:if test="${empty loginUser}">
				<h3>로그인 후에 댓글 작성 가능합니다</h3>
			</c:if>
			<c:if test="${!empty loginUser}">
			<div id="write_rep">
				<textarea id="comment" rows="" cols="" placeholder="이 상품 또는 담당 가이드에 대해 적어주세요" required></textarea>
				<button class="btn btn-primary" id="comment_submit">등록</button>
			</div>
			</c:if>
			
			<hr style="border : none; border-top : 1px dotted gray">
			
			<div class="modal fade" id="layerpop" >
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">×</button>
			        <h4 class="modal-title">댓글 수정하기</h4>
			      </div>
			      <!-- body -->
			      <div class="modal-body">
			      	<input type="hidden" id="update_comment_cm_no"/>
			      	<textarea id="update_comment_area"></textarea>
			      </div>
			      <!-- Footer -->
			      <div class="modal-footer">
			      	<button id="update_complete" data-dismiss="modal">수정하기</button>
			        <button class="btn btn-default" data-dismiss="modal">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<div id="user_rep">
				<table width="100%">
					<c:forEach var="comment" items="${commentList}">
					<tr>
						<td width="auto">
							<img src="<%-- ${comment.mb_rename_pic} --%>" alt="..." class="img-circle" width="50px" height="50px">
							<input type="hidden" id="cmNo" name="cmNo" value="${comment.cm_no}"/>
						</td>
						<td width="70%">
							<textarea name="content" id="content" disabled>${comment.cm_content}</textarea>
						</td>
						<td>
							<span id="revise_remove">
								<button class="btn btn-default" id="update_comment" onclick="update_comment(this)">
								<span class="glyphicon glyphicon-pencil"></span>
								</button>
								
								<button class="btn btn-default" id="delete_comment" onclick="delete_comment(this)">
								<span class="glyphicon glyphicon-trash"></span>
								</button>
							</span>
							<input type="hidden" id="${comment.cm_no}"/>
						</td>
					</tr>
					</c:forEach>	
				</table>				
			</div>
			
			<c:if test="${empty commentList}">
			<h3>아직 등록된 코멘트가 없습니다.</h3>
			</c:if>
			
		</div><!--end of item_reply-->

	</div><!--end of item_detail-->

  </div><!--end of container-->
  
 </body>
</html>
