<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			
			
			if(f.p_id.value.length < 4 || f.p_id.value.length > 16)
			{
				alert("아이디는 4~16자 이내로 입력해야 합니다.");
				f.p_id.focus();
				return false;
			}
			
			
			else if(!regExpName.test(check_id))
			{
				alert("아이디은 영문 또는 숫자로만 입력해야합니다");
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

			else if(f.phone1.value.length <3 || f.phone2.value.length < 4 || f.phone3.value.length < 4)
			{
				alert("전화번호를 입력해주세요");
				f.phone1.focus();
				return false;
			}
			
			else if(f.p_phone1.value.length <3 || f.p_phone2.value.length < 4 || f.p_phone3.value.length < 4)
			{
				alert("보호자 연락처를 입력해주세요");
				f.p_phone1.focus();
				return false;
			}
			
			else if(f.scret_n1.value.length<6 || f.scret_n2.value.length <7)
			{
				alert("주민등록번호를 입력해주세요");
				f.scret_n1.focus();
				return false;
			}
			
			else return true;

		}
	</script>
</head>
<body>
	Home > Join the Membership
	<hr>
	<form action="form_member_new_parameter.jsp" name="person_info" method="post" onsubmit="return checkFun()">
	<fieldset style="width:330px">
			<legend> 개인 정보 입력 </legend><p>
			
			아이디 : <br>
			<input type="text" name="p_id" size="16"><br><br>
			
			비밀번호 : <br>
			<input type="password" name="p_pw" size="16"><br><br>
			
			이름 : <br>
			<input type="text" name="p_name" size="16"><br><br>
			
			연락처 : <br>
			<select name="choice" style="width:60px;height:20.5px">
				<option value="choice"> 선택 </option>
				<option value="KT"> KT </option>
				<option value="SKT"> SKT </option>
				<option value="LGU+"> LGU+ </option>
			</select>
			<input type="text" maxlength="3" size="3" name="phone1"> -
			<input type="text" maxlength="4" size="4" name="phone2"> -
			<input type="text" maxlength="4" size="4" name="phone3"><br><br>
			
			보호자 연락처 : <br>
			<select name="p_choice" style="width:60px;height:20.5px">
				<option value="p_choice"> 선택</option>
				<option value="KT"> KT </option>
				<option value="SKT"> SKT </option>
				<option value="LGU+"> LGU+ </option>
			</select>
			<input type="text" maxlength="3" size="3" name="p_phone1"> -
			<input type="text" maxlength="4" size="4" name="p_phone2"> -
			<input type="text" maxlength="4" size="4" name="p_phone3"><br><br>
			
			성별 : 
			<input type="radio" name="gender" value="남성">남
			<input type="radio" name="gender" value="여성">여<br><br>
			
			주민등록번호 : <br>
			<input type="text" maxlength="6" size="6" name="scret_n1"> -
			<input type="password" maxlength="7" size="7" name="scret_n2"><br><br>
			
				
			&nbsp;주&nbsp;&nbsp;&nbsp;&nbsp;소&nbsp; :  
			<input type="text" size="30" name="address1"><br>
			상세 주소 :
			<input type="text" size="30" name="address2"><br>
			

			<hr>
			
			<div align="center">

				<input type="submit" value=" 가입하기 "> &nbsp;&nbsp;
				<input type="reset" value=" 다시작성 ">
			</div>
		</fieldset>
	</form>
</body>
</html>
