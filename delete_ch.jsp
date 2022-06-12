<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<% 
	String u_id = request.getParameter("Uid");
	String sql = "DELETE FROM user WHERE userNum = ?";
	
	PreparedStatement sm = conn.prepareStatement(sql);
	sm.setString(1, u_id);

	int count = sm.executeUpdate();
	
	if(count == 1){
		response.sendRedirect("delete_succ.jsp");
	}else{
		response.sendRedirect("delete_err.jsp");
	}
	sm.close();
	conn.close();	
%>