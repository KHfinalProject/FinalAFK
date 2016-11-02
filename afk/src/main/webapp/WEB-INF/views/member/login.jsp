<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
<script src="/afk/resources/js/request.js"></script>
<script src="/afk/resources/js/index.js"></script>
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
</style>

</head>
<body>
<div>
   <article class="container">
	<div class="page-header">
    	    <h1 class="h1">로그인 <small><img src="/afk/resources/images/logo.png" width="100" height="25" border="0" alt="brand"></small></h1>
    </div>
	<form class="form-horizontal" action="mlogin" method="POST" name="loginform">
	<div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">아이디</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="text" placeholder="아이디를 입력하세요" name="mb_id">
			<p class="help-block"></p>
          </div>
        </div>
	<div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">비밀번호</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="password" placeholder="비밀번호를 입력하세요" name="mb_pwd">
			<p class="help-block"></p>
          </div>
        </div>
		<div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="submit">로 그 인<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-danger" type="button" onclick="location.href='/afk/joinInsertView'">회원가입<i class="fa fa-check spaceLeft"></i></button>
          </div>
        </div>
	<div class="form-group">
          <div class="col-sm-12 text-center">
			<a href="/afk/idSearch" class="forgat-id">아이디찾기</a>/<a href= "/afk/pwSearch" class="forgat-password">비밀번호 찾기</a>
          </div>
        </div>
	</form>
   </article>
   </div>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/afk/resources/js/bootstrap.min.js"></script>
 </body>

