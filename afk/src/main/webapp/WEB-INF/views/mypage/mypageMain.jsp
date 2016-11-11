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
				height: 200px; 
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
		</style>
		<script>
			 $(function(){
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
									
									$("#myfaContent").append("<div class='mycontent'><div class='pull-left' style='width:30%; height:100%; background-color:red;'>"+ json.list[i].writer + "</div>" 
											+ "<h3><span class='pull-right' style='margin-right: 5%; margin-top: 5%;'>" + decodeURIComponent(json.list[i].title.replace(Ca, " ")) +"</span></h3></div><br>");
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

				
				$('button#btnMsgDel').on('click',function(){
					if (confirm("정말 삭제하시겠습니까??") == true){    //확인
					    //document.form.submit();
					}else{   //취소
					    return;
					}
				}); 
				
				$('button#btnProfileDel').on('click',function(){
					if (confirm("정말 삭제하시겠습니까??") == true){    //확인
					    location.href='/afk/mypage/deleteprofile?loginid=${loginUser.mb_id}';
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
									$("#myfaContent").append("<div class='mycontent'><div class='pull-left' style='width:30%; height:100%; background-color:red;'>"+ json.list[i].writer + "</div>" 
											+ "<h3><span class='pull-right' style='margin-right: 5%; margin-top: 5%;'>" + decodeURIComponent(json.list[i].title.replace(Ca, " ")) +"</span></h3></div><br>");
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
			
			//메시지 리스트
			function getmymsg(){
				var loginId = "${loginUser.mb_id}";
				//var guideId = "${guide.mb_id}"
				$.ajax({
					url : "msg/msglist",
					data : { loginId : loginId/* , guideId : guideId */},
					type: "post",
					dataType : "json",
					success : function(data){
						//alert("list");
						if(data != null){	
							var jsonStr = JSON.stringify(data);  //객체를 문자열로 변환
							console.log(jsonStr);
							var json = JSON.parse(jsonStr); //문자열을 배열 객체로 바꿈
							console.log(json);
							var Ca = /\+/g;
							
							if(json.list.length != 0){
								$("#mymsgdiv").empty();
								for(var i in json.list){
									$("#mymsgdiv").append("<div class='table-responsive'><table class='table'><tr><td style='word-break:break-all; color:blue'>" 
										+ decodeURIComponent(json.list[i].msgcontent.replace(Ca, " ")) + "</div></td>" +
										"<td width='25%'><div class='thumbnail-wrapper'><div class='thumbnail'><div class='centered'><img src='img/p.jpg'>" +
										"</div></div></div></td></tr><tr><td>" + json.list[i].rid + "에게 보냄</td>" +
										"<td>" + json.list[i].sid + "</td></tr><tr><td colspan='2' style='text-align:center'>"+
										"<a href='/afk/msg?guideId="+ json.list[i].rid +"&loginId=${loginUser.mb_id}'><button type='button' class='btn btn-default btn-lg'>상세보기</button></a>"
										+" &nbsp; &nbsp; <button type='button' class='btn btn-default btn-lg' id='btnMsgDel'>삭제하기</button></tr></table></div><hr><p></p>");
								}	
							}else{
								$("#mymsgdiv").empty();
								$("#mymsgdiv").append("<br><center><h3><span>주고받은 메세지가 없습니다.</span></h3></center>");
							}
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
									$("#mywishContent").append("<a href='/afk/guide/guideDetail?itemNo="+ json.list[i].gno +"&writer="+ json.list[i].writer +"'><div class='mycontent'>"+ json.list[i].writer + ", " + "<h3>" + decodeURIComponent(json.list[i].title.replace(Ca, " ")) +"</h3><img src='" + json.list[i].image + "'</img></div></a><br>");
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
		</script>
 </head>
 <body>
<jsp:include page="../header.jsp" flush="true"/>
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
						${loginUser }
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
						<li onclick="getmywish()"><a href="#myWish" data-toggle="tab" id="myWi">위시 리스트</a></li>
						<li onclick="getReview()"><a href="#myReview" data-toggle="tab" id="myRe">후기 리스트</a></li>
						<li onclick="getmymsg()"><a href="#myMessage" data-toggle="tab" id="myMe">메세지 리스트</a></li>
						<li><a href="/afk/updateView">정보 수정하기</a></li>
						<!-- <li><a href="/afk/msg">문의하기 작성</a></li> -->
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
					
					<div class="tab-pane" id="myReview">
						<h2><span class="page-header">내가 작성한 후기</span></h2><br>
						<br><br>

					</div>	

					<div class="tab-pane" id="myMessage">
						<h2><span class="page-header">나의 메세지</span></h2><br>
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
</body>
</html>