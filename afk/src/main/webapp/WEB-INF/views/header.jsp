<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- 셀렉트박스를 위한 부트스트랩 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">

<!-- 셀렉트 박스를 위한 부트스트랩 JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">

</style>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
     <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
      </button>
      <a class="navbar-brand" href="#">
        <img src="/afk/resources/images/logo.png" width="100" height="25" border="0" alt="brand">
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav navbar-right">
      <c:if test="${loginUser eq null}">
         <li><a href="/afk/loginView"><span class="glyphicon glyphicon-log-in" aria-hidden="true"> 로그인</span></a></li>
         <li><a href="/afk/joinInsertView">회원가입</a></li>
      </c:if>
      <c:if test="${!(loginUser eq null)}">
        <li><a href="#"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
      </a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><b>${loginUser.mb_id}</b>님<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="/afk/mypage">마이페이지</a></li>
            <li><a href="customer?currentPage=1&nextBlock=">고객센터</a></li>
           
         <c:if test="${loginUser.mb_grade eq '1'}">
            <li><a href="memberListView">관리자 회원관리</a></l1>
            <li><a href="matching">관리자(매칭관리)</a></li>
            </c:if>
            
            <li class="divider"></li>
            <li><a href="logout">로그아웃</a></li>
     </c:if>
          </ul>
        </li>
      </ul>
     <center>
     <form class="navbar-form" role="search">
        <div class="form-group">
        <input type="radio" name="select" value="1">정보
        <input type="radio" name="select" value="2">가이드
          <input type="text" class="form-control custom"
          style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"placeholder="Search" size="30">
        </div>
        <a href="#"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>
      </form>
     </center>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
</body>
</html>