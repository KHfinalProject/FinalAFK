<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">

  <title>Document</title>
  <style type="text/css"> 
	.container{
		width: 70%;
		height:800px;
		 
		
		margin:0 auto;
	}
	.title{
	 width:100%;
	 height:40px;
	 text-align: center;
	 border-bottom: solid  0.7px;
	 border-color: #ccc;
	 padding:0;
	 margin-bottom: 50px;
	}
	.hh{
	 color:red;
	}
	.hadan{
		float: right;
	}
  </style>

 </head>
 <body>
 <div>header</div>
 <div class="container">
 <div class="gong" align="center"><h1>공&nbsp;&nbsp;지&nbsp;&nbsp;사&nbsp;항<small><img src="/afk/resources/images/logo.png" width="100" height="25" border="0" alt="brand"></small></h1></div>
 <hr style="border: solid 1px #0000ff">
 <div class="title"><h2>${temp.notice_title}<h2></div>
 <table width="764">
					 <table width="100%" cellpadding="0" cellspacing="0" border="0">
				   

				     <tr>
				      <td align="center" width="76">글번호:</td>
				      <td width="319">${temp.notice_no}</td>
				      <td width="0">&nbsp;</td>
				     </tr>
					 
				    
					 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
				    <tr>
				      <td align="center" width="76">작성일:</td>
				      <td width="319">${temp.notice_enrolldate}</td>
				      <td width="0">&nbsp;</td>
				     </tr>
				     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
				    <tr>
				      <td align="center" width="76">조회수:</td>
				      <td width="319">${temp.notice_count}</td>
				      <td width="0">&nbsp;</td>
				     </tr>
				     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
				                <tr>
				      <td width="0"></td>
				                   <td width="399" colspan="2" height="400">${temp.notice_content}</td>
				                </tr>
</table>
					<hr style="border: solid 1px #0000ff">
			<div class="hadan">		<input type="button" value="수정하기" onclick="location.href='/afk/noticeUpdateView?notice_no=${temp.notice_no}'">
						<input type="button" value="삭제하기" >
						<input type="button" value="목록으로" onclick="location.href='/afk/customer'">
			</div>
</div>
	
 </body>
</html>
