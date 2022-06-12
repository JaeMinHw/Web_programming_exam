<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<% 
	String u_id = request.getParameter("userID"); //null로 출력 오류
	String u_pw = request.getParameter("userPW");
	String u_na = request.getParameter("userName");
	String u_ph = request.getParameter("userPhone");
	System.out.println(u_id);
	String sql = "update user set  userPassword = ?, userName = ?, userPhone = ? where userNum = ?";
	
	PreparedStatement sm = conn.prepareStatement(sql);
	sm.setString(1, u_pw);
	sm.setString(2, u_na);
	sm.setString(3, u_ph);
	sm.setString(4, u_id);

	int count = sm.executeUpdate();
	
	if(count == 1){
		response.sendRedirect("manager_page.jsp");
	}else{
		response.sendRedirect("modi_err.jsp");
	}
	sm.close();
	conn.close();	
%>