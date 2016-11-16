<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MYPAGE</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

		<style type="text/css">
			.thumbnail-wrappper {
				width: 25%; 
			}

			.thumbnail {
				position: relative;
				padding-top: 100%;  /* 1:1 ratio */
				overflow: hidden;
			}

			.thumbnail .centered  {
				position: absolute;
				top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				-webkit-transform: translate(50%,50%);
				-ms-transform: translate(50%,50%);
				transform: translate(50%,50%);
			}

			.thumbnail .centered img {
				position: absolute;
				top: 0;
				left: 0;   
				max-width: 100%;
				height: auto;
				-webkit-transform: translate(-50%,-50%);
				-ms-transform: translate(-50%,-50%);
				transform: translate(-50%,-50%);
			}

			.mycontent{
				width: 100%; 
				height: 130px; 
				background-color:powderblue;
				border-radius: 15px;
			}

			.mymessage{
				width: 100%; 
			}

			.senderPic{
				width: 100%;
			}

			.senderName{
				width:100%;
				font-size: large;
				text-align: center;
			}

			.sPicName{
				width:20%;
				display: inline-block;
			}

			.msgContent{
				width: 60%; 
				display: inline-block;
				vertical-align: top;
				font-size: 14pt;
			}

			.sendtime{
				font-size: 11pt;
				text-align:right
			}

			.btnMsgdel{
				display: inline-block;
				vertical-align: top;
			}

			.nav-stacked li a:hover{
				color: white;
				background-color: black;
			}

			@media (max-width: 768px) {
				.container{
					width: 100%;
				}
				.mycontent{
					height: 300px;
				}
				.mymessage{
					height: 200px;
				}
			}
			.doclick{
				cursor: pointer;
			}
			.act{
				background:#0CC;
			}
			
			.myguidecontent{
				width: 100%; 
				height: 70px; 
				background-color:powderblue;
				border-radius: 15px;
			}
			
			.mycontentP{
				width: 100%; 
				height: 160px; 
				background-color:powderblue;
				border-radius: 15px;
			}
		</style>
		<script>
			 $(function(){
				/*  var g = "${loginUser.mb_grade}";
				 alert(g); */
				 
				 var id = "${loginUser.mb_id}";
					$.ajax({
						url : "mypage/favoritelist",
						data : { mbid : id },
						type : "post",
						dataType : "json",
						success : function(data){
							if(data != null){	
								var jsonStr = JSON.stringify(data);  //객체를 문자열로 변환
								console.log(jsonStr);
								var json = JSON.parse(jsonStr); //문자열을 배열 객체로 바꿈
								console.log(json);
								var Ca = /\+/g;
								
								$("#myfaContent").empty();
								for(var i in json.list){
									
									$("#myfaContent").append("<div class='mycontent'><div class='pull-left' style='width:30%; height:100%; overflow:hidden;'>"
											+"<img src='"+ json.list[i].image +"' style='width:100%; heigth:100%;'></img></div> " 
											+"<br><a href='/afk/infoboard/"+ json.list[i].fano +"'><h3>"
											+decodeURIComponent(json.list[i].title.replace(Ca, " "))
											+"</h3></a><div class='delMyfa' style='float:right; margin-right:2%; cursor:pointer;'>"
											+"<img src='resources/images/mypage/heart4.png' title='클릭시 리스트에서 제거됩니다.'></img>"
											+"<input type='hidden' name='delMyfa' value='"+ json.list[i].fano +"'></div>"
											+"<div style='margin-top:2%;'>"+ json.list[i].writer
											+"</div></div><br>");
								}
								
								$('#myfaContent').each(function(){
									var currentPage = 0;
									var numPerPage= 5;
									var $myfaContent = $(this);
									
									$myfaContent.bind('repaginate', function(){
										$myfaContent.find('div.mycontent').hide()
													.slice(currentPage * numPerPage, (currentPage + 1) * numPerPage)
													.show();
									});
									//페이지
									var numRows = $('#myFavorite').find('div.mycontent').length;
									//alert(numRows);
								    var numPages = Math.ceil(numRows / numPerPage);
								    var $pager = $('<div class="pager"></div>');
								    for (var page = 0; page < numPages; page++) {
								      $('<span class="page-number"></span>').text(page + 1)
								        .bind('click', {newPage: page}, function(event) {
								          currentPage = event.data['newPage'];
								          $myfaContent.trigger('repaginate');
								          $(this).addClass('act')
								            .siblings().removeClass('act');
								        }).appendTo($pager).addClass('doclick');
								    }
								    $pager.insertBefore($myfaContent)
								      .find('span.page-number:first').addClass('active');
								});
								
								if(json.list.length == 0){
									$("#myfaContent").append("<center><h3><span>즐겨찾기에 추가한 게시물이 없습니다.</span></h3><br><br>" +
									"<a href='/afk/infoboard'><button type='button' class='btn btn-default btn-lg'><span class='glyphicon glyphicon-eye-open' aria-hidden='true'></span> 여행 정보 게시물 보러가기 </button></a></center>");
								}
							}	
						}
					});

				
				$(document).on('click', '#btnMsgDel',function(){
					//메세지 삭제 이벤트
					if (confirm("정말 삭제하시겠습니까??") == true){    //확인
						var msgno = $('#msgno').val();
						var rid = $('#rid').val();
						var sid = $('#sid').val();
						//alert('/afk/msg/deletemsg?msgno='+ msgno);
					    if(rid == "${loginUser.mb_id}"){
							location.href='/afk/msg/msgdeleteR?mesno='+msgno;
					    }else if (sid == "${loginUser.mb_id}"){
					    	//alert(sid);
		
					    	location.href='/afk/msg/msgdeleteS?mesno='+msgno;
					    }
					}else{   //취소
					    return;
					}
				}); 
				
				$('button#btnProfileDel').on('click',function(){
					//프로필사진 삭제 이벤트
					if (confirm("정말 삭제하시겠습니까??") == true){    //확인
					    location.href='/afk/mypage/deleteprofile?loginid=${loginUser.mb_id}';
					}else{   //취소
					    return;
					}
				});
				
				$(document).on('click', '.delMywish',function(){
					//위시리스트 삭제 이벤트
					if (confirm("위시리스트에서 삭제하시겠습니까??") == true){    //확인
						var wishno = $(this).children('input').val();
						/* alert(wishno); */
					    location.href='/afk/mypage/deletewish?wishno='+wishno+'&loginId=${loginUser.mb_id}';
					}else{   //취소
					    return;
					}
				});
				
				$(document).on('click', '.delMyfa',function(){
					//즐겨찾기 삭제 이벤트
					if (confirm("위시리스트에서 삭제하시겠습니까??") == true){    //확인
						var fano = $(this).children('input').val();
						/* alert(wishno); */
					    location.href='/afk/mypage/deletefavorite?fano='+fano+'&loginId=${loginUser.mb_id}';
					}else{   //취소
					    return;
					}
				});
				
				$(document).on('click', '.delMyPay',function(){
					//구매내역 삭제 이벤트
					if (confirm("구매 내역에서 삭제하시겠습니까??") == true){    //확인
						var payno = $(this).children('input').val();
						//alert(payno);
					    location.href='/afk/mypage/deletepay?payno='+payno+'&loginId=${loginUser.mb_id}';
					}else{   //취소
					    return;
					}
				});
				
				$(document).on('click', '.delMyMatching',function(){
					//매칭리스트 삭제 이벤트
					if (confirm("매칭리스트에서 삭제하시겠습니까??") == true){    //확인
						var matchingno = $(this).children('input').val();
						/* alert(wishno); */
					    location.href='/afk/mypage/deletematching?matchingno='+matchingno;
					}else{   //취소
					    return;
					}
				});
			});	
			 
			
			//즐겨찾기 리스트
			function getFavorite(){
				 var id = "${loginUser.mb_id}";
					$.ajax({
						url : "mypage/favoritelist",
						data : { mbid : id },
						type : "post",
						dataType : "json",
						success : function(data){
							if(data != null){	
								var jsonStr = JSON.stringify(data);  //객체를 문자열로 변환
								console.log(jsonStr);
								var json = JSON.parse(jsonStr); //문자열을 배열 객체로 바꿈
								console.log(json);
								var Ca = /\+/g;
								
								$("#myfaContent").empty();
								for(var i in json.list){
									if(json.list.length != 0){
										$("#myfaContent").append("<div class='mycontent'><div class='pull-left' style='width:30%; height:100%; border:1px solid blue;'></div>"
												+"<br><a href='/afk/infoboard/"+ json.list[i].fano +"'><h3>"
												+decodeURIComponent(json.list[i].title.replace(Ca, " "))
												+"</h3></a><div class='delMyfa' style='float:right; margin-right:2%; cursor:pointer;'>"
												+"<img src='resources/images/mypage/heart4.png' title='클릭시 리스트에서 제거됩니다.'></img>"
												+"<input type='hidden' name='delMyfa' value='"+ json.list[i].fano +"'></div>"
												+"<div style='margin-top:2%;'>"+ json.list[i].writer
												+"</div></div><br>");
								}
								
									$('#myfaContent').each(function(){
										var currentPage = 0;
										var numPerPage= 5;
										var $myfaContent = $(this);
										
										$myfaContent.bind('repaginate', function(){
											$myfaContent.find('div.mycontent').hide()
														.slice(currentPage * numPerPage, (currentPage + 1) * numPerPage)
														.show();
										});
										//페이지
										$(".pager").remove();
										var numRows = $('#myFavorite').find('div.mycontent').length;
									    var numPages = Math.ceil(numRows / numPerPage);
									    var $pager = $('<div class="pager"></div>');
									    for (var page = 0; page < numPages; page++) {
									      $('<span class="page-number"></span>').text(page + 1)
									        .bind('click', {newPage: page}, function(event) {
									          currentPage = event.data['newPage'];
									          $myfaContent.trigger('repaginate');
									          $(this).addClass('act')
									            .siblings().removeClass('act');
									        }).appendTo($pager).addClass('doclick');
									    }
									    $pager.insertBefore($myfaContent)
									      .find('span.page-number:first').addClass('active');
									});
								}
								if(json.list.length == 0){
									$("#myfaContent").empty();
									$("#myfaContent").append("<center><h3><span>즐겨찾기에 추가한 게시물이 없습니다.</span></h3><br><br>" +
									"<a href='/afk/infoboard'><button type='button' class='btn btn-default btn-lg'><span class='glyphicon glyphicon-eye-open' aria-hidden='true'></span> 여행 정보 게시물 보러가기 </button></a></center>");
								}
							}	
						}
					});
			}
			
			//일반 유저가 로그인시, 마이페이지에서 메시지 보낸 것만 보이게
			function getmymsg(){
				var loginId = "${loginUser.mb_id}";
				$.ajax({
					url : "msg/msglist",
					data : { loginId : loginId},
					type: "post",
					dataType : "json",
					success : function(data){
						var str = "";
						if(data.length > 0){
							for(var i in data){
								if(data[i].send_id == loginId){
								if(data[i].s_delyn == "N"){	
									$("#mymsgdiv").empty();
									str += "<div class='table-responsive'><table class='table'><tr><td style='word-break:break-all; color:blue'>" 
									+ data[i].mes_content + "</div></td>" +
									"<td width='25%'><div class='thumbnail-wrapper'><div class='thumbnail'><div class='centered'>"
									
									if(data[i].mb_rename_pic == null){
										str += "<img src='resources/images/mypage/jo.jpg'>";
									}
									else{
										path = data[i].mb_rename_pic
										str += "<img src='${pageContext.request.contextPath}/resources/images/mypage/"+ path +"' style='width:100%;'>";
									}
									
									str += "</div></div></div></td></tr><tr><td>TO. " + data[i].recieve_id + "</td>" 
									+"<td>FROM. " + data[i].send_id + "</td></tr><tr><td colspan='2' style='text-align:center'>"
									+"<c:if test='${loginUser.mb_grade == 3}'><a href='/afk/msg?guideId="+ data[i].recieve_id +"&loginId=${loginUser.mb_id}'><button type='button' class='btn btn-default btn-lg'>상세보기</button></a></c:if>"
									+"<c:if test='${loginUser.mb_grade == 2}'><a href='/afk/msg/list?askId="+ data[i].send_id +"&gId=${loginUser.mb_id}'><button type='button' class='btn btn-default btn-lg'>상세보기</button></a></c:if>"
									+" &nbsp; &nbsp; <button type='button' class='btn btn-default btn-lg' id='btnMsgDel'>삭제하기</button>"
									+"<input type='hidden' id='msgno' value='"+data[i].mes_no +"'>"
									+"<input type='hidden' id='rid' value='"+ data[i].recieve_id +"'>"
									+"<input type='hidden' id='sid' value='"+ data[i].send_id +"'>"
									+"</tr></table></div><hr><p></p>"
								}
							}
							}
							$("#mymsgdiv").append(str);
							if($('#mymsgdiv').children().length == 0){
								$("#mymsgdiv").empty();
								str = "<br><center><h3><span>주고받은 메세지가 없습니다.</span></h3></center>"
								$("#mymsgdiv").append(str);
							}
						}else{
							$("#mymsgdiv").empty();
							str = "<br><center><h3><span>주고받은 메세지가 없습니다.</span></h3></center>"
							$("#mymsgdiv").append(str);
						}		
					}
				});
			}
			
			function getmymsgG(){
				//가이드 로그인시 마이페이지에서 받은 메세지만 보이게
				var loginId = "${loginUser.mb_id}";
				$.ajax({
					url : "msg/msglistG",
					data : { loginId : loginId},
					type: "post",
					dataType : "json",
					success : function(data){
						var str = "";
						if(data.length > 0){
							for(var i in data){
							if(data[i].recieve_id == loginId){
								if(data[i].r_delyn == "N"){	
									$("#mymsgdiv").empty();
									str += "<div class='table-responsive'><table class='table'><tr><td style='word-break:break-all; color:blue'>" 
									+ data[i].mes_content + "</div></td>" +
									"<td width='25%'><div class='thumbnail-wrapper'><div class='thumbnail'><div class='centered'>"
									
									if(data[i].mb_rename_pic == null){
										str += "<img src='resources/images/mypage/jo.jpg'>";
									}
									else{
										path = data[i].mb_rename_pic
										str += "<img src='${pageContext.request.contextPath}/resources/images/mypage/"+ path +"' style='width:100%;'>";
									}
									
									str += "</div></div></div></td></tr><tr><td>TO. " + data[i].recieve_id + "</td>" 
									+"<td>FROM. " + data[i].send_id + "</td></tr><tr><td colspan='2' style='text-align:center'>"
									+"<c:if test='${loginUser.mb_grade == 3}'><a href='/afk/msg?guideId="+ data[i].recieve_id +"&loginId=${loginUser.mb_id}'><button type='button' class='btn btn-default btn-lg'>상세보기</button></a></c:if>"
									+"<c:if test='${loginUser.mb_grade == 2}'><a href='/afk/msg/list?askId="+ data[i].send_id +"&gId=${loginUser.mb_id}'><button type='button' class='btn btn-default btn-lg'>상세보기</button></a></c:if>"
									+" &nbsp; &nbsp; <button type='button' class='btn btn-default btn-lg' id='btnMsgDel'>삭제하기</button>"
									+"<input type='hidden' id='msgno' value='"+data[i].mes_no +"'>"
									+"<input type='hidden' id='rid' value='"+ data[i].recieve_id +"'>"
									+"<input type='hidden' id='sid' value='"+ data[i].send_id +"'>"
									+"</tr></table></div><hr><p></p>"
								}
							}
							}
							$("#mymsgdiv").append(str);
							if($('#mymsgdiv').children().length == 0){
								$("#mymsgdiv").empty();
								str = "<br><center><h3><span>주고받은 메세지가 없습니다.</span></h3></center>"
								$("#mymsgdiv").append(str);
							}
						}else{
							$("#mymsgdiv").empty();
							str = "<br><center><h3><span>주고받은 메세지가 없습니다.</span></h3></center>"
							$("#mymsgdiv").append(str);
						}		
					}
				});
			}
			
			function getmywish(){
				//위시리스트 불러오기
				var id = "${loginUser.mb_id}";
				$.ajax({
					url : "mypage/wishlist",
					data : { mbid : id },
					type : "post",
					dataType : "json",
					success : function(data){
						if(data != null){	
							var jsonStr = JSON.stringify(data);  //객체를 문자열로 변환
							console.log(jsonStr);
							var json = JSON.parse(jsonStr); //문자열을 배열 객체로 바꿈
							console.log(json);
							var Ca = /\+/g;
							
							if(json.list.length != 0){
								$("#mywishContent").empty();
								for(var i in json.list){
									$("#mywishContent").append("<div class='mycontent'><div class='pull-left' style='width:30%; height:100%; overflow:hidden;' ><img src='"+ json.list[i].image.substring(1, json.list[i].image.length) +"' style='width:100%; heigth:100%;'></img></div> " 
															+ "<br><a href='/afk/guide/guideDetail?itemNo="+ json.list[i].gno +"&writer="+ json.list[i].writer +"'><h3>" 
															+ decodeURIComponent(json.list[i].title.replace(Ca, " ")) 
															+"</h3></a><div class='delMywish' style='float:right; margin-right: 2%; cursor:pointer;'>"
															+"<img src='resources/images/mypage/heart4.png' title='클릭시 리스트에서 제거됩니다.'></img>"
															+"<input type='hidden' name='delMyWish' value='"+ json.list[i].gno +"'></div>"
															+"<div style='margin-top:2%;'>"+ json.list[i].writer +"</div></div><br>");
								}
							}
							else{
								$("#mywishContent").empty();
								$("#mywishContent").append("<br><center><h3><span>위시리스트에 추가한 게시물이 없습니다.</span></h3><br><br>" +
								"<a href='/afk/guide/guideMain'><button type='button' class='btn btn-default btn-lg'><span class='glyphicon glyphicon-eye-open' aria-hidden='true'></span> 가이드 게시물 보러가기 </button></a></center>");
							}
						}	
					}
				});	
			}
			
			function getmyguide(){
				//가이드 아이디인 경우, 내가 올린 가이드 게시물 불러옴
				var loginId = "${loginUser.mb_id}";
				$.ajax({
					url : "mypage/guidelist",
					data : { loginId : loginId},
					type: "post",
					dataType : "json",
					success : function(data){
						var str = "";
						if(data.length > 0){
							for(var i in data){	
										$("#myGuideContent").empty();
										str += "<ul><a href='guide/guideDetail?itemNo="+ data[i].gui_no+"&writer="+ data[i].gui_writer +"'><h4>" + data[i].gui_title +"</h4></a></ul><br>"
							}
							$("#myGuideContent").append(str);
						}else{
							$("#myGuideContent").empty();
							$("#myGuideContent").append("<br><center><h3><span>올린 게시물이 없습니다.</span></h3><br><br>" +
							"<a href='/afk/guide/guideMain'><button type='button' class='btn btn-default btn-lg'><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span> 가이드 게시물 올리기 </button></a></center>");
						}
					}
				});
			}
			
			function getmypay(){
				//구매 목록 불러오기
				
				var loginId = "${loginUser.mb_id}";
				 $.ajax({
					url : "mypage/paylist",
					data : { loginId : loginId},
					type: "post",
					dataType : "json",
					success : function(data){
						 var str = "";
						 if(data != null){
							var jsonStr = JSON.stringify(data);  //객체를 문자열로 변환
							console.log(jsonStr);
							var json = JSON.parse(jsonStr); //문자열을 배열 객체로 바꿈
							console.log(json);
							var Ca = /\+/g;
								
							if(json.list.length != 0){
								$("#mypayContent").empty();
								for(var i in json.list){
									str += "<div class='mycontentP'><br><span style='margin-left:3%; font-size:16pt;'><a href='/afk/guide/guideDetail?itemNo="+ json.list[i].gno +"&writer="+ json.list[i].gid +"'>"+ decodeURIComponent(json.list[i].title.replace(Ca, " ")) +"<a/></span>"
										+"<br><br><div style='margin-left:2%; width: 85%; float:left; font-size:12pt;'>가이드이름 : "+ decodeURIComponent(json.list[i].gname) +" &nbsp; &nbsp; 가이드연락처 : "+ json.list[i].phone 
										+"<br>출발일 : "+ json.list[i].departureDate +" &nbsp; &nbsp; 인원수 : "+ json.list[i].tnum +"명"
										+"<br>결제 금액 : "+ json.list[i].price +"원 &nbsp; &nbsp; 결제일 : "+ json.list[i].payDate +"</div>"
										+"<button type='button' class='btn btn-default pull-right delMyPay' style='margin-right:5%;'>"
										+"<input type='hidden' value='"+ json.list[i].payno +"'><span class='glyphicon glyphicon-trash' aria-hidden='true' title='삭제하기'></span></button></div><br>"  
								}
								$("#mypayContent").append(str);
						}else{
							$("#mypayContent").empty();
							$("#mypayContent").append("<br><center><h3><span>구매한 내역이 없습니다.</span></h3><br><br>");
						}
					} 
				}
				});
			}
			
			function getmymatching(){
				//매칭 리스트 불러오기				
											
				var loginId = "${loginUser.mb_id}";
				$.ajax({
					url : "mypage/matchinglist",
					data : { loginId : loginId},
					type: "post",
					dataType : "json",
					success : function(data){
						var str = "";
						if(data != null){
							var jsonStr = JSON.stringify(data);  //객체를 문자열로 변환
							console.log(jsonStr);
							var json = JSON.parse(jsonStr); //문자열을 배열 객체로 바꿈
							console.log(json);
							var Ca = /\+/g;
							
							if(json.list.length != 0){
								$("#mymatchingContent").empty();
								for(var i in json.list){
									str += "<div class='mycontentP'><br><span style='margin-left:3%; font-size:16pt;'><a href='/afk/guide/guideDetail?itemNo="+ json.list[i].gno +"&writer=${loginUser.mb_id}'>"+ decodeURIComponent(json.list[i].title.replace(Ca, " ")) +"<a/></span>"
										+"<br><br><div style='margin-left:2%; width: 85%; float:left; font-size:12pt;'>회원이름: "+ decodeURIComponent(json.list[i].uname) +" &nbsp; &nbsp; 회원연락처 : "+ json.list[i].phone 
										+"<br>출발일 : "+ json.list[i].departureDate +" &nbsp; &nbsp; 인원수 : "+ json.list[i].tnum +"명"
										+"<br>결제 금액 : "+ json.list[i].price +"원  &nbsp; &nbsp; 결제일 : "+ json.list[i].payDate +"</div>"
										+"<button type='button' class='btn btn-default pull-right delMyMatching' style='margin-right:5%;'>"
										+"<input type='hidden' value='"+ json.list[i].matchingno +"'><span class='glyphicon glyphicon-trash' aria-hidden='true' title='삭제하기'></span></button></div><br>"
							}
								$("#mymatchingContent").append(str);
						}else{
							$("#mymatchingContent").empty();
							$("#mymatchingContent").append("<br><center><h3><span>매칭목록이 존재하지 않습니다.</span></h3><br><br>");
							
						}
					}
				}
				});
			}
			 
		</script>
 </head>
 <body>
<jsp:include page="../header.jsp" flush="false"/>
<br>
	<div class="container">
		<div class="row" style=" background-color: rgba( 210, 210, 255, 0.3 ); border-radius:10px;">
		
			<div class="col-sm-4">
				<div class="thumbnail-wrapper">
					<div class="thumbnail">
						<div class="centered">
							<c:if test="${empty loginUser.mb_rename_pic}">
								<img src="resources/images/mypage/jo.jpg">
							</c:if>
							
							<c:if test="${!(loginUser.mb_rename_pic eq null)}">
								<img src="${pageContext.request.contextPath}/resources/images/mypage/${loginUser.mb_rename_pic }" style="width:100%;">
							</c:if>
						</div>
					</div>
				</div>
				<p></p>
				<p>
					<div class="btn-group btn-group-lg" role="group">
						<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" >
							사진 변경
						</button>
						<button type="button" class="btn btn-primary" id="btnProfileDel">
							사진 삭제
						</button>
					</div>
				</p>

				<!-- 프로필 사진 변경 모달 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
				  <div class="modal-dialog">
				  <form action="/afk/mypage/updateMyProfile" enctype="multipart/form-data" method="post">
					<div class="modal-content">
					  <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="myModalLabel">변경할 프로필 사진을 선택해주세요. (.jpg 만 가능)</h4>
					  </div>
					  <div class="modal-body">
						<input type="file" accept=".jpg" name="profilePic">
						<input type="hidden" name="loginid" value="${loginUser.mb_id}" >
					  </div>
					  <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button  class="btn btn-primary" type="submit">Save changes</button>
					  </div>
					</div>
				  </form>
				  </div>
				</div>
				<!-- /프로필 사진 변경 모달 -->
				
				<div>
					<ul class="nav nav-pills nav-stacked">
						<li class="active" onclick="getFavorite()"><a href="#myFavorite" data-toggle="tab" id="myFa">즐겨찾기 리스트</a></li>						
						<c:if test="${loginUser.mb_grade eq '3' }">
						<li onclick="getmypay()"><a href="#myPay" data-toggle="tab" id="myPa">구매 리스트</a></li>
						<li onclick="getmywish()"><a href="#myWish" data-toggle="tab" id="myWi">위시 리스트</a></li>
						</c:if>
						<c:if test="${loginUser.mb_grade eq '3' }">
						<li onclick="getmymsg()"><a href="#myMessage" data-toggle="tab" id="myMe">메세지 리스트</a></li>
						</c:if>
						<c:if test="${loginUser.mb_grade eq '2' }">
						<li onclick="getmymsgG()"><a href="#myMessage" data-toggle="tab" id="myMe">메세지 리스트</a></li>
						</c:if>
						<c:if test="${loginUser.mb_grade eq '2' }">
						<br>
						<li onclick="getmymatching()"><a href="#myMatching" data-toggle="tab" id="myMa">매칭 리스트</a></li>
						<li onclick="getmyguide()"><a href="#myGuide" data-toggle="tab" id="mygu">내가 올린 가이드 게시물</a></li>
						</c:if>
						<br>
						<li><a href="/afk/updateView">정보 수정하기</a></li>
					</ul>
				</div>
			</div>
			
			<div class="col-sm-8">
				<div class="tab-content">
					
					<div class="tab-pane active" id="myFavorite">
						<h2><span class="page-header">나의 즐겨찾기</span></h2><br>
						<div id="myfaContent">
							<!-- 즐겨찾기 게시물 부분 -->
						</div>
						<br><br>
					</div>
					
					<div class="tab-pane" id="myWish">
						<h2><span class="page-header">나의 위시리스트</span></h2><br>
						<div id="mywishContent">
						</div>
						<br><br>
					</div>
					
					<div class="tab-pane" id="myPay">
						<h2><span class="page-header">나의 구매 목록</span></h2><br>
						<div id="mypayContent">
						</div>
						<br><br>
					</div>
					
					<div class="tab-pane" id="myMatching">
						<h2><span class="page-header">나의 매칭 목록</span></h2><br>
						<div id="mymatchingContent">
						</div>
						<br><br>
					</div>
					
					<div class="tab-pane" id="myGuide">
						<h2><span class="page-header">내가 올린 가이드 게시물</span></h2><br>
						<div id="myGuideContent">
						</div>
						<br><br>
					</div>

					<div class="tab-pane" id="myMessage">
						<c:if test="${loginUser.mb_grade eq '3' }">
						<h2><span class="page-header">나의 메세지</span><small> &nbsp; 최근에 보낸 메세지만 보입니다. </small></h2><br>
						</c:if>
						<c:if test="${loginUser.mb_grade eq '2' }">
						<h2><span class="page-header">나의 메세지</span><small> &nbsp; 최근에 받은 메세지만 보입니다. </small></h2><br>
						</c:if>
						<div class="mymessage" id="mymsgdiv">	
						</div>
						<br><br>
					</div>
					
				<!-- </div class="tab-content"> -->
				</div>
			<!-- </div class="col-sm-8"> -->
			</div>
		<!-- </div class="row"> -->
		</div>
	<!-- </div class="container"> -->
	</div>
<jsp:include page="../footer.jsp" flush="false"/>
</body>
</html>