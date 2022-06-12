<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
</head>
<body>
<%
String u_name = null;
String u_phone = null;
String u_pw = null;
String u_id = request.getParameter("Uid");


String sql = "SELECT masName , masPhone, masPassword FROM master WHERE userNum = ?";

PreparedStatement sm = conn.prepareStatement(sql);
ResultSet rs = null;
sm.setString(1,u_id);
rs = sm.executeQuery();
while(rs.next()) 
{
	u_name = rs.getString("masName");
	u_phone = rs.getString("masPhone");
	u_pw = rs.getString("masPassword");
}



 %>
	Home > 회원 수정
	<hr>
	<form action="modi_check_mas.jsp" name="modi_info" 
		method="post" onsubmit="return checkFun()">
		<fieldset style="width:230px">
			<legend> 회원 정보 수정 </legend><p>
			
			관리 번호 : <br>
			<input type="text" value=<%= u_id %> size = "16" name="userID" readonly><br><br>
		
			비밀번호 : <br> 
			<input type="password"  size = "16" name="userPW"><br><br>
			
			이름 : <br>
			<input type="name"  value=<%= u_name %> size="30" name="userName"><br>		
			
			전화번호 : <br>
			<input type="phone" value=<%= u_phone %> size="30" name="userPhone">
			<hr>
			<input type="reset" value=" ◀ 다시작성 ">
			<input type="submit" value=" 수정하기 ▶ ">
			<br><br>
		</fieldset>
	</form>
</body>
</html>