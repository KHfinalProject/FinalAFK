<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<style type="text/css">
body {margin:0; padding:0;}

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
    background-color: #f9f9f9;
    min-width: 160px;
	margin: 0 20px;
	right: 5px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index:10;
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
.head{
	position: relative;
	top: 10px;
	left: 32%
}
.search{
	outline: none;
	background:  #333;
	box-sizing: border-box;
	border: none;
	border-bottom: white 2px solid;
	color: white;
	font-size: 16px;
	transition: border 2s;
}
li.head label{
	color: white;
}
</style>
</head>
<body>

<ul class="navi">
  <li><a href="#home">로고</a></li>
	
  <form>
	<li class="head">
	<label for="chk1"><input type="radio" id="chk1" value="1" name="board" checked>정보</label>
	<label for="chk2"><input type="radio" id="chk2" value="2" name="board">가이드</label>
	<input type="text" size="20" class="search">
	<img src="/afk/resources/images/search.png" width="24" height="24" border="0" alt="">
	</li>
  </form>	

	<c:if test="${loginUser eq null}">
        <li style="float: right;"><a href="/afk/joinInsertView">회원가입</a></li>
    	<li style="float: right;"><a href="/afk/loginView">로그인</a></li>
	</c:if>
  <c:if test="${!(loginUser eq null)}">
	  <li style="float: right;"class="dropdown">
		<a href="#" class="dropbtn"><b>${loginUser.mb_id }</b>님 환영합니다.</a>
		<div class="dropdown-content">
		  <a href="/afk/mypage">마이페이지</a>
          <a href="customer?currentPage=1&nextBlock=">고객센터</a>
	  <c:if test="${loginUser.mb_grade eq '1'}">
          <a href="memberListView">관리자 회원관리</a>
          <a href="matching">관리자(매칭관리)</a>
      </c:if>
		  <a href="logout">로그아웃</a>
		</div>
	  </li>
  </c:if>
</ul>
</body>
</html>