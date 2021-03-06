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
		//일반 유저가 메세지 보내는 기능
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
		//가이드가 메세지 보내는 기능
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
					var str = "";
					var guidePicDIV ="";
					if(json.list.length != 0){
						for(var i in json.list){
							
							if(json.list[i].sid == loginId){
								$("#msglists").empty();
								str += "<div class='table-responsive'>"
									+"<table class='table'>"
									+"<tr><td style='word-break:break-all; color:blue'>"
									+"<input type='hidden' name='pno' value='" + json.list[i].mes_no + "'>" 
									+ decodeURIComponent(json.list[i].msgcontent.replace(Ca, " ")) + "</div></td>" 
									+"<td width='25%'>"
									+"<div class='thumbnail-wrapper'><div class='thumbnail'><div class='centered'>"
													 
									if("${loginUser.mb_rename_pic}" == null){
										str += "<img src='${pageContext.request.contextPath}/resources/images/mypage/jo.jpg'>"
									}else{
										str += "<img src='${pageContext.request.contextPath}/resources/images/mypage/${loginUser.mb_rename_pic}' style='width:100%;'>"
									}
									 
								str += "</div></div></div></td></tr>"
									+"<tr><td><small>" + json.list[i].sendDate + "에 보냄</small></td>" 
									+"<td>" + json.list[i].sid + "</td></tr></table></div>"
							}else{
								//$("#msglists").empty();
								str += "<div class='table-responsive'>"
										+"<table class='table'>"
										+"<tr><td width='25%'>"
										+"<input type='hidden' name='pno' value='" + json.list[i].mes_no + "'>"
										+"<div class='thumbnail-wrapper'><div class='thumbnail'><div class='centered'>"
										
										if(json.list[i].rpic == null){
											str += "<img src='${pageContext.request.contextPath}/resources/images/mypage/jo.jpg'>"
										}else{
											str += "<img src='${pageContext.request.contextPath}/resources/images/mypage/"+ json.list[i].rpic +"' style='width:100%;'>"
										}
										
								str += "</div></div></div></td>"
										+"<td style='word-break:break-all'>" + decodeURIComponent(json.list[i].msgcontent.replace(Ca, " ")) 
										+"</td></tr>"
										+"<tr><td>" + json.list[i].sid + "</td>"
										+"<td style='float:right'><small>"+ json.list[i].sendDate +"에 보냄<small></td></tr></table></div>"
							}
							$("#msglists").append(str);
							
							
						}
					}
					if(json.list[i].rpic == null){
						guidePicDIV += "<img src='${pageContext.request.contextPath}/resources/images/mypage/jo.jpg'>"
					}else{
						guidePicDIV += "<img src='${pageContext.request.contextPath}/resources/images/mypage/"+ json.list[i].rpic +"' style='width:100%;'>"
					}
					$("#guidePic").append(guidePicDIV);
				}
			},
			error:function(request,status,error){
		        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		});
	}
	
	function msglistGuide(){
		//가이드가 로그인한 경우, 메세지 디테일 보기
		var askId = "${askId}";
		//alert(askId);
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
					var str = "";
					var guidePicDIV ="";
					if(json.list.length != 0){
						for(var i in json.list){
							
							if(json.list[i].rid == guideId){
								$("#msglists").empty();
								str += "<div class='table-responsive'>"
										+"<table class='table'>"
										+"<tr><td style='word-break:break-all; color:blue'>"
										+"<input type='hidden' name='pno' value='" + json.list[i].mes_no + "'>" 
										+ decodeURIComponent(json.list[i].msgcontent.replace(Ca, " ")) + "</div></td>" 
										+"<td width='25%'>"
										+"<div class='thumbnail-wrapper'><div class='thumbnail'><div class='centered'>"
										
										if(json.list[i].spic == null){
											str += "<img src='${pageContext.request.contextPath}/resources/images/mypage/jo.jpg'>"
										}else{
											str += "<img src='${pageContext.request.contextPath}/resources/images/mypage/"+ json.list[i].spic +"' style='width:100%;'>"
										}
													 
								str += "</div></div></div></td></tr>"
										+"<tr><td><small>" + json.list[i].sendDate + "</small>에 보냄</td>" 
										+"<td>" + json.list[i].sid + "</td></tr></table></div>"
							}else{
								//$("#msglists").empty();
								str += "<div class='table-responsive'>"
										+"<table class='table'>"
										+"<tr><td width='25%'>"
										+"<input type='hidden' name='pno' value='" + json.list[i].mes_no + "'>"
										+"<div class='thumbnail-wrapper'><div class='thumbnail'><div class='centered'>"
										
										if(${loginUser.mb_rename_pic == null}){
											str += "<img src='${pageContext.request.contextPath}/resources/images/mypage/jo.jpg'>"
										}else{
											str += "<img src='${pageContext.request.contextPath}/resources/images/mypage/${loginUser.mb_rename_pic}' style='width:100%;'>"
										}
										
								str += "</div></div></div></td>"
										+"<td style='word-break:break-all'>" + decodeURIComponent(json.list[i].msgcontent.replace(Ca, " ")) 
										+"</td></tr>"
										+"<tr><td>" + json.list[i].sid + "</td>"
										+"<td style='float:right'><small>"+ json.list[i].sendDate +"에 보냄<small></td></tr></table></div>"
							}
							
							$("#msglists").append(str);
							if(${loginUser.mb_rename_pic == null}){
								guidePicDIV += "<img src='${pageContext.request.contextPath}/resources/images/mypage/jo.jpg'>"
							}else{
								guidePicDIV += "<img src='${pageContext.request.contextPath}/resources/images/mypage/${loginUser.mb_rename_pic}' style='width:100%;'>"
							}
							$("#guidePic").append(guidePicDIV);
						}
					}
				}
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
				//alert('3');
			}else if(grade == 2){
				msglistGuide();
				//alert('2');
			}
		});
	</script>
 </head>
 <body>
<jsp:include page="../header.jsp" flush="false"/>
	<div class="container">
		<div class="row" >
			<h2><span class="page-header">문의하기</span><small> &nbsp; 궁금한 점을 직접 물어보세요! </small></h2><br>
			<div class="col-sm-12" style="background-color:#faf4ff; border-radius:20px;">

				<div class="col-sm-8 col-sm-offset-2" style=" background-color: rgba( 255, 255, 255, 0.5 );">

					<br><br>
					<div class="msg-new" id="msgdiv">
					
						<c:if test="${loginUser.mb_grade == '3'}">
							<textarea class="form-control" rows="4" style="resize:none; display:inline-block;" name="msgcontent" id="msgarea" placeholder="여기에 문의하고 싶은 내용을 적어 보내세요."></textarea>
							<button type="button" class="btn btn-default" style="float:right" onclick="sendMsg()">보내기</button>
						</c:if>
						<c:if test="${loginUser.mb_grade == '2'}">
							<textarea class="form-control" rows="4" style="resize:none; display:inline-block;" name="msgcontent" id="msgarea" placeholder="문의에 대한 답변을 보내주세요."></textarea>
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
										<div class="centered" id ="guidePic">
											
										</div>
									</div>
								</div>
							</td>
							<td rowspan="2" style="word-break:break-all">
								궁금한 사항을 물어봐주세요!
							</td>
						</tr>
						<tr id="gIdtr">
							<c:if test="${loginUser.mb_grade == '3'} ">
							<td>${guideId}</td>
							</c:if>
							<c:if test="${loginUser.mb_grade == '2' }">
							<td>${gId}</td>
							</c:if>
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
<jsp:include page="../footer.jsp" flush="false"/>
 </body>
</html>