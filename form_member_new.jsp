<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "che.jsp" %>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>회원 가입</title>
	<script type="text/javascript">
		function checkFun()
		{
			var f = document.person_info;
			
			var check_id = f.p_id.value;
			var regExpName = /^[a-z0-9]*$/;
			
			var check_pw = f.p_pw.value;
			var regExpPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&].{4,16}$/;
			
			
			if(f.p_id.value.length != 8)
			{
				alert("사용자 번호는 8자입니다.");
				f.p_id.focus();
				return false;
			}
			
		
			
			
			
			else if(f.p_pw.value.length < 6)
			{
				alert("비밀번호는 6자 이상으로 입력해야 합니다.");
				f.p_pw.focus();
				return false;
			}
			
			else if(!regExpPw.test(check_pw))
			{
				alert("비밀번호는 영어 숫자 특수문자 1개 이상을 포함해야 합니다");
				f.p_pw.focus();
				return false;
			}


			
			else if(f.p_name.value=="")
			{
				alert("이름을 입력해주세요");
				f.p_name.focus();
				return false;
			}

			else if(f.phone.value.length !=13 )
			{
				alert("전화번호를 000-0000-0000 형식으로 입력해주세요");
				f.phone1.focus();
				return false;
			}
		
			
			else return true;

		}
	</script>
</head>
	<body style="text-align:center;">
	
		<legend> 회원가입 </legend>
		<hr>
		<form action="form_member_new_parameter.jsp" name="person_info" method="post" onsubmit="return checkFun()">
		<fieldset >
				<legend> 개인 정보 입력 </legend><p>
				
				구분 :
				<input type = "radio" name="who" value ="USER">독거인
				<input type = "radio" name="who" value ="MASTER">마스터 보호자
				<input type = "radio" name="who" value="PROTECTER">보호자<br><br>
				
				&nbsp;아이디 &nbsp;&nbsp;:&nbsp;
				<input type="text" maxlength = "8" name="p_id" size="16" ><br><br>
				
				비밀번호 :&nbsp;
				<input type="password" name="p_p
				w" size="16"><br><br>
				
				&nbsp;&nbsp;이&nbsp;름 &nbsp;&nbsp;:&nbsp;
				<input type="text" name="p_name" size="16"><br><br>
				
				&nbsp;연락처 &nbsp;:&nbsp;
				<input type="text" placeholder="010-1111-1111" maxlength="13" size="16" name="phone"><br><br>
			
				<hr>
				
				<div align="center">
					<div>
					<input type="submit" class="btn btn-secondary" value="가입" >
					<input type="reset" class="btn btn-secondary" value="다시 작성" > 
				</div>
				</div>
			</fieldset>
		</form>
	</body>
</html>
