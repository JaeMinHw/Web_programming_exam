<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<link rel="stylesheet" hred="body.css">
	
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
<body style="text-align:center;">

	<form action='form_member_login.jsp' name="person_info" method="get" onsubmit="return check_Fun()">
		
		<div class = "flex-container">
			<ul>
			<legend> 로그인 </legend><p>
				
				<% 
				// 보호자와 독거인 로그인 따로 할 수 있게 체크박스처럼 선택할 수 있게 
				// 기본은 독거인에 체크되어있게
				%> 		
				<div>
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn btn-primary">
										<input type="radio" name="who" value="USER"	>독거인
									</label>
									
									<label class="btn btn-primary">
										<input type="radio" name="who" value="MASTER">마스터 보호자
									</label>
									
									<label class="btn btn-primary">
										<input type="radio" name="who" value="PROTECTER">보호자
									</label>
								</div>
						
				</div>
	
	
			
				<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
			
			<br>
				
				<input type="사용자 번호" name="p_id" 
				placeholder="사용자 번호" required= autofocus> 
					
				<br>
				<input type="password" name="p_pw"
				placeholder="Password" required=""><br><br>
				
			<div>
				<input type="submit" class="btn btn-secondary"  ></button>
				<button type="button" class="btn btn-secondary" onclick="location.href='form_member_new.jsp'">회원가입</button>
			</div>

			</ul>
		</div>
	</form>
</body>
</html>
