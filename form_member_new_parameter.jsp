<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력한 개인 정보</title>
</head>
<body>
	Home > Personal Information Inquiry
	<hr>
	<%
		request.setCharacterEncoding("UTF-8");
	
		int u_id = Integer.parseInt(request.getParameter("p_id"));
		String pw = request.getParameter("p_pw");
		String u_name = request.getParameter("p_name");
		
		String ph01 = request.getParameter("phone");
		
		String who1 = request.getParameter("who");
		
		
		Statement sm = conn.createStatement();
		
		
		if(who1.equals("USER")) {
			String sql = "INSERT INTO user(userNum,userName,userPassword,userPhone) VALUES('"+u_id+"','"+u_name+"','"+pw+"','"+ph01+"')";
			int count = sm.executeUpdate(sql);
			if(count ==1 ) {
				out.println("회원가입 성공");
			} else{
				out.println("회원가입 실패");
			}
		}
		else if(who1.equals("MASTER")) {
			String sql = "INSERT INTO master(userNum,masName,masPhone,masPassword,) VALUES('"+u_id+"','"+u_name+"','"+ph01+"','"+pw+"')";
			int count = sm.executeUpdate(sql);
			if(count ==1 ) {
				out.println("회원가입 성공");
			} else{
				out.println("회원가입 실패");
			}
		}
		else if(who1.equals("PROTECTER")){
			String sql = "INSERT INTO protecter(userNum,proName,proPhone,userPassword) VALUES('"+u_id+"','"+u_name+"','"+ph01+"','"+pw+"')";
			int count = sm.executeUpdate(sql);
			if(count ==1 ) {
				out.println("회원가입 성공");
			} else{
				out.println("회원가입 실패");
			}
		}
		else {
			return;
		}
		
		sm.close();
		conn.close();
	%>
		<p> 아이디 : <%= u_id %>
		<p> 비밀번호 : <%=pw %>
		<p> 이름 : <%= u_name %>
		<p> 연락처 :  <%= ph01 %>



</body>
</html>
