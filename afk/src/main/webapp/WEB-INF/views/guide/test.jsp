<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>testtest</h2>


두근두근 과연 성공할 것인가 <br>
총 게시글 숫자 : ${count }
<br>
<table>
<c:forEach var="a" items="${list}">
<tr>
	<td>${a.col}</td>
</tr>
</c:forEach>
</table>

<hr>

<!-- 화면에 출력할 레코드의 수를 결정하는 변수 -->
<c:set var="maxRow" value="4" />

<!-- 시작페이지 결정 -->
<c:set var="cpage" value="1" />
<c:if test="${!empty param.cpage}">
    <c:set var="cpage" value="${param.cpage}" />
</c:if>

<%-- 총 레코드수 구하기--%>
        <%-- 쿼리 실행부 --%>
        <sql:setDataSource var="afk" driver="oracle.jdbc.driver.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:XE"
        user="final" password="final" />
        
         <sql:transaction dataSource="${afk}">
       
            <sql:query var="rs">
                SELECT count(*) AS cnt FROM test
            </sql:query>
        </sql:transaction>
       
        <c:forEach var="row" items="${rs.rows}">
            <c:set var="totalitem" value="${row.cnt}" />
        </c:forEach>
    <%-- 총 레코드수 구하기--%>
   
    <%-- 총 페이지수 구하기--%>
    <c:set var="totalpage" value="${((totalitem - 1)/ maxRow ) + 1 }" />
    <c:set var="skip" value="${(cpage-1) * maxRow }" />   
    
    <table border = "1" align="center">
   
        <!--  건너뛸 레코드 수(skip)이 0이면 처음부터 쭈욱 시작 -->
        <c:if test="${0 == skip}">
            <c:set var="start" value="0" />
        </c:if>
        <c:if test="${!empty skip}">
            <c:set var="start" value="${skip}" />
        </c:if>
       
        <% //이건 행마다 번갈아가면서 색을 변경하기 위해 사용한 것이다.
            int n=0;
        %>
        <tr><th>번호</th><th>제   목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>
       
        <!-- 화면출력을 위한 쿼리 실행, 53~59 에서 시작위치를 결정한다. -->
        <sql:query dataSource="${ds}" var="rs" maxRows="${maxRow}" startRow="${start}"  >
        	select * from test
        </sql:query>
        <c:forEach var="row" items="${rs.rows}">
        <%
            n = n+1;
            if (n%2 == 0) {
        %>
                <tr style="background-color:#aaaaaa">
        <%
            } else {
        %>
            <tr style="background-color:#dddddd">
        <%
            }
        %>
       
        <!-- 테이블 출력화면 -->
            <td width="80">${row.col}</td>
            <td width="100">${row.title}</td>
            </tr>
        </c:forEach>

           
       
    </table>
       
            <!-- 하단부 페이지 이동버튼 만들기 -->
           
                <c:set var="i" value="1" />
                <c:forEach var="i" begin="1" end="${totalpage}" step="1">
                    <c:if test="${i == cpage}">
                    <c:out value="${i}" />
                    </c:if>
                    <c:if test="${i != cpage}">
                    &nbsp;<a href="ListEditJstl.jsp?cpage=${i}">${i}</a>&nbsp;
                    </c:if>
                </c:forEach>
           
            <!-- 하단부 페이지 이동버튼 만들기 -->
   




</body>
</html>