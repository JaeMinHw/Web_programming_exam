<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<%@ include file = "update_css.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>USER 목록</title>
</head>
<body>
	회원 정보 관리
		<%  String u_id1 = request.getParameter("find_ID");	
	%>
	
	<form action="user_modi.jsp" method="post"  name = "find_form" onsubmit="return checkFun()" > 
	
		<tr height="30">
		
		<td align="right"> 검색할 이름 혹은 관리번호 &nbsp;</td>
		<td><input type="text" name="find_ID"></td>
	</tr>
	<input type="submit" class="btn btn-secondary" value=" ◀ 검색 " > <br>
	</form>
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
	
	<% 
		String membername = (String)session.getAttribute("memberType");
		String u_id = request.getParameter("userID");
		String u_pw = request.getParameter("userPW");
		
		int count = 1;
		String str = "";
		
		
		%>
		
		<table border = "1">
			
			<% 
		
			if(u_id1 != null)
			{
				Statement sm1 = conn.createStatement();
				ResultSet rs1 = sm1.executeQuery("SELECT * FROM user where userNum like '%" +u_id1+ "%' or userName like '%" +u_id1+ "%' ");
				
				while(rs1.next())
				{
					str += "<tr>" + "<td>" +"<center>" + count + "</td>" + "<td>" + rs1.getString("userNum") + "</td>" + "<td>" + rs1.getString("userName") + "</td>" +"<td>" + rs1.getString("userPassword") + "</td>" +"<td>" +  rs1.getString("userPhone") + "</td>" + "<td>" + "<center>" + "<a href='modify.jsp?Uid="+rs1.getString("userNum")+"'> □ </a>" +"<td>" + "<center>" + "<a href='delete_ch.jsp?Uid="+rs1.getString("userNum")+"'> X</a>" + "</td>" + "</tr>";
					count++;
				}
				 out.print("<tr> <td> NO </td> <td>userNum</td> <td>userName</td> <td>userPassword</td> <td>userPhone</td> <td>수정</td> <td>삭제</td> </tr>");
		     out.print(str);
		     rs1.close();
				sm1.close();
				conn.close();	
				
			}
			else
			{
				Statement sm = conn.createStatement();
				
				ResultSet rs = sm.executeQuery("SELECT userNum, userName, userPassword, userPhone FROM user ");
				
			
				
				while(rs.next())
				{
					str += "<tr>" + "<td>" +"<center>" + count + "</td>" + "<td>" + rs.getString("userNum") + "</td>" + "<td>" + rs.getString("userName") + "</td>" +"<td>" + rs.getString("userPassword") + "</td>" +"<td>" +  rs.getString("userPhone") + "</td>" + "<td>" + "<center>" + "<a href='modify.jsp?Uid="+rs.getString("userNum")+"'> □ </a>" +"<td>" + "<center>" + "<a href='delete_ch.jsp?Uid="+rs.getString("userNum")+"'> X</a>" + "</td>" + "</tr>";
					count++;
				}
				 out.print("<tr> <td> NO </td> <td>userNum</td> <td>userName</td> <td>userPassword</td> <td>userPhone</td> <td>수정</td> <td>삭제</td> </tr>");
			   out.print(str);
			   rs.close();
			 	 sm.close();
			}
			%>
			<div>
				<button type="button" class="btn btn-secondary" onclick="location.href='show_who.jsp'">목록</button>
			</div>
</body>
</html>