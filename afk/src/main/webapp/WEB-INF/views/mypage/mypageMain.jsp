<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
									//$("#myfaContent").append(json.list[i].writer + ", " + decodeURIComponent(json.list[i].title.replace(Ca, " ")) + ", " + decodeURIComponent(json.list[i].content.replace(Ca, " ")) + "<br>");
									$("#myfaContent").append("<div class='mycontent'><div class='pull-left' style='width:30%; height:100%; background-color:red;'>"+ json.list[i].writer + "</div>" 
											+ "<h3><span class='pull-right' style='margin-right: 5%; margin-top: 5%;'>" + decodeURIComponent(json.list[i].title.replace(Ca, " ")) +"</span></h3></div><br>");
								}
							}
							else{
								$("#myfaContent").append("즐겨찾기한 게시물이 없습니다.");
							}
						}
					});
					
				$('#btnMsgDel').click(function(){
					if (confirm("정말 삭제하시겠습니까??") == true){    //확인
					    document.form.submit();
					}else{   //취소
					    return;
					}
				});
				
			}); 
			
			function getFavorite(){
				//alert("1");
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
							
							if(json.list.length != 0){
								$("#myfaContent").empty();
								for(var i in json.list){
									//$("#myfaContent").append(json.list[i].writer + ", " + decodeURIComponent(json.list[i].title.replace(Ca, " ")) + ", " + decodeURIComponent(json.list[i].content.replace(Ca, " ")) + "<br>");
									$("#myfaContent").append("<div class='mycontent'>"+ json.list[i].writer + ", " + "<h3>" + decodeURIComponent(json.list[i].title.replace(Ca, " ")) +"</h3></div><br>");
								}
							}
							else{
								$("#myfaContent").append("<center><h3><span>즐겨찾기에 추가한 게시물이 없습니다.</span></h3><br><br>" +
								"<button type='button' class='btn btn-default btn-lg' onclick="+"'window.location.href='"+"myplan/write'"+
								"><span class='glyphicon glyphicon-pencil' aria-hidden='true'></span> 여행 정보 게시물 보러가기 </button></center>");
							}
						}	
					}
				});	
			}
			
			/* function getPlan(){
				//alert("1");
				var id = "${loginUser.mb_id}";
				$.ajax({
					url : "mypage/planlist",
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
								$("#myPlanContent").empty();
								for(var i in json.list){
									$("#myPlanContent").append("<button type='button' class='btn btn-default btn-lg pull-right' onclick="+"window.location.href="+"'"+"myplan/write'" +">"+
									"<span class='glyphicon glyphicon-pencil' aria-hidden='true'></span> 여행 계획 작성하러 가기</button><br><br><br><br>" +
									"<div class='mycontent' style='cursor:pointer' data-toggle='modal' data-target='#myplan'>"+decodeURIComponent(json.list[i].title.replace(Ca, " "))+"</div>");
								}
							}
							else{
								$("#myPlanContent").append("<center><h3><span>아직 작성된 여행 계획이 없습니다.</span></h3><br><br>" +
								"<button type='button' class='btn btn-default btn-lg' onclick="+"window.location.href="+"'"+"myplan/write'" +">"+
								"<span class='glyphicon glyphicon-pencil' aria-hidden='true'></span> 여행 계획 작성하러 가기 </button></center>");
							}	
						}					
					}
				});	
			} */
		</script>
 </head>
 <body>

 <br><br><br>
	<div class="container">
		<div class="row" style=" background-color: rgba( 210, 210, 255, 0.3 ); border-radius:10px;">
		
			<div class="col-sm-4">
				<div class="thumbnail-wrapper">
					<div class="thumbnail">
						<div class="centered">
							<img src="resources/images/mypage/jo.jpg">
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
				  <form action="mypage/updateMyProfile" enctype="multipart/form-data" method="post">
					<div class="modal-content">
					  <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title" id="myModalLabel">변경할 프로필 사진을 선택해주세요. (.jpg 만 가능)</h4>
					  </div>
					  <div class="modal-body">
						<input type="file" accept=".jpg" name="profilePic">
						<input type="hidden" name="mbid" value="${loginUser.mb_id}" >
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
						<li><a href="#myWish" data-toggle="tab" id="myWi">위시 리스트</a></li>
						<li><a href="#myReview" data-toggle="tab" id="myRe">후기 리스트</a></li>
						<!-- <li onclick="getPlan()"><a href="#myPlanner" data-toggle="tab" id="myPl">MY PLANNER LIST</a></li> -->
						<li><a href="#myMessage" data-toggle="tab" id="myMe">메세지 리스트</a></li>
						<li><a href="/afk/updateView">정보 수정하기</a></li>
						<li><a href="/afk/msg">문의하기 작성</a></li>
					</ul>
				</div>
			</div>
			
			<div class="col-sm-8">
				<div class="tab-content">
					<div class="tab-pane active" id="myFavorite">
						<h2><span class="page-header">나의 즐겨찾기</span></h2><br>
						<!-- <div class="pull-right">
							 <a href="">최신순</a> &nbsp; &nbsp; &nbsp; <a href="">조회수순</a> &nbsp; &nbsp; &nbsp; 
							 <a href="">인기순</a> &nbsp; &nbsp; &nbsp; <a href="">별점순</a>
						</div> -->
						<br><br>

						<div id="myfaContent">
							<!-- 즐겨찾기 게시물 부분 -->
						</div>
						<p></p>

						<div style="text-align:center">
							<nav>
							  <ul class="pagination">
								<li>
								  <a href="#" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
								  </a>
								</li>
								<li class="active" onclick='window.location.href="myplan/write"'><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li>
								  <a href="#" aria-label="Next">
									<span aria-hidden="true">&raquo;</span>
								  </a>
								</li>
							  </ul>
							</nav>
						</div>
					</div>
					<div class="tab-pane" id="myWish">
						<h2><span class="page-header">나의 위시리스트</span></h2><br>
						<!-- <div class="pull-right"><a href="">최신순</a> &nbsp; &nbsp; &nbsp; <a href="">조회수순</a> &nbsp; &nbsp; &nbsp; 
							 <a href="">인기순</a> &nbsp; &nbsp; &nbsp; <a href="">별점순</a> &nbsp; &nbsp; &nbsp; <a href="">가격순</a>
						</div> -->
						<br><br>

					</div>
					<div class="tab-pane" id="myReview">
						<h2><span class="page-header">내가 작성한 후기</span></h2><br>
						<!-- <div class="pull-right"><a href="">최신순</a> &nbsp; &nbsp; &nbsp; <a href="">조회수순</a> &nbsp; &nbsp; &nbsp; 
							 <a href="">인기순</a> &nbsp; &nbsp; &nbsp; <a href="">별점순</a>
						</div> -->
						<br><br>

					</div>
					<div class="tab-pane" id="myPlanner">
						<h2><span class="page-header">나의 여행 플래너</span></h2><br><br>
						
						<div id="myPlanContent">
							<!-- 플래너 부분 -->
						</div>
						<!-- 저장된 여행계획 없을때 -->
						<!-- <center>
							<h3><span>아직 작성된 여행 계획이 없습니다.</span></h3><br><br>
							<button type="button" class="btn btn-default btn-lg" onclick="window.location.href='myplan/write'">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 여행 계획 작성하러 가기
							</button>
						</center> -->

						
						<!-- 여행계획 있을 때 -->
							<!-- <button type="button" class="btn btn-default btn-lg pull-right">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 여행 계획 작성하러 가기
							</button>
						<br><br><br><br>
						<div class="mycontent" style="cursor:pointer" data-toggle="modal" data-target="#myplan" > 
							
						</div> -->
					
						<!-- 디테일 모달 -->
						<div class="modal fade" id="myplan" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
						  <div class="modal-dialog">
							<div class="modal-content">
							  <div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
								<h4 class="modal-title" id="myModalLabel">제목</h4>
							  </div>
							  <div class="modal-body">
								내용
							  </div>
							  <div class="modal-footer">
								<button type="button" class="btn btn-primary">수정</button>
								<button type="button" class="btn btn-primary">삭제</button> &nbsp; &nbsp; &nbsp;
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							  </div>
							</div>
						  </div>
						</div>
						<!-- /디테일 모달 -->

					</div>		

					<div class="tab-pane" id="myMessage">
						<h2><span class="page-header">나의 메세지</span></h2><br>

						<div class="mymessage">
							<div class="sPicName">
								<div class="senderPic">
									<div class="thumbnail-wrapper">
										<div class="thumbnail">
											<div class="centered">
												<img src="resources/images/mypage/jo.jpg">
											</div>
										</div>
									</div>
								</div>
								<div class="senderName">
									보낸사람이름
								</div>
							</div>

							<div class="msgContent">
								<div class="panel panel-default">
									<div class="panel-body">Message Content Message Content Message Content Message Content Message Content Message Content Message Content</div>
									<div class="panel-footer sendtime">2016년 10월 22일 &nbsp; 23시 14분에 받음</div>
								</div>
							</div>

							<div class="btnMsgdel">
								<button type="button" class="btn btn-primary btn-lg" id="btnMsgDel">
									삭제하기
								</button>
							</div>
						<!-- </div class="mymessage"> -->
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