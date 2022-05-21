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
			
			if(f.p_id.value.length != 8 )
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
			
			<% // 보호자와 독거인 로그인 따로 할 수 있게 체크박스처럼 선택할 수 있게 
			// 기본은 독거인에 체크되어있게
			%> 
			<input type="radio" name="who" value="USER" checked="checked">독거인
			<input type="radio" name="who" value="MASTER">마스터 보호자
			<input type="radio" name="who" value="PROTECTER">보호자<br><br>
			
			
			<input type="사용자 번호" name="p_id" class="form-control" 
			placeholder="사용자 번호" required= autofocus> <br><br>
			
			
			<input type="password" name="p_pw" class="form-control" 
			placeholder="Password" required=""><br><br>
			
		<div align="center">
			<input type="submit" value="로그인">&nbsp;&nbsp; 
			<button type="button" onclick="location.href='form_member_new.jsp'">회원가입</button>
			
		
		</div>
		</fieldset>
	</form>
</body>
</html>
