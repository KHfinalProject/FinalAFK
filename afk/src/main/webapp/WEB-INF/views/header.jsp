<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<style>
body { margin: 0; }
.zeta-menu-bar {
  background: hotpink;
  display: inline-block;
  width: 100%;
}
.zeta-menu { margin: 0; padding: 0; }
.zeta-menu li {
  float: left;
  list-style:none;
  position: relative;
}
.zeta-menu li:hover:not(.head) { background: white; }
.zeta-menu li:hover>a { color: hotpink; }
.zeta-menu a {
  color: white;
  display: block;
  padding: 10px 20px;
  text-decoration: none;
}
.zeta-menu ul {
  background: #eee;
  border: 1px solid silver;
  display: none;
  padding: 0;
  position: absolute;
  left: 0;
  top: 100%;
  width: 180px;
  z-index: 1;
}
.head{
	position: relative;
	left: 32%;
	top: 2px;
}
.search{
	outline: none;
	background:  hotpink;
	box-sizing: border-box;
	border: none;
	border-bottom: white 2px solid;
	color: white;
	font-size: 16px;
}
li.head label{
	color: white;
}
.searchForm{
	margin: 0;
}
.zeta-menu ul li { float: none; }
.zeta-menu ul li:hover { background: #ddd; }
.zeta-menu ul li:hover a { color: black; }
.zeta-menu ul a { color: black; }
.zeta-menu ul ul { left: 100%; top: 0; }
.zeta-menu ul ul li {float:left; margin-right:10px;}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(function(){
  $(".zeta-menu li").hover(function(){
    $('ul:first',this).show();
  }, function(){
    $('ul:first',this).hide();
  });
  $(".zeta-menu>li:has(ul)>a").each( function() {
    $(this).html( $(this).html()+' &or;' );
  });
  $(".zeta-menu ul li:has(ul)")
    .find("a:first")
    .append("<p style='float:right;margin:-3px'>&#9656;</p>");
});
</script>
</head>
<body>

<div class='zeta-menu-bar'>
  <ul class="zeta-menu">
    <li><a href="#">홈</a></li>

  <form class="searchForm">
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
		<ul>
		  <li><a href="/afk/mypage">마이페이지</a></li>
          <li><a href="customer?currentPage=1&nextBlock=">고객센터</a></li>
	  <c:if test="${loginUser.mb_grade eq '1'}"></li>
          <li><a href="memberListView">관리자 회원관리</a></li>
          <li><a href="matching">관리자(매칭관리)</a></li>
      </c:if>
		  <li><a href="logout">로그아웃</a></li>
		</ul>
	  </li>
  </c:if>
</ul>
</div>
</body>
</html>