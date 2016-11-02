<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script src="/afk/resources/js/request.js"></script>
<script src="/afk/resources/js/mupdate.js"></script>
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

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<style type="text/css">
	.container{
		width:700px;
	}
	.h1{
		text-align:center;
	}

</style>
</head>
<body>
<c:set value ="${temp.mb_grade}" var ="grade"/>
${grade }
<%-- ${grade eq "B"} --%>${temp.mb_grade}
				    	
<c:if test="${grade eq 'C'.charAt(0)}">
 <article class="container">


        <div class="col-md-12">
        <div class="page-header">
    	    <h1 class="h1">회원정보수정 <small> <img src="/afk/resources/images/logo.png" width="100" height="25" border="0" alt="brand"></small></h1>
        </div>
        <form class="form-horizontal" action="joinUpdate" method="POST" name="updateform" onsubmit="return checking()">
		<div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">아이디</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="text" placeholder="아이디를 입력하세요" name="mb_id" onkeyup="idCheck()" autocomplete="off" readonly value="${temp.mb_id}">
            <input style="border:none;  width:300px; " type="text" name="chekId" readonly id="chekId" class="a1" >
          </div>
         </div>
        	 
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword" >비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputPassword" type="password" placeholder="비밀번호"name="mb_pwd" onkeyup="pwdCheck()"value="${temp.mb_pwd}">
            <input style="border:none; width:300px; " type="text" name="chekPwd" readonly id="chekPwd"  >
        </div>
        </div>
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
             <div class="col-sm-6">
              <input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인" name="mb_pwd1" onkeyup="pwdCheck1()">
              <input style="border:none; width:300px; " type="text" name="chekPwd1" id="chekPwd1" readonly id="chekPwd1"  >
             </div>
          </div>
       	<div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">이름</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="text" placeholder="이름" name="mb_name" readonly value="${temp.mb_name }">
			   <p class="help-block"></p>
          </div>
        </div> 
		  <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">이메일</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputEmail" type="email" placeholder="이메일"  name="mb_email" value="${temp.mb_email}">
		     <p class="help-block"></p>
        </div>
        </div>
        <div class="form-group">
         <label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
            <div class="col-sm-6">
                
                  <input type="number" class="form-control" id="inputNumber" placeholder="- 없이 입력해 주세요" name="mb_phone" value="${temp.mb_phone}">
                    <p class="help-block"></p>
                </div>
              </div>
       
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="button"  onclick="updateCheck()">수정하기<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-danger" type="button" onclick="realDelete()">회원탈퇴<i class="fa fa-times spaceLeft"></i></button>
          </div>
        </div>
        </form>
          <hr>
        </div>
      </article>
    </c:if> 
<c:if test="${grade eq 'B'.charAt(0)}">
 <article class="container">


        <div class="col-md-12">
        <div class="page-header">
    	    <h1 class="h1">회원정보수정 <small> <img src="/afk/resources/images/logo.png" width="100" height="25" border="0" alt="brand"></small></h1>
        </div>
        <form class="form-horizontal" action="joinUpdate" method="POST" name="updateform" onsubmit="return checking()">
		<div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">아이디</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="text" placeholder="아이디를 입력하세요" name="mb_id" onkeyup="idCheck()" autocomplete="off" readonly value="${temp.mb_id}">
            <input style="border:none;  width:300px; " type="text" name="chekId" readonly id="chekId" class="a1" >
          </div>
         </div>
        	 
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword" >비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputPassword" type="password" placeholder="비밀번호"name="mb_pwd" onkeyup="pwdCheck()"value="${temp.mb_pwd}">
            <input style="border:none; width:300px; " type="text" name="chekPwd" readonly id="chekPwd"  >
        </div>
        </div>
          <div class="form-group">
              <label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호 확인</label>
             <div class="col-sm-6">
              <input class="form-control" id="inputPasswordCheck" type="password" placeholder="비밀번호 확인" name="mb_pwd1" onkeyup="pwdCheck1()">
              <input style="border:none; width:300px; " type="text" name="chekPwd1" id="chekPwd1" readonly id="chekPwd1"  >
             </div>
          </div>
       	<div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">이름</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="text" placeholder="이름" name="mb_name" readonly value="${temp.mb_name }">
			   <p class="help-block"></p>
          </div>
        </div> 
		  <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">이메일</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputEmail" type="email" placeholder="이메일"  name="mb_email" value="${temp.mb_email}">
		     <p class="help-block"></p>
        </div>
        </div>
        <div class="form-group">
         <label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
            <div class="col-sm-6">
                
                  <input type="number" class="form-control" id="inputNumber" placeholder="- 없이 입력해 주세요" name="mb_phone" value="${temp.mb_phone}">
               
                    <p class="help-block"></p>
            </div>
        </div>
       
           <div class="form-group">
         <label class="col-sm-3 control-label" for="inputBank">계좌번호</label>
            <div class="col-sm-6">
                
                  <input type="number" class="form-control" id="inputNumber" placeholder="- 없이 입력해 주세요" name="mb_bank" value="${temp.mb_bank}">
                    <p class="help-block"></p>
            </div>
           </div>
           
              <div class="form-group">
         <label class="col-sm-3 control-label" for="inputLocPhone">현지전화번호</label>
            <div class="col-sm-6">
                
                  <input type="number" class="form-control" id="inputNumber" placeholder="- 없이 입력해 주세요" name="mb_loc_phone" value="${temp.mb_loc_phone}">
                    <p class="help-block"></p>
            </div>
           </div>
           
              <div class="form-group">
         <label class="col-sm-3 control-label" for="inputBank">현지주소</label>
            <div class="col-sm-6">
                  <input type="text" class="form-control" id="inputAddress" placeholder="주소를 입력해주세요" name="mb_address" value="${temp.mb_address}">
                    <p class="help-block"></p>
            </div>
           </div>
      
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="button"  onclick="updateCheck()">수정하기<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-danger" type="button" onclick="realDelete()">회원탈퇴<i class="fa fa-times spaceLeft"></i></button>
          </div>
        </div>
        </form>
          <hr>
        </div>
      </article>
	</c:if> 
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/afk/resources/js/bootstrap.min.js"></script>
</body>
</html>