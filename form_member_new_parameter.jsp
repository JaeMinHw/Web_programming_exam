<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
	
		String u_id = request.getParameter("p_id");
		String pw = request.getParameter("p_pw");
		String u_name = request.getParameter("p_name");
		
		String choice = request.getParameter("choice");
		String ph01 = request.getParameter("phone1");
		String ph02 = request.getParameter("phone2");
		String ph03 = request.getParameter("phone3");
		
		String p_choice = request.getParameter("p_choice");
		String p_ph01 = request.getParameter("p_phone1");
		String p_ph02 = request.getParameter("p_phone2");
		String p_ph03 = request.getParameter("p_phone3");
		
		String sex = request.getParameter("gender");
		String sec_n1 = request.getParameter("scret_n1");
		String sec_n2 = request.getParameter("scret_n2");
		String addre1 = request.getParameter("address1");
		String addre2 = request.getParameter("address2");
		
		String sql = "insert into members(id,passwd,name) values";
		sql += "(`" + u_id + "','" + pw + "','" +u_name + "`)";
		
		String driverName="com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/mydb";
		String username= "root";
		String password="1234";
		Connection conn = null;
		
		Class.forName(driverName);
		conn=DriverManager.getConnection(url,username,password);
		Statement sm = conn.createStatement();
		
		int count = sm.executeUpdate(sql);
		if(count ==1 ) {
			out.println("회원가입 성공");
		} else{
			out.println("회원가입 실패");
		}
		sm.close();
		conn.close();
	%>
		<p> 아이디 : <%= u_id %>
		<p> 비밀번호 : <%=pw %>
		<p> 이름 : <%= u_name %>
		<p> 연락처 : <%= choice %> <%= ph01 %> <%= ph02 %> <%=ph03 %>	
		<p> 보호자 연학처 : <%= p_choice %>  <%= p_ph01 %> - <%= p_ph02 %> - <%= p_ph03 %>
		<p> 성별 : <%= sex %>
		<p> 주민등록번호 : <%= sec_n1 %> - <%=sec_n2 %>
		<p> 주소 : <%= addre1 %>
		<p> 상세 주소 : <%= addre2 %>

</body>
</html>
