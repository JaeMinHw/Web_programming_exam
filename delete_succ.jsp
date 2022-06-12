<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 성공</title>
</head>
<body>
<% 
	response.sendRedirect("manager_page.jsp");
	%>
	<table border="0">
		<tr>
			<td>
				<form action="main.jsp" method="post" >
					<input type="submit" value=" ◀ 메인 화면으로 " >
				</form>	
			</td>
			<td>		
				<form action="membersList.jsp" method="post" >
					<input type="submit" value=" 회원 목록으로 ▶ " >
				</form>
			</td>
		</tr>	 
	</table>		
</body>
</html>