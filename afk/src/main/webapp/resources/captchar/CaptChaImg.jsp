<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.model.afk.captcha.CaptCha"%>
<%
	out.clear();
	pageContext.pushBody();
    new CaptCha().getCaptCha(request, response); 
%>