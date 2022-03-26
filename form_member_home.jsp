<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>독거인 관리 시스템</title>
</head>
<body>
	Home > 독거인 관리 시스템
	<hr>
	<form action="form_member_new.jsp" name="person_info" method="get">
		<fieldset style="width:330px">
			<legend> 로그인 </legend><p>
			
			아이디 : <br>
			<input type="text" name="p_id" size="16"><br><br>
			
			비밀 번호 : <br>
			<input type="text" name="p_pw" size="16"><br><br>
			
		<div align="center">
			<button type="button" onclick="location.href='form_member_login.jsp'">로그인</button>
			<input type="submit" value="회원가입">&nbsp;&nbsp;
		
		</div>
		</fieldset>
	</form>
</body>
</html>