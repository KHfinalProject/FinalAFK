<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="UTF-8">
  <title>회원 - 가이드 매칭</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
 
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
	.admin_matching {
		margin:0 auto;
		BORDER-TOP: 2px solid black;
		BORDER-BOTTOM: 2px solid black;
		background : white;

		width : 80%;
	}
	
	.admin_matching tr th, .faq tr td{
		BORDER-BOTTOM: 1px solid #d9d9d9;
		padding : 10px;
	}
	.admin_matching tr th {
		text-align : center;
	}
	.admin_matching tr td:nth-child(2n+1), .admin_matching tr th:nth-child(2n+1){
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
		<h2>회원 - 가이드 매칭정보</h2>
	</div><!--end of jumbotron--><br>
	</center>

 <div id="matching">
 <table class="admin_matching" cellspacing="0">
	<tr>
		<th>매칭번호</th><th>가이드정보</th><th>여행지정보</th><th>회원정보</th>

	</tr>

		<tr>
			<td align="center">
				1
			</td>
			<td align="center"><img src="sana.jpg" width="200px" height="200px"><br>
				가이드 이름 : 샤샤샤<br>
			</td>
			<td>여행지 상품명: 유럽일주!<br>
				여행 기간 : 2016 11.18 ~ 2017 11.18<br>
				상품 가격 : 25억원<br>
			</td>
			<td>
				회원아이디 : admin<br>
				회원이름 : 홍길동<br>
				회원 연락처 : 010-1234-5678
			</td>

		</tr>
</table>

</body>
</html>