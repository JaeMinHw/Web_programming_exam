<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "update_css.jsp" %>
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
			
			if(f.p_id.value.length == null )
			{
				alert("아이디를 입력해주세요");
				f.p_id.focus();
				return false;
			}
			
			if(f.p_pw.value.length == null)
			{
				alert("비밀번호를 입력해주세요");
				f.p_pw.focus();
				return false;
			}
			
			else return true;
		}
	</script>
</head>
<body style="text-align:center;">
	<br><br><br><br><br><br><br><br><br>

	<form action='form_member_login.jsp' name="person_info" method="get" onsubmit="return check_Fun()">
		
		<div>
			<ul>
			<legend> 독거인 관리 시스템 </legend>
				
				<% 
				// 보호자와 독거인 로그인 따로 할 수 있게 체크박스처럼 선택할 수 있게 
				// 기본은 독거인에 체크되어있게
				%> 		
				<div>
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn btn-primary active">
										<input type="radio" name="who" value="USER" checked = "checked">독거인
									</label>
									
									<label class="btn btn-primary">
										<input type="radio" name="who" value="MASTER">마스터 보호자
									</label>
									
									<label class="btn btn-primary">
										<input type="radio" name="who" value="PROTECTER">보호자
									</label>
									<label class="btn btn-primary">
										<input type="radio" name="who" value="MANAGER">관리자
									</label>
								</div>
						
				</div>
			
			
			<br>
				
				<input type="사용자 번호" name="p_id" 
				placeholder="사용자 번호" required= autofocus> 
					
				<br>
				<input type="password" name="p_pw"
				placeholder="비밀번호" required=""><br><br>
				
			<div>
				<input type="submit" class="btn btn-secondary" value="로그인" >
				<button type="button" class="btn btn-secondary" onclick="location.href='form_member_new.jsp'">회원가입</button>
			</div>

			</ul>
		</div>
	</form>
</body>
</html>
