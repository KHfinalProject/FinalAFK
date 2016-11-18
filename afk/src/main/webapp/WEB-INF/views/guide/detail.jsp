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
  
   /*댓글 수정하기 버튼 클릭 시 모달창 생성*/
   function update_comment(obj){

	  $('#update_comment_area').empty();
	  $('#update_comment_cm_no').empty();
	  
	  var cmNo = "";
	  var content = "";
	  
	  //수정하기 버튼을 누른 행의 댓글번호 가져옴
	  cmNo = $(obj).parent().parent().siblings('td:first').children('input').val();
	  //수정하기 버튼을 누른 행의 댓글 내용 가져옴
	  content = $(obj).parent().parent().prev().text();
	 	  	  
	  $('#comment_modal').css('display', 'block'); //모달 영역 보이도록 css 변경
	  $('.close_modal').on('click', function(){
		  $('#comment_modal').css('display', 'none'); //모달 영역 내의 x 누르면 창 안보이게 함
	  });
	  
	  $('#update_complete').on('click', function(){
		 $('#comment_modal').css('display', 'none'); //모달 영역 내의 수정하기 버튼 누를 시 창 안보이게 함
	  });
	  
	  $('#update_comment_area').text(content.trim()); //모달창에 댓글 내용 출력
	  $('#update_comment_cm_no').text(cmNo); //모달창에 댓글 번호 보냄
  }
  
  /*댓글 삭제하기*/
  function delete_comment(obj){
	  var cmNo = $(obj).parent().parent().siblings('td:first').children('input').val();
	  var itemNo = ${guideItem.gui_no};
	  
	  var check = confirm("이 댓글을 삭제하실건가요?");
	  if(check){
		  $.ajax({
			  url : "deleteComment",
			  type : "post",
			  data : {itemNo : itemNo, cmNo : cmNo},
			  success : function(data){
				  alert("댓글 삭제 완료 >.ㅇ");
				  var origin = document.getElementById(cmNo); //삭제되는 행을 찾음
				  
				  //댓글 삭제 시 애니메이션 적용
				  $(origin).parent().parent().fadeOut(800, function(){
					  $(this).remove();
				  });
				  
				  var count = $('#user_rep table tr').size();
				  if(count == 1){
					  $('#user_rep table').after('<h3>아직 등록된 코멘트가 없습니다.</h3>');
				  }
				
			  },
			  error : function(e){
				  alert("삭제 실패");
			  } 
		  });  
	  }
  }
  
  /*구매 버튼 클릭 시 정보 담아서 결제 진행 시작*/
  function purchase(){
	  var user = "${loginUser.mb_id}";
	  
	  if(user == ""){
			var check = confirm("로그인이 필요한 기능입니다. 로그인 화면으로 이동하시겠습니까?");
		  	if(check)
				  location.href = "../loginView";
		}else{
			var guideId = "${guide.mb_id}";
			var guideName = "${guide.mb_name}";
			var itemNo = ${guideItem.gui_no};
			var numOfPeople = $('#select_num_people option:selected').val();
			if(numOfPeople == "default"){
				alert("함께 여행하는 사람들의 숫자를 선택해주세요");
			}else{
				var date = $('#datepicker').val();
				if(date == "날짜 선택"){
					alert("여행을 시작할 날짜를 선택해주세요");
				}else{
					var buy = confirm("이 여행을 떠나시겠습니까?");
					if(buy){
						
						var form1 = document.createElement("form");
						form1.method = "post";
						form1.action = "/afk/paymentProceed";
						
						var input = document.createElement("input");
						input.type = "hidden";
						input.name = "guideId";
						input.value = guideId;
						$(form1).append(input);
						
						var input = document.createElement("input");
						input.type = "hidden";
						input.name = "guideName";
						input.value = guideName;
						$(form1).append(input);
						
						var input = document.createElement("input");
						input.type = "hidden";
						input.name = "itemNo";
						input.value = itemNo;
						$(form1).append(input);
						
						var input = document.createElement("input");
						input.type = "hidden";
						input.name = "num";
						input.value = numOfPeople;
						$(form1).append(input);
						
						var input = document.createElement("input");
						input.type = "hiddden";
						input.name = "date";
						input.value = date;
						$(form1).append(input);
						
						$('#body').append(form1);
						form1.submit();
					}
				}
			}	
		}
  }
  
  /*헤더*/
  $(function(){
	  $(".zeta-menu li").hover(function(){
	    $('ul:first',this).show();
	  }, function(){
	    $('ul:first',this).hide();
	  });
	  $(".zeta-menu>li:has(ul)>a").each( function() {
	    $(this).html( $(this).html()+' &or;' );
	  });
	  $(".zeta-menu ul li:has(ul)")
	    .find("a:first")
	    .append("<p style='float:right;margin:-3px'>&#9656;</p>");
	});

  
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
		
	
	/*별점 출력*/
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
	
	//별점 입력 or 수정 메소드
	$('#send_star_point').on('click', function(){
		var selected_point = $('#selected_point').text();
		var gui_no = ${guideItem.gui_no};
		var user = "${loginUser.mb_id}";
		var rated = $(this).hasClass('rated');
		
		if(user == ""){
			  var check = confirm("로그인이 필요한 기능입니다. 로그인 화면으로 이동하시겠습니까?");
			  if(check){
				  location.href = "../loginView";
			  }
		}else{
			if(rated == false){ //별점 등록 전
				var check = confirm("이 글에 별 " + selected_point + "개를 주시겠습니까?");
				if(check){
					$.ajax({
						url : "giveStarPoint",
						type: "post",
						data : {itemNo : gui_no, writer : user, point : selected_point},
						success : function(data){
							alert("별점 등록>.ㅇ");
							$('#avg_point').text(data);		
							$('#send_star_point').text("별점 수정");
							$('#send_star_point').attr("class", "rated");
						},
						error : function(e){
							alert("별점 등록 실패ㅠㅠㅠ");
						}
					});
				}				
			}else{ //이미 등록된 별점 있을 시 별점 수정
				var check = confirm("이 글에 별 " + selected_point + "개를 다시 주시겠습니까?");
				if(check){
					$.ajax({
						url : "reviseStarPoint",
						type: "post",
						data : {itemNo : gui_no, writer : user, point : selected_point},
						success : function(data){
							alert("별점 수정 >.ㅇ");
							$('#avg_point').text(data);		
						},
						error : function(e){
							alert("별점 수정 실패ㅠㅠㅠ");
						}
					});
				}
			}		
		}
	});
	
	//아이콘 클릭 시 해당 글 신고 또는 신고 취소
	$("#notify").on('click', function(){

		var gui_no = ${guideItem.gui_no};
		var user = "${loginUser.mb_id}";
		
		if(user == ""){
			 var check = confirm("로그인이 필요한 기능입니다. 로그인 화면으로 이동하시겠습니까?");
			  if(check){
				  location.href = "../loginView";
			  }
		}else{
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
		}	
	});
	
	 /*즐겨찾기 추가*/
	$('#favorite').on('click', function(){
		 var user = "${loginUser.mb_id}";	
		 var itemNo = ${guideItem.gui_no};
		 
		 if(user == ""){
			 var check = confirm("로그인이 필요한 기능입니다. 로그인 화면으로 이동하시겠습니까?");
			  if(check){
				  location.href = "../loginView";
			  }
		 }else{
			 var favored = $('#favorite').hasClass('remove_favorite');
			 
			 if(favored == false){
				 var check = confirm("즐겨찾기에 추가하시겠습니까?");
				 if(check){
					 $.ajax({
						 url : "addFavorite",
						 type : "post",
						 data : {itemNo : itemNo, user : user},
						 success : function(data){
							 alert("즐겨찾기 리스트에 저장되었습니다");
							 
							 //버튼 css 변경
							 var btn = "<span class='glyphicon glyphicon-star'></span> 보관 취소";
							 $('#favorite').html(btn);
							 $('#favorite').removeClass('add_favorite');
							 $('#favorite').addClass('remove_favorite');				  
						 },
						 error : function(e){
							 alert("즐겨찾기 추가 실패..ㅠ");
						 }
					 })
				 }
			 }else{
				 var check = confirm("즐겨찾기 리스트에서 삭제하시겠습니까?");
				  if(check){
					  $.ajax({
						  url : "removeFavorite",
						  type : "post",
						  data : {itemNo : itemNo, user : user},
						  success : function(data){
							  alert("즐겨찾기 리스트에서 삭제되었습니다");
							  
							  //버튼 css 변경
							  var btn = "<span class='glyphicon glyphicon-star-empty'></span> 보관하기";
							  $('#favorite').html(btn);
							  $('#favorite').removeClass('remove_favorite');
							  $('#favorite').addClass('add_favorite');				  
						  },
						  error : function(e){
							  alert("즐겨찾기 삭제 실패..ㅠ");
						  }
					  })
				  }	
			 }
		 } 
	});
	  	
	//쪽지 보내기 버튼 클릭 시 새로 form 생성하여 메시지 송수신 페이지로 이동
	$('#send_msg').on('click', function(){
		var guide_id = $('#guide_id').val();
		var loginUser = "${loginUser.mb_id}";
		
		if(loginUser == ""){
			var check = confirm("로그인이 필요한 기능입니다. 로그인 화면으로 이동하시겠습니까?");
			  if(check)
				  location.href = "../loginView";
		}else{
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
		}	
	});
	
	/*댓글 글자 입력 수 제한*/
	$("textarea").keyup(function(){
	      var input = $(this).val().length;
	      var max = 490;
	      if (input > max){
	         alert("입력 가능한 글자수를 초과하였습니다.");
	         this.value = this.value.substring(0, max);
	         this.focus();
	      }
	});
	
	//댓글 입력
	$('#comment_submit').on('click', function(){
		var user = "${loginUser.mb_id}";
		var itemNo = ${guideItem.gui_no};
		var content = $('#comment').val();
		
		var check = confirm("댓글을 등록하시겠습니까?")
		
		if(check){
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
							
							if(data[i].mb_rename_pic == null){
								result += "<img src='${pageContext.request.contextPath}/resources/images/mypage/jo.jpg' class='img-circle' width='70px' height='70px'>"
							}else{
								result += "<img src='${pageContext.request.contextPath}/resources/images/mypage/"+ data[i].mb_rename_pic +"' class='img-circle' width='70px' height='70px'>"
							}
							
							/* result += "<img src='" + data[i].mb_rename_pic + "' class='img-circle' width='70px' height='70px'>"; */
							result += "<p>" + data[i].cm_writer + "</p>";
							result += "<input type='hidden' id='cmNo' value='" + data[i].cm_no + "'/>";
							result += "</td><td width='70%' height='auto' style='word-break:break-all;'>" + data[i].cm_content;
							result += "</td><td>";
							result += "<span id='revise_remove'><button class='btn btn-default' onclick='update_comment(this)'>";
							result += "<span class='glyphicon glyphicon-pencil'></span></button>";
							result += "<button class='btn btn-default' onclick='delete_comment(this)'><span class='glyphicon glyphicon-trash'>";
							result += "</span></button></span>";
							result += "<input type='hidden' id='" + data[i].cm_no + "'/>";
							result += "<input type='hidden' id='cm_writer' value='" + data[i].cm_writer + "'/></td></tr>";
						}
						$('#comment').val("");
						$('#user_rep table tr').remove();
						$('#user_rep table').append(result);
						
						$('#user_rep h3').remove();
					}
					
					$('#user_rep table tr').each(function(){
				    	var cm_writer = $(this).children('td').children().filter('#cm_writer').val();
											
						if(cm_writer == user){
							$(this).css('background-color', '#dbebee'); 
							
							$(this).mouseover(function(){
								$(this).children('td:last').children('#revise_remove').css('visibility', 'visible');
							});
							
							$(this).mouseout(function(){
								$(this).children('td:last').children('#revise_remove').css('visibility', 'hidden');
							});
						}
					}); 		 
				},
				error : function(e){
					alert("댓글 달기 실패");
					$('#comment').val("");
				}
			});
		}
	});
	
	/*본인이 쓴 댓글에 css 추가 적용*/
	$('#user_rep table tr').each(function(){
	    var cm_writer = $(this).children('td').children().filter('#cm_writer').val();
		var loginUser = "${loginUser.mb_id}";
			
		//로그인한 사용자와 댓글 작성자가 일치할 경우
		if(cm_writer == loginUser){
			//본인 작성 댓글의 색깔 변경
			$(this).css('background-color', '#dbebee'); 
				
			//마우스 오버 이벤트 시 수정, 삭제 버튼 보임
			$(this).mouseover(function(){
				$(this).children('td:last').children('#revise_remove').css('visibility', 'visible');
			});
				
			//영역 밖으로 마우스 나가면 버튼 숨김
			$(this).mouseout(function(){
				$(this).children('td:last').children('#revise_remove').css('visibility', 'hidden');
			});
		}
	});
	
	/*모달창에서 댓글 내용 수정*/  
	$('#update_complete').on('click', function(){
		var cmNo =  $('#update_comment_cm_no').text();
		var content = $('#update_comment_area').val();
		var itemNo = ${guideItem.gui_no};
		
		$.ajax({
			url : "updateComment",
			type : "post",
			data : {cmNo : cmNo, content : content, itemNo : itemNo},
			success : function(data){
				alert("댓글 수정 완료 >.ㅇ");
				var origin = document.getElementById(cmNo);
				$(origin).parent().prev().text(content); //수정 버튼을 클릭한 댓글을 찾아서 내용만 업데이트
			},
			error : function(e){
				alert("댓글 수정 실패 ㅠ");
			}
		}); 
	});
	
	/*달력용*/
	$('#datepicker').datepicker({
		minDate : "+2d",
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
	
	#notify:hover, #notify:focus {
		background-color : red;
		cursor: pointer;
	}
	
	.notify_default {
		background-color : white;
	}
	
	.notified {
		background-color : #b7b7b7;
		
	}
	#print_map{
		width: 600px;
		height: 450px;
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
	
	.not_rated, .rated {
		width : 80px;
		height : 40px;
		font-size : 11pt;	
		-moz-border-radius : 5px;
		-webkit-border-radius : 5px;
		border-radius : 5px;
		background-color : #fec70a;

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
	
	.add_favorite {
		color : black;
		background-color : white;
	}
	
	.remove_favorite {
		color : white;
		background-color : #408080;
	}

	.add_favorite span, .remove_favorite span{
		color : yellow;
	}

	#btns button {
		width : 150px;
		height : 40px;
		font-size : 14pt;	
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
		border-radius:10px;
	}
	
	#buy_btn {
		background-color : #04378c;
		color : white;
	}
	
	#btns button:hover {
		background-color : #ba012b;
		color : white;
	}
	
	#guide_profile table {
		border-spacing : 20px;
		border-collapse : separate;
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

	#item_reply, #item_maps{
		width : 100%;
		margin-top : 5%;
		padding-top : 5%;
		border-top : 1px solid gray;
	}

	#user_rep{
		padding : 1%;
		width : 80%;
		margin-left : 5%;
		text-align : left;
		display : inline-block;	
	}
	
	#user_rep table {
		border-spacing : 0px 5px;
		border-collapse : separate;
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
		height : auto;
		background : none;
		border : none;
	    overflow: auto;
	    outline: none;
	    -webkit-box-shadow: none;
	    -moz-box-shadow: none;
	    box-shadow: none;
	    border-style : none;
	    border-color : Transparent;
	}

	#revise_remove{
		right : -70%;
		text-align : right;
		z-index: 1;
		visibility : hidden;
	}
	#item_contents img{max-width: 100%;}
	
	/*모달용*/
	.modal {
		display : none;
		position : fixed;
		z-index : 10;
		padding-top : 30%;
		width : 100%;
		height : 100%;
		overflow : auto;
		background-color: rgb(0,0,0);
		background-color: rgba(0,0,0,0.4); 
	}

	.modal_body {
		background-color : white;
		margin : 0 auto;
		padding : 2%;
		border : 1px solid gray;
		width : 60%;
		height : 350px;
		border-radius : 30px;
		-moz-border-radius: 30px;
		-webkit-border-radius: 30px;
	}

	@Media all and (max-width : 800px){
		.modal_body {
			width : 100%;
		}
	} 

	.modal_head {
		text-align : center;
	}

	.modal_content {
		height : 120px;
	}

	.modal_footer {
		text-align : right;
	}

	.close_modal {
		color: #aaaaaa;
		float: right;
		top : 0;
		font-size: 28px;
	    font-weight: bold;
	}

	.close_modal:hover,.close_modal:focus {
		color: #000;
		text-decoration: none;
		cursor: pointer;
	}
	
	#update_complete {
		border-radius : 5px;
		-moz-border-radius: 5px;
		-webkit-border-radius: 5px;
		width : 100px;
		height : 40px;
		border : 1px solid gray;
	}
	
	#update_complete:hover, #update_complete:focus {
		background-color : #04378c;
		color : white;
		cursor: pointer;
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
	
	/*헤더*/
	.zeta-menu-bar {
	  background: #7bbdff;
	  display: inline-block;
	  width: 100%;
	}
	.zeta-menu { margin: 0; padding: 0; }
	.zeta-menu li {
	  float: left;
	  list-style:none;
	  position: relative;
	}
	.zeta-menu li:hover:not(.head) { background: white; }
	.zeta-menu li:hover>a { color: #7bbdff; }
	.zeta-menu a {
	  color: white;
	  display: block;
	  padding: 10px 20px;
	  text-decoration: none;
	}
	.zeta-menu ul {
	  background: #eee;
	  border: 1px solid silver;
	  display: none;
	  padding: 0;
	  position: absolute;
	  left: 0;
	  top: 100%;
	  width: 180px;
	  z-index: 1;
	}
	.head{
		position: relative;
		left: 32%;
		top: 2px;
	}
	.search{
		outline: none;
		background:  #7bbdff;
		box-sizing: border-box;
		border: none;
		border-bottom: white 2px solid;
		color: white;
		font-size: 16px;
	}
	li.head label{
		color: white;
	}
	.searchForm{
		margin: 0;
	}
	.zeta-menu ul li { float: none; }
	.zeta-menu ul li:hover { background: #ddd; }
	.zeta-menu ul li:hover a { color: black; }
	.zeta-menu ul a { color: black; }
	.zeta-menu ul ul { left: 100%; top: 0; }
	.zeta-menu ul ul li {float:left; margin-right:10px;}


  </style>
 </head>
 <body>
 
 <div class='zeta-menu-bar'>
  <ul class="zeta-menu">
    <li><a href="/afk/"><img src="/afk/resources/images/logo.png" width="100" height="25" border="0" alt="brand"></a></li>
    <li><a href="/afk/infoboard"><b>여행 정보</b></a></li>
    <li><a href="/afk/guide/guideMain"><b>가이드</b></a></li>

	<c:if test="${loginUser eq null}">
        <li style="float: right;"><a href="/afk/joinInsertView">회원가입</a></li>
    	<li style="float: right;"><a href="/afk/loginView">로그인</a></li>
	</c:if>
	<c:if test="${!(loginUser eq null)}">
		  <li style="float: right;"class="dropdown">
			<a href="#" class="dropbtn"><b>${loginUser.mb_id }</b>님 환영합니다.</a>
			<ul>
			  <li><a href="/afk/mypage">마이페이지</a></li>
	          <li><a href="/afk/customer?currentPage=1&nextBlock=">고객센터</a></li>
		  <c:if test="${loginUser.mb_grade eq '1'}">
	          <li><a href="memberListView">관리자 회원관리</a></li>
	          <li><a href="matching">관리자(매칭관리)</a></li>
	      </c:if>
			  <li><a href="/afk/logout">로그아웃</a></li>
			</ul>
		  </li>
	  </c:if>  
	</ul>
	</div>
 
  
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
				<c:if test="${guide.mb_rename_pic eq null }">
					<img src="/afk/resources/images/mypage/jo.jpg" width="100%" height="250px" border="1" alt="">
				</c:if>
				<c:if test="${guide.mb_rename_pic ne null }">
					<img src="/afk/resources/images/mypage/${guide.mb_rename_pic }" width="100%" height="250px" border="1" alt="">
				</c:if>
			</div>

			<div id="guide_profile">
				<table width="100%">
				<tr>
					<td style="font-size:22pt">
						${guide.mb_name}
						<input type="hidden" id="guide_id" value="${guide.mb_id}">
					</td>
					<c:if test="${loginUser.mb_grade eq '3'}">	
					<td>&nbsp;&nbsp;
						<button type="button" class="btn btn-default" id="send_msg">
							<span class="glyphicon glyphicon-envelope">쪽지보내기</span>
						</button>
					</td>
					</c:if>
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
							<button id="notify" class="notify_default" title="로그인 후 신고해주세요">
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
						<c:when test="${stars ne 0}">
							<c:forEach var="s" items="${pointList}">
								<c:if test="${s.mb_id eq loginUser.mb_id}">
									<c:choose>
										<c:when test="${stars == 1}">
											<span class="star_point">
												<a href="#" class="on">★</a>
												<a href="#">★</a>
												<a href="#">★</a>
												<a href="#">★</a>
												<a href="#">★</a>
											</span>
											<span style="font-size:12pt; margin-left:5%"><span id="selected_point">1</span>점</span>&nbsp;
											<button id="send_star_point" class="rated">별점 수정</button>
										</c:when>
										<c:when test="${stars == 2}">
											<span class="star_point">
												<a href="#" class="on">★</a>
												<a href="#" class="on">★</a>
												<a href="#">★</a>
												<a href="#">★</a>
												<a href="#">★</a>
											</span>
											<span style="font-size:12pt; margin-left:5%"><span id="selected_point">2</span>점</span>&nbsp;
											<button id="send_star_point" class="rated">별점 수정</button>
										</c:when>
										<c:when test="${stars == 3}">
											<span class="star_point">
												<a href="#" class="on">★</a>
												<a href="#" class="on">★</a>
												<a href="#" class="on">★</a>
												<a href="#">★</a>
												<a href="#">★</a>
											</span>
											<span style="font-size:12pt; margin-left:5%"><span id="selected_point">3</span>점</span>&nbsp;
											<button id="send_star_point" class="rated">별점 수정</button>
										</c:when>
										<c:when test="${stars == 4 }">
											<span class="star_point">
												<a href="#" class="on">★</a>
												<a href="#" class="on">★</a>
												<a href="#" class="on">★</a>
												<a href="#" class="on">★</a>
												<a href="#">★</a>
											</span>
											<span style="font-size:12pt; margin-left:5%"><span id="selected_point">4</span>점</span>&nbsp;
											<button id="send_star_point" class="rated">별점 수정</button>
										</c:when>
										<c:when test="${stars == 5}">
											<span class="star_point">
												<a href="#" class="on">★</a>
												<a href="#" class="on">★</a>
												<a href="#" class="on">★</a>
												<a href="#" class="on">★</a>
												<a href="#" class="on">★</a>
											</span>
											<span style="font-size:12pt; margin-left:5%"><span id="selected_point">5</span>점</span>&nbsp;
											<button id="send_star_point" class="rated">별점 수정</button>
										</c:when>
									</c:choose>
								</c:if>
							</c:forEach>
						</c:when>
						<c:when test="${purchased eq true && rated eq false}">
							<span class="star_point">
								<a href="#" class="on">★</a>
								<a href="#" class="on">★</a>
								<a href="#" class="on">★</a>
								<a href="#">★</a>
								<a href="#">★</a>
							</span>
							<span style="font-size:12pt; margin-left:5%"><span id="selected_point">3</span>점</span>&nbsp;
							<button id="send_star_point" class="not_rated">별점 주기</button>
						</c:when>
						<c:when test="${purchased eq false}">
							<h4><b>이 여행을 다녀오신 분만 별점을 남길 수 있습니다 >.ㅇ</b></h4>
						</c:when>
						<c:otherwise>
							<span class="star_point">
								<a href="#" class="on">★</a>
								<a href="#" class="on">★</a>
								<a href="#" class="on">★</a>
								<a href="#">★</a>
								<a href="#">★</a>
							</span>
							<span style="font-size:12pt; margin-left:5%"><span id="selected_point">3</span>점</span>&nbsp;
							<button id="send_star_point" class="not_rated">별점 주기</button>
						</c:otherwise>
					</c:choose>
					
					</td>
				</tr>
				</table>
			</div><!--end of intro-->
			</div>
	</div><!--end of guide_detail_top-->
	
	<div id="sub_nav">
	<div class="row">
		<div class="col-md-6">
			<select name="num" id="select_num_people">
				<option value="default" selected>인원 선택
				<option value="1">1명
				<option value="2">2명
				<option value="3">3명
				<option value="4">4명
				<option value="5">5명 이상
			</select>
			&nbsp;&nbsp;
			<input type="text" id="datepicker" name="date" value="날짜 선택">
		</div>
		<div class="col-md-6" id="btns">
		
		<c:choose>
		<c:when test="${!empty favorList}">
		<c:forEach var="f" items="${favorList}">
			<c:if test="${loginUser.mb_id eq f.fa_mb_id}">
				<button id="favorite" class="remove_favorite">
					<span class="glyphicon glyphicon-star"></span> 보관 취소
				</button>
			</c:if>
			<c:if test="${loginUser.mb_id ne f.fa_mb_id }">
				<button id="favorite" class="add_favorite">
					<span class="glyphicon glyphicon-star-empty"></span> 보관하기
				</button>
			</c:if>
		</c:forEach>
		</c:when>
		
		<c:when test="${empty favorList }">
			<button id="favorite" class="add_favorite">
				<span class="glyphicon glyphicon-star-empty"></span> 보관하기
			</button>
		</c:when>	
		</c:choose>
			<input type="hidden" name="itemNo" value="${guideItem.gui_no }"/>
			<button id="buy_btn" onclick="purchase();">구매하기</button>
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
				<div id="print_map">
				<!-- 지도 출력되는 부분 -->
				</div>
			</div>
			</div>
		</div><!--end of item_maps-->

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
			
			<div class="modal" id="comment_modal">
				<div class="modal_body">
					<div class="modal_head">
						<h4>댓글 수정 <span class="close_modal">x</span></h4>
					</div><!--  end of modal_head -->
					<hr>
					<div class="modal_content">
						<input type="hidden" id="update_comment_cm_no"/>
			      		<textarea id="update_comment_area" rows="9"></textarea>
					</div><!-- end of modal_content -->
					<hr>
					<div class="modal_footer">
						<button id="update_complete">수정하기</button>
					</div><!-- end of modal_footer -->
				</div><!-- end of modal_body -->
			</div><!-- end of class modal -->
			
			<div id="user_rep">
				<table width="100%">
				<c:if test="${!empty commentList}">
				<c:forEach var="comment" items="${commentList }">
					<tr>
						<td width="auto">
						
						<c:if test="${comment.mb_rename_pic eq null }">
							<img src="/afk/resources/images/mypage/jo.jpg" class="img-circle" width="70px" height="70px" alt="...">
						</c:if>
						<c:if test="${comment.mb_rename_pic ne null }">
							<img src="/afk/resources/images/mypage/${comment.mb_rename_pic }" wclass="img-circle" width="70px" height="70px" alt="...">
						</c:if>
							<p>${comment.cm_writer }</p>
							<input type="hidden" id="cmNo" name="cmNo" value="${comment.cm_no}"/>
						</td>
						<td width="70%" height="auto" style="word-break:break-all;">
							${comment.cm_content}
						</td>
						<td>
							<span id="revise_remove">
								<button class="btn btn-default" onclick="update_comment(this)">
								<span class="glyphicon glyphicon-pencil"></span>
								</button>
									
								<button class="btn btn-default" onclick="delete_comment(this)">
								<span class="glyphicon glyphicon-trash"></span>
								</button>
							</span>
							<input type="hidden" id="${comment.cm_no}"/>
							<input type="hidden" id="cm_writer" value="${comment.cm_writer }"/>
						</td>
					</tr>			
				</c:forEach>
				</c:if>				
				</table>
				
				<c:if test="${empty commentList}">
				<h3>등록된 코멘트가 없습니다.</h3>
				</c:if>	
									
			</div><!-- end of user_rep -->			
			
		</div><!--end of item_reply-->

	</div><!--end of item_detail-->

  </div><!--end of container-->
  
  </div>
  </div>
  <jsp:include page="../footer.jsp"/>
  <script>

// In the following example, markers appear when the user clicks on the map.
// The markers are stored in an array.
// The user can then click an option to hide, show or delete the markers.

//map에서 문자열 추출
var loadMap = "${guideItem.gui_map}"; //불러온 map 정보 변수에 삽입
var maplist = loadMap.split('/');	//map '/'을 기준으로 분할해 배열에 삽입
var mapX = new Array;
var mapY = new Array;	//x, y 좌표들을 집어넣을 빈 배열 변수 생성

for(var i = 0 ; i<maplist.length-1; i++){ //x좌표 y좌표 분리해서 각 배열에 삽입
	mapX.push(maplist[i].substring(maplist[i].indexOf("(") + 1, maplist[i].indexOf(",")));
	mapY.push(maplist[i].substring(maplist[i].indexOf(",") + 1, maplist[i].indexOf(")")));
};

var map;
var markers = [];
var xy = [];

var positions = "";

function initMap() {
  //Number타입으로 형변환 후 가장 첫번째 x,y좌표를 이용해  지도생성
  var haightAshbury = {lat: Number(mapX[0]), lng: Number(mapY[0])}; 

  map = new google.maps.Map(document.getElementById('print_map'), {
    zoom: 16,
    center: haightAshbury,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  });
  
  for(var i = 0 ; i<maplist.length-1; i++){ //불러온 좌표들 마커 찍어주기
	  	addMarker({lat: Number(mapX[i]) , lng: Number(mapY[i])});
	};
}

// Adds a marker to the map and push to the array.
function addMarker(location) {
  var marker = new google.maps.Marker({
    position: location,
    map: map
  });
  markers.push(marker);
}

</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCmEzr7dLdGc9EOPrEgBKFkcbT04TLZtSU&callback=initMap"></script>
 </body>
</html>

