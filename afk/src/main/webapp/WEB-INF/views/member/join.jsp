<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String ctx = request.getContextPath(); //콘텍스트명 얻어오기.
  response.setHeader("Pragma-directive", "no-cache");
  response.setHeader("Cache-directive", "no-cache");
  response.setHeader("Pragma", "no-cache");
  response.setHeader("Cache-Control", "no-cache");
  response.setDateHeader("Expires",0); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<!-- CaptCha  -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="Cache-Control" content="no-cache" />
		<meta http-equiv="Pragma" content="no-cache" />
		<meta http-equiv="Imagetoolbar" content="no" />
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
		
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
	.gum{
		margin:0 auto;
	}
</style>
<script type="text/javascript">
		
		 /* 
		  * Captcha Image 요청
		  * [주의] IE의 경우 CaptChaImg.jsp 호출시 매번 변하는 임의의 값(의미없는 값)을 파라미터로 전달하지 않으면
		  * '새로고침'버튼을 클릭해도 CaptChaImg.jsp가 호출되지 않는다. 즉, 이미지가 변경되지 않는 문제가 발생한다. 
		  *  그러나 크롭의 경우에는 파라미터 전달 없이도 정상 호출된다.
		  */
		 function changeCaptcha() {
			
		  var rand = Math.random();
		  //IE에서 '새로고침'버튼을 클릭시 CaptChaImg.jsp가 호출되지 않는 문제를 해결하기 위해 "?rand='+ Math.random()" 추가 
		  $('#catpcha').html("<img src=\'<%=ctx%>/resources/captchar/CaptChaImg.jsp?rand="+ rand + "\'/>");
		 }
		
		
		
		 function winPlayer(objUrl) {
		  $('#audiocatpch').html('<bgsound src="' + objUrl + '">');
		 }
		 
		 /* 
		  * Captcha Audio 요청
		  * [주의] IE의 경우 CaptChaAudio.jsp 호출시 매번 매번 변하는 임의의 값(의미없는 값)을 파라미터로 전달하지 않으면
		  * '새로고침'된 이미지의 문자열을 읽지 못하고 최초 화면 로드시 로딩된 이미지의 문자열만 읽는 문제가 발생한다. 
		  * 이 문제의 원인도 결국 매번 변하는 파라미터 없이는 CaptChaAudio.jsp가 호출되지 않기 때문이다. 
		  * 그러나 크롭의 경우에는 파라미터 전달 없이도 정상 호출된다.  
		  */
		 function audioCaptcha() {
		
		   var uAgent = navigator.userAgent;
		   var soundUrl = '/afk/resources/captchar/CaptChaAudio.jsp';
		   if (uAgent.indexOf('Trident') > -1 || uAgent.indexOf('MSIE') > -1) {
		       //IE일 경우 호출
		       winPlayer(soundUrl+'?agent=msie&rand='+ rand);
		   } else if (!!document.createElement('audio').canPlayType) {
		       //Chrome일 경우 호출
		       try { new Audio(soundUrl).play(); } catch(e) { winPlayer(soundUrl); }
		   } else window.open(soundUrl, '', 'width=1,height=1');
		 }
		 
		 //화면 호출시 가장 먼저 호출되는 부분 
		 $(document).ready(function() {
		  
		  changeCaptcha(); //Captcha Image 요청
		  
		  $('#reLoad').click(function(){ changeCaptcha(); }); //'새로고침'버튼의 Click 이벤트 발생시 'changeCaptcha()'호출
		  $('#soundOn').click(function(){ audioCaptcha(); }); //'음성듣기'버튼의 Click 이벤트 발생시 'audioCaptcha()'호출
		  
		  //'확인' 버튼 클릭시
		  $('#frmSubmit').click(function(){
		      if ( !$('#answer').val() ) {
		           alert('이미지에 보이는 숫자 또는 스피커를 통해 들리는 숫자를 입력해 주세요.');
		      } else {
		           $.ajax({
		               url: '/afk/resources/captchar/CaptchaSubmit.jsp',
		               type: 'POST',
		               dataType: 'text',
		               data: 'answer=' + $('#answer').val(),
		               async: false,  
		               success: function(resp) {
		            	    if(resp == 0){
		                    	alert("입력값이 일치하지 않습니다.");
		                    	$('#reLoad').click();
			                    $('#answer').val('');
		                    } else {
		                    	alert("확인되었습니다.");
		                    
			                    $('#answer').attr('readonly',true);
			                    $('#reLoad').attr('disabled',true);
			                    $('#frmSubmit').attr('disabled',true);
			                    $('#soundOn').attr('disabled',true);
			                    $('input[name=captchar]').val('1');
		                    }
		                    
		              }
		         });
		      }
		  });
		 });
		</script>
</head>
<body>
<header>
<c:import url="../header.jsp"></c:import>
</header>
 <article class="container">


        <div class="col-md-12">
        <div class="page-header">
    	    <h1 class="h1">회원가입 <small> <img src="/afk/resources/images/logo.png" width="100" height="25" border="0" alt="brand"></small></h1>
        </div>
        <form class="form-horizontal" action="joinInsert" method="POST" name="inputform" onsubmit="return checking()">
        	<input type="hidden" name="captchar" value="0">
	
		<div class="form-group">
            <label class="col-sm-3 control-label" for="inputName">아이디</label>
          <div class="col-sm-6">
            <input class="form-control" id="inputName" type="text" placeholder="아이디를 입력하세요" name="mb_id" onkeyup="idCheck()" autocomplete="off">
            <input style="border:none;  width:300px; " type="text" name="chekId" readonly id="chekId" class="a1" >
          </div>
         </div>
        	 
        <div class="form-group">
          <label class="col-sm-3 control-label" for="inputPassword" >비밀번호</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputPassword" type="password" placeholder="비밀번호"name="mb_pwd" onkeyup="pwdCheck()">
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
            <input class="form-control" id="inputName" type="text" placeholder="이름" name="mb_name">
			   <p class="help-block"></p>
          </div>
        </div> 
		  <div class="form-group">
          <label class="col-sm-3 control-label" for="inputEmail">이메일</label>
        <div class="col-sm-6">
          <input class="form-control" id="inputEmail" type="email" placeholder="이메일"  name="mb_email">
		     <p class="help-block"></p>
        </div>
        </div>
        <div class="form-group">
         <label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
            <div class="col-sm-6">
                
                  <input type="number" class="form-control" id="inputNumber" placeholder="- 없이 입력해 주세요" name="mb_phone"  onkeyup="phoneCheck()">
                     <input style="border:none; width:300px; " type="text" name="chekPhone" readonly id="chekPhone"  >
                </div>
              </div>
       <div class="form-group">
			<center><div >
			<div id="catpcha">Wait...</div>
			<div id="audiocatpch" style="display: none;"></div>
			
			<input id="reLoad" type="button" value="새로고침" />
			<input id="soundOn" type="button" value="음성듣기" />
			
			<input type="text" id="answer" name="answer" value="" />
			<input type="button" id="frmSubmit" value="확인" />	
			</div></center>
		</div>
		
        <div class="form-group">
          <div class="col-sm-12 text-center">
            <button class="btn btn-primary" type="submit">회원가입<i class="fa fa-check spaceLeft"></i></button>
            <button class="btn btn-danger" type="button"onclick="location.href='/afk/'">가입취소<i class="fa fa-times spaceLeft"></i></button>
          </div>
        </div>
        </form>
          <hr>
        </div>
      </article>
   <footer>
   <c:import url="../footer.jsp"></c:import>
   </footer>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/afk/resources/js/bootstrap.min.js"></script>
</body>
</html>