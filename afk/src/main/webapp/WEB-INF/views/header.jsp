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
<ul class="navi">
  <li><a href="#home">로고</a></li>
  
  <c:if test="${loginUser eq null}">
	  <li style="float:right"><a href="/afk/joinInsertView">회원가입</a></li>
	  <li style="float:right"><a href="/afk/loginView">로그인</a></li> 
  </c:if>
  
  <c:if test="${!(loginUser eq null)}">
  <li style="float: right;"class="dropdown">
    <a href="#" class="dropbtn">${loginUser.mb_id}&nbsp;&nbsp;&nbsp;</a>
    <div class="dropdown-content">
      <a href="/afk/mypage">마이페이지</a>
      <a href="customer">고객센터</a>
     <c:if test="${loginUser.mb_grade eq '1'}">
      <a href="memberListView">관리자회원관리</a>
     </c:if>
	  <a href="logout">로그아웃</a>
    </div>
  </li>
  </c:if>
</ul>
</body>
</html>