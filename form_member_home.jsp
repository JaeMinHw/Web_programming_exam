<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>독거인 관리 시스템</title>
	<script type="text/javascript">
		function check_Fun()
		{
			var f=document.person_info;
			
			var check_id = f.p_id.value;
			var check_pw = f.p_pw.value;
			
			if(f.p_id.value.length < 4 || f.p_id.value.length > 16)
			{
				alert("아이디를 입력해주세요");
				f.p_id.focus();
				return false;
			}
			
			if(f.p_pw.value.length < 6)
			{
				alert("비밀번호를 입력해주세요");
				f.p_pw.focus();
				return false;
			}
			
			else return true;
		}
	</script>
</head>
<body>
	Home > 독거인 관리 시스템
	<hr>
	<form action="form_member_login.jsp" name="person_info" method="get" onsubmit="return check_Fun()">
		
		<fieldset style="width:330px">
			<legend> 로그인 </legend><p>
			
			아이디 : <br>
			<input type="text" name="p_id" size="16"><br><br>
			
			비밀 번호 : <br>
			<input type="text" name="p_pw" size="16"><br><br>
			
		<div align="center">
			<button type="button" onclick="location.href='form_member_new.jsp'">회원가입</button>
			<input type="submit" value="로그인">&nbsp;&nbsp;
		
		</div>
		</fieldset>
	</form>
</body>
</html>
