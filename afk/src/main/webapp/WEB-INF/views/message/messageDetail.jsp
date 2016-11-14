<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		//메세지 보내는 기능
		var senderId = "${loginUser.mb_id}";
		var grade = "${loginUser.mb_grade}";
		var recieveId = "${guideId}"; //문의하기 버튼 주인 넣기
		
		var msgContent = $('#msgarea').val();
		var sencond = $('#msglists div').length;
		if(sencond == 0){
			var parentno = 0;
		}else{
			var parentno = $('#msglists div:first table:first tr:first td:first input').val();
		}
		//alert(parentno);
		$.ajax({
			url: "msg/sendmsg",
			data : { sendid : senderId, msgcontent : msgContent, recieveid : recieveId, parentno : parentno },
			type : "post",
			dataType : "json",
			success : function(data){
				if(data != null){
					$("#msgarea").val('');
					$("#msglists").empty();
					msglist();
				}
			}		
		});
	}
	
	function sendMsgG(){
		//메세지 보내는 기능
		var senderId = "${loginUser.mb_id}";
		var grade = "${loginUser.mb_grade}";
		var recieveId = "${askId}";
		
		var msgContent = $('#msgarea').val();
		var sencond = $('#msglists div').length;
		if(sencond == 0){
			var parentno = 0;
		}else{
			var parentno = $('#msglists div:first table:first tr:first td:first input').val();
		}
		//alert(parentno);
		$.ajax({
			url: "sendmsgG",
			data : { sendid : senderId, msgcontent : msgContent, recieveid : recieveId, parentno : parentno },
			type : "post",
			dataType : "json",
			success : function(data){
				if(data != null){
					$("#msgarea").val('');
					$("#msglists").empty();
					msglistGuide();
				}
			}		
		});
	}
	function msglist(){
		//메세지 디테일 보기
		var loginId = "${loginUser.mb_id}";
		var guideId = "${guideId}";
		var URL = "msg/msgdetailList";
		$.ajax({
			url : URL,
			data : { loginId : loginId, guideId : guideId},
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
						for(var i in json.list){
							
							if(json.list[i].sid == loginId){
								$("#msglists").append("<div class='table-responsive'>"
													 +"<table class='table'>"
													 +"<tr><td style='word-break:break-all; color:blue'>"
													 +"<input type='hidden' name='pno' value='" + json.list[i].mes_no + "'>" 
													 + decodeURIComponent(json.list[i].msgcontent.replace(Ca, " ")) + "</div></td>" 
													 +"<td width='25%'>"
													 +"<div class='thumbnail-wrapper'><div class='thumbnail'><div class='centered'><img src='img/p.jpg'></div></div></div></td></tr>"
													 +"<tr><td>" + json.list[i].rid + "에게  <samll>" + json.list[i].sendDate + "</small> 보냄</td>" 
													 +"<td>" + json.list[i].sid + "</td></tr></table></div>");
							}
							else{
								$("#msglists").append("<div class='table-responsive'>"
													 +"<table class='table'>"
													 +"<tr><td width='25%'>"
													 +"<input type='hidden' name='pno' value='" + json.list[i].mes_no + "'>"
													 +"<div class='thumbnail-wrapper'><div class='thumbnail'><div class='centered'><img src='img/h.jpg'>"
													 +"</div></div></div></td>"
													 +"<td style='word-break:break-all'>" + decodeURIComponent(json.list[i].msgcontent.replace(Ca, " ")) 
													 +"</td></tr>"
													 +"<tr><td>" + json.list[i].sid + "</td>"
													 +"<td style='float:right'><small>view date<small></td></tr></table></div>");
							}
						}
					}
				}
				/* var first = $('#msglists').find('div.table-responsive').length;
				alert(first); */
				/* var first = $('#msglists div:first table:first tr:first td:first input').val();
				alert(first); */
				/* var sencond = $('#msglists div').length;
				alert(sencond); */
			},
			error:function(request,status,error){
		        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		});
	}
	
	function msglistGuide(){
		//가이드가 로그인한 경우, 메세지 디테일 보기
		var askId = "${askId}";
		alert(askId);
		var guideId = "${loginUser.mb_id}";
		var URL = "msgdetailListGuide";
		$.ajax({
			url : URL,
			data : { askId : askId, gId : guideId},
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
						for(var i in json.list){
							
							if(json.list[i].rid == guideId){
								$("#msglists").append("<div class='table-responsive'>"
													 +"<table class='table'>"
													 +"<tr><td style='word-break:break-all; color:blue'>"
													 +"<input type='hidden' name='pno' value='" + json.list[i].mes_no + "'>" 
													 + decodeURIComponent(json.list[i].msgcontent.replace(Ca, " ")) + "</div></td>" 
													 +"<td width='25%'>"
													 +"<div class='thumbnail-wrapper'><div class='thumbnail'><div class='centered'><img src='img/p.jpg'></div></div></div></td></tr>"
													 +"<tr><td>" + json.list[i].rid + "에게  <samll>" + json.list[i].sendDate + "</small> 보냄</td>" 
													 +"<td>" + json.list[i].sid + "</td></tr></table></div>");
							}
							else if(json.list[i].rid == askId){
								$("#msglists").append("<div class='table-responsive'>"
													 +"<table class='table'>"
													 +"<tr><td width='25%'>"
													 +"<input type='hidden' name='pno' value='" + json.list[i].mes_no + "'>"
													 +"<div class='thumbnail-wrapper'><div class='thumbnail'><div class='centered'><img src='img/h.jpg'>"
													 +"</div></div></div></td>"
													 +"<td style='word-break:break-all'>" + decodeURIComponent(json.list[i].msgcontent.replace(Ca, " ")) 
													 +"</td></tr>"
													 +"<tr><td>" + json.list[i].sid + "</td>"
													 +"<td style='float:right'><small>view date<small></td></tr></table></div>");
							}
						}
					}
				}
				/* var first = $('#msglists').find('div.table-responsive').length;
				alert(first); */
				/* var first = $('#msglists div:first table:first tr:first td:first input').val();
				alert(first); */
				/* var sencond = $('#msglists div').length;
				alert(sencond); */
			},
			error:function(request,status,error){
		        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		});
	}
	
		$(function(){
			var grade = '${loginUser.mb_grade}';
			if(grade == 3){
				msglist();
				alert('3');
			}else if(grade == 2){
				msglistGuide();
				alert('2');
			}
		});
	</script>
 </head>
 <body>
<jsp:include page="../header.jsp" flush="true"/>
	<div class="container">
		<div class="row" >
			<h2><span class="page-header">문의하기</span><small> &nbsp; 궁금한 점을 직접 물어보세요! </small></h2><br>
			<div class="col-sm-12" style="background-color:#faf4ff; border-radius:20px;">

				<div class="col-sm-8 col-sm-offset-2" style=" background-color: rgba( 255, 255, 255, 0.5 );">

					<br><br>
					<div class="msg-new" id="msgdiv">
					
						<textarea class="form-control" rows="4" style="resize:none; display:inline-block;" name="msgcontent" id="msgarea" placeholder="여기에 문의하고 싶은 내용을 적어 보내세요."></textarea>
						<c:if test="${loginUser.mb_grade == '3'}">
							<button type="button" class="btn btn-default" style="float:right" onclick="sendMsg()">보내기</button>
						</c:if>
						<c:if test="${loginUser.mb_grade == '2'}">
							<button type="button" class="btn btn-default" style="float:right" onclick="sendMsgG()">보내기</button>
						</c:if>
					
					</div>
					<br><br><br><br>
					<!-- 주고받은 메세지들 -->
						<div id="msglists">			
						</div>
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
							<td>${guideId}</td>
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