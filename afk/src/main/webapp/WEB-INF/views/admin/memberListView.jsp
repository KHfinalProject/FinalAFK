<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="kr">
<head>

<title>회원관리</title>

<script>
    function searchCheck(frm){
        //검색
       
        if(frm.keyWord.value ==""){
            alert("검색 단어를 입력하세요.");
            frm.keyWord.focus();
            return;
        }
        frm.submit();      
    }
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
	.member {
		margin:0 auto;
		BORDER-TOP: 2px solid black;
		BORDER-BOTTOM: 2px solid black;
		background : white;

		width : 80%;
	}
	
	.member tr th{
		BORDER-BOTTOM: 1px solid #d9d9d9;
		padding : 10px;
	}
	.member tr th {
		text-align : center;
	}
	.member tr td {
		width: 20px nowrap
	}
	.member tr td:nth-child(2n+1), .member tr th:nth-child(2n+1){
		background: #ebebeb;
	}

	#memberall {
		text-align: right;
	
	}

	#serach {
		border:1px solid #3333cc;
		background: #ebebeb;
	}

 </style>
 	
</head>
<body>

	<!-- 헤더부분 -->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
	  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">
        <img src="/afk/resources/images/logo.png" width="100" height="25" border="0" alt="brand">
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
      <!-- <c:if test="${loginUser eq null}"> -->
      	<li><a href="#"><span class="glyphicon glyphicon-log-in" aria-hidden="true"> 로그인</span></a></li>
      	<li><a href="#">회원가입</a></li>
     <!--  </c:if> -->
     <!--  <c:if test="${!(loginUser eq null)}"> -->
        <li><a href="#"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
		</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><!--${loginUser.mb_id}--><span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">마이페이지</a></li>
            <li><a href="#">마이플래너</a></li>
            <li><a href="#">공지사항</a></li>
            <li class="divider"></li>
            <li><a href="#">로그아웃</a></li>
     <!--  </c:if> -->
          </ul>
        </li>
      </ul>
	  <center>
	  <form class="navbar-form" role="search">
        <div class="form-group">
        <select class="selectpicker" data-width="130px">
        	<option>정보게시글</option>
        	<option>가이드게시글</option>
        </select>
          <input type="text" class="form-control" placeholder="Search" size="30">
        </div>
        <button type="submit" class="btn btn-default">검색</button>
      </form>
	  </center>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<!-- 헤더 끝 -->

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

<input type="button" value="검색" onclick="searchCheck(form)" />
</center>
</form>
  <br>
  <br>
<c:forEach var="m" items="${memberList}" varStatus="status">  
<div id="memberall">
  총 회원수: ${status.index}명이 회원으로 등록되어 있습니다.
</div>
</c:forEach>
<br>

<div id = "member">



<table class ="member"  cellspacing ="0">
<c:forEach var="m" items="${memberList}" varStatus="status">
  <tr>
		<th>아이디</th><th>이름</th><th>이메일</th><th>연락처</th><th>회원등급</th><th>가입일</th>
		<th>가이드계좌번호</th><th>가이드현지연락처</th><th>가이드현지주소</th><th>옵션</th>
  </tr>
  <form action="admemberUpdate" method="get">
		<tr>
			<td><input type="text" name="id" value="${m.memberId}" size="5"></td>
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
				<td><a href="${md}" target="_self">삭제하기</a></td>
			<!-- <td><input class="btn btn btn-info" type="submit" value="삭제"></td> -->
		</tr>
	</form>
				</c:forEach>
	</table>

<!-- </form> -->
</div>
<br>
<center>
<form action="/">
<input type="submit" value="메인으로">
</form>

<form action="memberListView" method="get">
<input type="submit" value="회원전체조회">
</form>
</center>
<br>
</body>
</html>