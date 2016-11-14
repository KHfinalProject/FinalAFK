<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Footer</title>

 <style type="text/css">
 
 #footer {
 	margin-top : 50px;
 	padding-top : 10px;
 	padding-bottom : 10px;
 	width : 100%;
 	height : 200px;
 	background-color : #3a3a3a;
 	display : table;
 	color : white;
 }
 
 #fwrap{
	display : table-cell;
	vertical-align : middle;
	text-align : center;
 }
 
 .flink {
 	display : inline-block;
 	margin-right : 50px;
 }
 
 @media all and (max-width : 900px){
 	.flink {
 		display : none;
 	}
 }
 
 #fmenu a {
 	text-decoration : none;
 	color : white;
 }
 
 .fd {
 	display : inline-block;
	text-align : left;
	padding : 0 20px; 
 }
 
 @media all and (max-width: 300px){
 	.fd h1{
		font-size : 20pt;
	}
 }
	
 </style>

</head>
<body>

<div id="footer">
<div id="fwrap">
	<div class="flink">
		<ul id="fmenu">
			<li class="footMenu"><a href="#"><h4>고객센터</h4></a></li>
			<li class="footMenu"><a href="#"><h4>공지사항</h4></a></li>
		</ul>
	</div>
	
	<div class="fd">
		<h1>
			<img src="../resources/images/phone.png" width="50px" height="50px"/>
			&nbsp; 1588-1588
		</h1> 
	</div>
	
	<div class = "fd">
		<h4>AFK <br>
		All right reserved<br>
		</h4>
	</div>

</div>
</div>
</body>
</html>