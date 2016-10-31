<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
  <title>Document</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>	
 
  <!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>

 <style type="text/css">

	.notice_in {
		margin:0 auto;
		BORDER-TOP: 2px solid #3300cc;
		BORDER-BOTTOM: 2px solid #3300cc;
		background : white;
		width : 80%;
	}
	.notice_in tr th{
		BORDER-BOTTOM: 1px solid #d9d9d9;
		padding : 10px;
		width : 20%;
	}
	/* 미디어쿼리 이용하여 글자크기 조정 */
	@media all and (max-width: 750px){
		.notice_in tr th{
			font-size : 10pt;
		}
	}

	@media all and (max-width: 300px){
		.notice_in tr th{
			font-size : 3pt;
		}
	
	}
	 .notice_in tr td{
		BORDER-BOTTOM: 1px solid #d9d9d9;
		padding : 10px;
		text-align : left;
	}
	.notice_in tr td:nth-child(2n+1), .notice_in tr th:nth-child(2n+1){
		background: #ebebeb;
	}
	.notice_in input[name*="title"]{
		width : 98%;
	}
	.notice_in textarea{
		width : 98%;
		height : 200px;
	}
	#notice_in #dqBtn {
		background : #3399ff;
		border :1px solid #3399ff;
		color : white;
		font-size : 12pt;
	}

</style>
<body>

<div id = "notice_in">
	<center>
	<h1> 공지사항 입력 </h1>
	</center>

	<form action="" method="post">
	<center>
	<table class="notice_in" cellspacing="0">

	<tr>
		<th>제목</th>
		<td><input type="text" name="subject"></td>
	</tr>
	<tr>
		<th>공지 내용 입력</th>
		<td><textarea name="content" rows="5" cols="50"></textarea></td>
	</tr>
	</table><br>
		<input type="submit" id = "noticein" value = "저장"> &nbsp;&nbsp;		
		<input type="submit" id = "back" value = "취소">
		</form>
		</center>
	</div>
</center>

</body>
</html>