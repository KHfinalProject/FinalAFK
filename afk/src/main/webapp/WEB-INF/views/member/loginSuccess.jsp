<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language="JavaScript">
function nextWin()
{location = "/afk/pagemove"}
</script>
<style type="text/css">
.box1{
	margin:0 auto;
 	height:500px;
 	line-height: 100px;
} 
</style>
</head>
<body onLoad="setTimeout('nextWin()', 1000)">
<header>
<c:import url="../header.jsp"></c:import>
</header>
<div class="box1">
<br>
<center><h1>A.F.K에  회원가입을 성공했습니다.<img src="/afk/resources/images/logo.png" width="100" height="25" border="0" alt="brand"></h1></center>
<center><h1>즐거운 여행 되세요~!<h1></h1></center>
<center><h2>메인페이지로 자동 이동합니다.</h2></center>
</div><br><br><br>
<footer>
<c:import url="../footer.jsp"></c:import>
</footer>
</body>
</html>