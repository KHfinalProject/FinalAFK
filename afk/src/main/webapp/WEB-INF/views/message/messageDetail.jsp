<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mooni Detail</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

	<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

	<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<style type="text/css">
		.msg-default{
/*			border : 1px solid red;*/
			height: 120px;
		}

		.msg-content{
			width: 80%;
		}

		.rName{
			width:100%;
			font-size: medium;
			text-align: center;
		}

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
	</style>
	<script>
	function sendMsg(){
		//alert("sendMsg");
		var senderId = "${loginUser.mb_id}";
		var recieveId = "user02";
		var msgContent = $("#msgarea").val();
		$.ajax({
			url: "msg/sendmsg",
			data : { sendid : senderId, msgcontent : msgContent, recieveid : recieveId },
			type : "post",
			dataType : "json",
			success : function(data){
				if(data != null){
					$("#msgarea").val('');
					msglist();
				}
			}		
		});
	}
	
	function msglist(){
		var loginId = "${loginUser.mb_id}";
		
		$.ajax({
			url : "msg/msglist",
			data : { loginId : loginId},
			type: "post",
			dataType : "json",
			success : function(data){
				//alert("list");
				
			}
		});
	}
	
		$(function(){
			msglist();
		});
	</script>
 </head>
 <body>
  header
  <hr>
	<div class="container">
		<div class="row" >
			<h2><span class="page-header">문의하기</span><small> &nbsp; 궁금한 점을 직접 물어보세요! </small></h2><br>
				
			<div class="col-sm-12" style="background-color:#faf4ff; border-radius:20px;">

				<div class="col-sm-8 col-sm-offset-2" style=" background-color: rgba( 255, 255, 255, 0.5 );">

					<br><br>
					<div class="msg-new">
					
						<textarea class="form-control" rows="4" style="resize:none; display:inline-block;" name="msgcontent" id="msgarea" placeholder="여기에 문의하고 싶은 내용을 적어 보내세요."></textarea>
						<%-- <input type="hidden" name="sender" value="${loginUser.mb_id}"> --%>
						<!--  -->
						<button type="button" class="btn btn-default" style="float:right" onclick="sendMsg()">보내기</button>
					
					</div>
					<br><br><br><br>
					<!-- 주고받은 메세지들 -->

							<%-- <div class="table-responsive">
							<table class="table">
							<tr>
								<td width="25%">
									<div class="thumbnail-wrapper">
										<div class="thumbnail">
											<div class="centered">
												<img src="img/h.jpg">
											</div>
										</div>
									</div>
								</td>
								<td style="word-break:break-all">
									안녕하세요. 문의해주셔서 감사합니다. 이러쿵저러쿵
								</td>
							</tr>
							<tr>
								<td>문의 당하는 사람</td>
								<td style="float:right"><small>2016년 10월 25일 22시 30분에 받음<small></td>
							</tr>
							</table>
							</div>
							<br><br>

	 						<!-- 문의 내용 --> 
							<div class="table-responsive">
							<table class="table">
							<tr>
								<td style="word-break:break-all; color:blue">궁금해요 이것저것 궁금궁금궁금</div></td>
								<td width="25%">
									<div class="thumbnail-wrapper">
										<div class="thumbnail">
											<div class="centered">
												<img src="img/p.jpg">
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td><small>2016년 10월 25일 22시 20분에 보냄 &nbsp; &nbsp; &nbsp; 읽음</small></td>
								<td>${loginUser.mb_id}</td>
							</tr>
							</table>
							</div> --%>
					<!-- 주고받은 메세지 끝 -->
					
							<br><br>	

							<!-- 기본 문의 div -->
							<div class="table-responsive">
							<table class="table">
							<tr>
								<td width="25%">
									<div class="thumbnail-wrapper">
										<div class="thumbnail">
											<div class="centered">
												<img src="img/jo.jpg">
											</div>
										</div>
									</div>
								</td>
								<td rowspan="2" style="word-break:break-all">
									궁금한 사항을 물어봐주세요!
								</td>
							</tr>
							<tr>
								<td>문의 당하는 사람</td>
							</tr>
							</table>
							</div>

					<br>
				
				</div>

			<!-- </div class="col-sm-12"> -->
			</div>

		<!-- </div class="row"> -->
		</div>
	<!-- <div class="container"> -->
	</div>
  <hr>
  footer
 </body>
</html>