<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="kr">
<head>

<title>회원관리</title>

<script>
    function searchCheck(form){
        //검색
       
        if(frm.keyWord.value ==""){
            alert("검색 단어를 입력하세요.");
            frm.keyWord.focus();
            return;
        }
        form.submit();      
    }
</script>

<script>
    
</script>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
 
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

 <style type="text/css">
	.membertable {
		margin:0 auto;
		BORDER-TOP: 2px solid black;
		BORDER-BOTTOM: 2px solid black;
		background : white;

		width : 80%;
	}
	
	.membertable tr th{
		BORDER-BOTTOM: 1px solid #d9d9d9;
		padding : 10px;
		width : 10%;
	}
	.membertable tr th {
		text-align : center;
	}
	.membertable tr td {
		width: 20px nowrap;
	}
	.membertable tr td:nth-child(2n+1), .membertable tr th:nth-child(2n+1){
		background: #ebebeb;
	}

	#memberall {
		text-align: right;
	
	}

	#serach {
		border:1px solid #3333cc;
		background: #ebebeb;
	}
	
	div {
		/*border : 1px solid red;*/
	}
	
	#img {
		float : left;
	}

	#info {
		padding-left : 30px;
	}

	#info table{
		height : 200px;
	}

	#amount {
		margin-top : 30px;
		border-top : 1px solid #c1c1c1;
		margin-bottom : 40px;
		font-size : 18pt;
	}

	#buy_btn {
		width : 150px;
		height : 40px;
		color : white;
		font-size : 18pt;
		background-color : #04378c;
		-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	}

	#cancel_btn {
		width : 150px;
		height : 40px;
		font-size : 18pt;
		background-color : white;
		-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	}

	#btns {
		text-align : center;
	}

	#btns button:hover {
		background-color : #e64928;
		color : white;
	}
	
	/* body {margin:0; padding:0;} */

.navi {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

.navi li {
    float: left;
}

.navi li a, .dropbtn {
    display: inline-block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

.navi li a:hover, .dropdown:hover .dropbtn {
    background-color: red;
}

.navi li.dropdown {
    display: inline-block;
}

.dropdown-content {
    display: none;
    position: absolute;
    right: 2px;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

.navi .dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: center;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}
</style>
 	
</head>
<body>
<header>
<c:import url="../header.jsp"></c:import>
</header>

  <center><div class="container">
	<div class="jumbotron">
		<h1>회원 리스트</h1>
	</div><!--end of jumbotron--><br>
	</center>
	

<form action ="memberSearch" method="get">
<center>
<div id="search">
  회원 검색: <select name="memberId">
		<option value="0" selected> ---선택--- </option>
		<option value="id">아이디</option>
		<option value="name">이름 </option>
		<option value="grade">등급 </option>
 		</select>
 &nbsp; &nbsp;
	 <input type="text" name="keyword">
	


</div>
</center>

<br>

<center>

<input type="submit" value="검색" onclick="searchCheck(form)" class="btn btn-success" />
</center>
</form>
  <br>
  <br>
<br>


<script>
var code = "mb_id";
function load_select(cmd){
	var code = cmd;
	
 	$('.member table').each(function(){
		$('.member table:eq(0)').remove();
	})
		
	$.ajax({
		url : "/afk/memberMore",
		data : {code : code},
		type : "post",
		dataType : "json",
		success : function(data){
			console.log("success");
			var result = "";
			var old = $('.member').html();
		
		if(data.length > 0) {
			for(var i in data){
				result += "<table class='membertable'>";
				result += "<tr>";
				result += "<th>아이디</th>";
				result += "<th>이름</th>";
				result += "<th>이메일</th>";
				result += "<th>연락처</th>";
				result += "<th>회원등급</th>";
				result += "<th>가입일</th>";			
				result += "<th>계좌번호</th>";
				result += "<th>가이드현지연락처</th>";
				result += "<th>가이드현지주소</th>";
				result += "<th>옵션</th></tr>";
				
		
				result += "<tr>";
				result += "<td>";
				result += "<input value='" + data[i].memberId +"' size='5'></td>";
				result += "<td>" + data[i].memberName + "</td>";
				result += "<td>" + data[i].memberEmail + "</td>";
				result += "<td>" + data[i].memberPhone + "</td>";
				result += "<td align='center'>";
				result += "<select>";
				
				console.log(data[i].memberGrade);
				if(data[i].memberGrade == "1"){
				     result += "<option class='j' value='1' selected>관리자</option>";
				}else if(data[i].memberGrade = "2"){
					 result += "<option class='j' value='2' selected>가이드</option>";	
				}else{
					if(data[i].memberGrade = "3"){
						result += "<option class='j' value='3' selected>일반회원</option>";	
					}
				}
				result += "<option value='1'>관리자</option>";
				result += "<option value='2'>가이드</option>";
				result += "<option value='3'>일반회원</option>";
				result += "</select>";
				result += "<input class='btn btn btn-info' value='등급수정' submi'>";
				result += "</td>";
				result += "<td>" + data[i].memberJoinDate + "</td>";
				result += "<td>" + data[i].memberBank + "</td>";
				result += "<td>" + data[i].memberLocPhone + "</td>";
				result += "<td>" + data[i].memberAddress + "</td>";
				
				result += "<td>";
				result += "<a href='${md}' target='_self'>" +'삭제하기'+ "</a>";
				result += "</td></tr></form></table></div>";
				
				
				 
			}
			console.log("데이터 길이 : " + data.length);
			
			
		}else {
			result = "<h3>더이상 불러올 회원이 없습니다.<h3>";
			/* $('#more').remove(); */
		}
		$('.member').html(old + result);
		$('#afk').val(code);
		$('#afkk').val('1');
		}
});
	
}
	
$(function(){
	
	
	var count = Number($('#afk').val());

	$('#more').click(function(){
		
		
		count += 5;
		console.log("count :" + count);
		var code = $('#afkk').val();
		var keyword = $('#keyword').val();
	
	$.ajax({
		
		url : "/afk/memberMore",
		type : "post",
		data : {page : count , code : code, keyword : keyword},
		dataType : "json",
		success : function(data){
			console.log("success");
			var result = "";
			var old = $('.member').html();
			
			if(data.length > 0){
				for(var i in data){
					result += "<table class='membertable'>";
					result += "<tr>";
					result += "<th>아이디</th>";
					result += "<th>이름</th>";
					result += "<th>이메일</th>";
					result += "<th>연락처</th>";
					result += "<th>회원등급</th>";
					result += "<th>가입일</th>";			
					result += "<th>계좌번호</th>";
					result += "<th>가이드현지연락처</th>";
					result += "<th>가이드현지주소</th>";
					result += "<th>옵션</th></tr>";
					
			
					result += "<tr>";
					result += "<td>";
					result += "<input value='" + data[i].memberId +"' size='5'></td>";
					result += "<td>" + data[i].memberName + "</td>";
					result += "<td>" + data[i].memberEmail + "</td>";
					result += "<td>" + data[i].memberPhone + "</td>";
					result += "<td align='center'>";
					result += "<select name='grade' style='width:100px'>";
					
					console.log(data[i].memberGrade);
					if(data[i].memberGrade == "1"){
					     result += "<option class='j' value='1' selected>관리자</option>";
					}else if(data[i].memberGrade = "2"){
						 result += "<option class='j' value='2' selected>가이드</option>";	
					}else{
						if(data[i].memberGrade = "3"){
							result += "<option class='j' value='3' selected>일반회원</option>";	
						}
					}
					result += "<option value='1'>관리자</option>";
					result += "<option value='2'>가이드</option>";
					result += "<option value='3'>일반회원</option>";
					result += "</select>";
					result += "<input class='btn btn btn-info' value='등급수정' type='submit'>";
					result += "</td>";
					result += "<td>" + data[i].memberJoinDate + "</td>";
					result += "<td>" + data[i].memberBank + "</td>";
					result += "<td>" + data[i].memberLocPhone + "</td>";
					result += "<td>" + data[i].memberAddress + "</td>";
					
					result += "<td>";
					result += "<a href='${md}' target='_self'>" +'삭제하기'+ "</a>";
					result += "</td></tr></form></table></div>";
					
					
					 
				}
				console.log("데이터 길이 : " + data.length);
				/* $('.member').html(old + result); */
			}else{
				result = "<h3>더이상 불러올 회원이 없습니다.<h3>";
				/* $('#more').remove(); */
			}
			$('.member').html(old + result);
			
		}

	})
});
});

</script>

<div class="member">

<table class ="membertable"  cellspacing ="0">
<c:forEach var="m" items="${memberList}" varStatus="status">
  <tr>
		<th>아이디</th><th>이름</th><th>이메일</th><th>연락처</th><th>회원등급</th><th>가입일</th>
		<th>계좌번호</th><th>가이드현지연락처</th><th>가이드현지주소</th><th>옵션</th>
  </tr>
  <form action="admemberUpdate" method="get">
		<tr>
			<td>
			<input type="text" name="id" value="${m.memberId}" size="5">
			</td>
			<td>${m.memberName}</td>
			<td>${m.memberEmail}</td>
			<td>${m.memberPhone}</td>
			<td align="center">
				 <select name="grade" style="width:100px">
				 
			<option value="${m.memberGrade}" selected>
 				 <c:if test="${m.memberGrade eq 1}">관리자 </c:if>
				 <c:if test="${m.memberGrade eq 2}">가이드</c:if>
				 <c:if test="${m.memberGrade eq 3}">일반회원</c:if>
			</option>

  				 <option value="1">관리자</option>
				 <option value="2">가이드 </option>
				 <option value="3">일반회원</option>

			</select>
			<input class="btn btn btn-info" type="submit" value="등급수정">
		
			</td>
			<td>${m.memberJoinDate}</td>
			<td>${m.memberBank}</td>
			<td>${m.memberLocPhone}</td>
			<td>${m.memberAddress}</td>
			
			<c:url var="md" value="admemberDelete">
			<c:param name="memberId" value="${m.memberId}"/>
			</c:url>
				<td>
				<a href="${md}" target="_self">삭제하기</a>
				</td>
		</tr>
	</form>
				</c:forEach>
	</table>

</div>
<br>



<div id="button">,
<form action="">
<input type="submit" class="btn btn-primary" value="메인으로">
</form>

<form action="memberListView" method="get">
<input type="submit" class="btn btn-primary" value="회원전체조회">
</form>

</div>

<div class="but">
	<button id="more">더보기</button>
</div>

<br>
<input id="afk" type="hidden" />
<input id="afkk" type="hidden" />
<input id="keyword" type="hidden" />

</body>
</html>