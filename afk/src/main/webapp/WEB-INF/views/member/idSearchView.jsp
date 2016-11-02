<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<script src="/afk/resources/js/request.js"></script>
<script src="/afk/resources/js/join.js"></script>
<script src="/afk/resources/js/jquery-3.1.0.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- Bootstrap -->
   <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->

    <!-- font awesome -->
    <link rel="stylesheet" href="/afk/resources/css/font-awesome.min.css" media="screen" title="no title" charset="utf-8">
    <!-- Custom style -->
    <link rel="stylesheet" href="/afk/resources/css/style.css" media="screen" title="no title" charset="utf-8">
<style type="text/css">
	.container{
		width:600px;
	}
	.h1{
		text-align:center;
	}
	.container{
		border: solid; 
		border-color: #ccc;
		box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	}
	.p1{
	   width:100%;
	   height:15px;	
	}
	p{
	 font-size: 20px;
	 font-family:"굴림";
	}
</style>

</head>
<body>
<div>
   <article class="container">
	<div class="page-header">
    	    <h1 class="h1">아이디 찾기  <small><img src="/afk/resources/images/logo.png" width="100" height="25" border="0" alt="brand"></small></h1>
    </div>
	<form class="form-horizontal" action="idseaching" method="GET" name="idsearch" onsubmit="return idchecking()">
	<div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">이름</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="text" placeholder="이름을입력하세요" name="mb_name">
			<p class="help-block"></p>
          </div>
        </div>
	<div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">이메일</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="email" placeholder="이메일을 입력하세요" name="mb_email">
			<p class="help-block"></p>
          </div>
        </div>
		<div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="submit">확인<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-danger" type="button" onclick="location.href='/afk/'">취소<i class="fa fa-check spaceLeft"></i></button>
            <p class="p1" name="confirm"></p>
          </div>
        </div>
	<!-- <div class="form-group">
          <div class="col-sm-12 text-center">
			<a href=# class="forgat-id">아이디찾기</a>/<a href= # class="forgat-password">비밀번호 찾기</a>
          </div>
        </div> -->
	</form>
	<c:if test="${result == null}">
		<center><p>가입하신 정보를 정확하게 입력해 주세요.</p></center>
	</c:if>
	<c:if test="${result == 0}">
		<center><p>해당정보로는 가입하신 아이디를 찾을 수 없습니다. 다시 확인해주세요.</p></center>
	</c:if>
	<c:if test="${result == 1}">
		<center><p>가입하신 아이디는 <span style="color:blue;">${temp.mb_id}</span> 입니다.</p></center>
	</c:if>
   </article>
   </div>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/afk/resources/js/bootstrap.min.js"></script>
 </body>

