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
<body onLoad="setTimeout('nextWin()', 2000)">
<header>
<c:import url="../header.jsp"></c:import>
</header>
<div class="box1">
<center><h1>로그인이 실패하였습니다.아이디와 패스워드를 확인후 다시 시도해주세요!</h1></center>
<center><h2>로그인이 실패하였습니다.아이디와 패스워드를 확인후 다시 시도해주세요!</h2></center>
</div>  
<footer>
<c:import url="../footer.jsp"></c:import>
</footer>
</body>
</html>