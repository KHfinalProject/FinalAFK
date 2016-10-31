<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
     
    
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
 
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
     
  <!-- 합쳐지고 최소화된 최신 CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	
  <!-- 부가적인 테마 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
  <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>	

</head>
<body>
<h2>testtest</h2>
<h4>페이지 로딩하자마자 아래 출력</h4>
<table>
<c:forEach var="a" items="${list}">
<tr>
	<td>${a.col}</td>
	<td>${a.title}</td>
</tr>
</c:forEach>
</table>
<hr>
<h4>더보기 누르면 아래 출력</h4>
<div id='test'>

</div>

<script>
$(function(){
	
	var count = 1;
	
	$('#paging').click(function(){
		
		count += 5;
		
		$.ajax({
			url : "guideMore.do",
			type : "post",
			data : {testNo : count},
			dataType : "json",
			success : function(response){
				console.log("success");
				
				var jsonStr = JSON.stringify(response);
				var json = JSON.parse(jsonStr);
				console.log(json);
				var old = $('#test').html();
				var values = "";
				var Ca = /\+/g;
				
				for(var i in json.list){
					values += json.list[i].col + "," + decodeURIComponent(json.list[i].title.replace(Ca, " ")) + '<br>';
				}
				values += '<hr>';
				console.log(values);
				$('#test').html(old + values);
			},
			error : function(e){
				console.log("error");
			}
		})	
	});
				
});

</script>

<button id="paging">더보기</button>


</body>
</html>