<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<%@ include file = "update_css.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	if(session.getAttribute("memberId")==null)
	{
		response.sendRedirect("form_member_home.jsp");
	}
	else if(!((session.getAttribute("membertype")).equals("MANAGER")))
	{
		response.sendRedirect("form_member_home.jsp");
	}
	%>
	<hr>
	
	
<br><br><br><br><br><br><br><br><br><br><br><br>

	<div>
		<button type="button" class="btn btn-secondary" onclick="location.href='user_modi.jsp'">USER</button>  &nbsp;&nbsp;
		<button type="button" class="btn btn-secondary" onclick="location.href='mas_modi.jsp'">마스터 보호자</button>  &nbsp;&nbsp; 
		<button type="button" class="btn btn-secondary" onclick="location.href='pro_modi.jsp'">보호자</button>
		
	</div>
</body>
</html>