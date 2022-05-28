<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<%@ include file = "che.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
<title> 관리 server </title>
</head>
<body style="text-align:center;">
	<% 
	if(session.getAttribute("memberId")==null)
	{
		response.sendRedirect("login.jsp");
	}
	%>
	<hr>
	
	<br><br><br><br><br><br><br><br>
	<div>
		<button type="button" class="btn btn-secondary" onclick="location.href='data_ana.jsp'">데이터 분석</button>  &nbsp;&nbsp;
		<button type="button" class="btn btn-secondary" onclick="location.href='info_member.jsp'">회원 정보</button>
		
	</div>
		

</body>
</html>