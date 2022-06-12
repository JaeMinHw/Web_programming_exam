<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 확인 창</title>
</head>
<body>
	<%
		String log_id = (request.getParameter("p_id"));
		String log_pw = request.getParameter("p_pw");
		String log_ty = request.getParameter("who");
		
		// 보호자인지 독거인인지 확인
		String who1=request.getParameter("who");
		int who_num;
		
		String [] dblist = {"USER","MASTER","PROTECTER","MANAGER"};
		if(who1.equals("USER"))
			who_num = 0;
		else if(who1.equals("MASTER"))
			who_num = 1;
		else if(who1.equals("PROTECTER"))
			who_num = 2;
		else 
			who_num = 3;
		
		
		String driverName="com.mysql.jdbc.Driver"; // DBMS마다 다르다.
		String url="jdbc:mysql://localhost:3306/odbo";
		String username="root";
		String password="1234";
		Connection conn = null;
		
		// 독거인

			try{
				//2. 드라이브 로딩
				Class.forName(driverName);
				//3. 연동
				conn = DriverManager.getConnection(url,username,password);
				// 아이디가 db에 있는지?
				// 있다면 아이디와 패스워드가 동일한지
				if(who_num ==0) {
					PreparedStatement pstmt = conn.prepareStatement("SELECT userPassword FROM user WHERE userNum=?");
					pstmt.setString(1,log_id);
					// 아이디가 db에 있는지 비교해야
					ResultSet quer = pstmt.executeQuery();
					if(quer.next()) {
						if(quer.getString("userPassword").equals(log_pw)){
							session.setAttribute("membertype",dblist[0]);
							session.setAttribute("memberId", log_id);
							session.setAttribute("memberPw", log_pw);
							%>
							<script type="text/javascript">
							alert("로그인 성공");
							location.href=("homemain.jsp");
							</script>
							<%
							// 다음 화면으로 넘어가기
							
							
							
						}
						else {
							%>
							<script type="text/javascript">
							alert("비밀번호가 올바르지 않습니다.");
							location.href=("form_member_home.jsp");
							</script>
							<%
							
							
						}
					}
					else {
						%>
						<script type="text/javascript">
						alert("로그인 정보를 확인해주세요");
						location.href=("form_member_home.jsp");
						</script>
						<%
					}
				}
				else if(who_num ==1) {
					PreparedStatement pstmt = conn.prepareStatement("SELECT masPassword FROM MASTER WHERE userNum=?");
					pstmt.setString(1,log_id);
					// 아이디가 db에 있는지 비교해야
					ResultSet quer = pstmt.executeQuery();
					if(quer.next()) {
						if(quer.getString("masPassword").equals(log_pw)){
							session.setAttribute("membertype",dblist[1]);
							session.setAttribute("memberId", log_id);
							session.setAttribute("memberPw", log_pw);
							%>
							<script type="text/javascript">
							alert("로그인 성공");
							</script>
							<%
							// 다음 화면으로 넘어가기
							response.sendRedirect("homemain.jsp");
						}
						else 
							%>
							<script type="text/javascript">
							alert("비밀번호가 올바르지 않습니다.");
							location.href=("form_member_home.jsp");
							</script>
						<%
					}
					else {
						%>
						<script type="text/javascript">
						alert("로그인 정보를 확인해주세요");
						location.href=("form_member_home.jsp");
						</script>
						<%
						
					}
				}
				else if(who_num ==2) {
					PreparedStatement pstmt = conn.prepareStatement("SELECT proPassword FROM PROTECTER WHERE userNum=?");
					pstmt.setString(1,log_id);
					// 아이디가 db에 있는지 비교해야
					ResultSet quer = pstmt.executeQuery();
					if(quer.next()) {
						if(quer.getString("proPassword").equals(log_pw)){
							session.setAttribute("membertype",dblist[2]);
							session.setAttribute("memberId", log_id);
							session.setAttribute("memberPw", log_pw);
							%>
							<script type="text/javascript">
							alert("로그인 성공");
							location.href=("homemain.jsp");
							</script>
							<%
							// 다음 화면으로 넘어가기
							
						}
						else {
						%>
							<script type="text/javascript">
							alert("비밀번호가 올바르지 않습니다.");
							location.href=("form_member_home.jsp");
							</script>
						<%
						
						}
					}
					else {
						%>
						<script type="text/javascript">
						alert("로그인 정보를 확인해주세요");
						location.href=("form_member_home.jsp");
						</script>
						<%
					}
				}
				
				else if(who_num ==3)
				{
					PreparedStatement pstmt = conn.prepareStatement("SELECT PW FROM MANAGER WHERE ID=?");
					pstmt.setString(1,log_id);
					
					ResultSet quer = pstmt.executeQuery();
					if(quer.next()) {
						if(quer.getString("PW").equals(log_pw)){
							session.setAttribute("membertype",dblist[3]);
							session.setAttribute("memberId", log_id);
							session.setAttribute("memberPw", log_pw);
							out.println((session.getAttribute("memberType")));
							%>
							<script type="text/javascript">
							alert("로그인 성공");
							location.href=("show_who.jsp"); // 관리자 페이지로 이동시켜주기 회원 삭제할 수 있게
							</script>
							<%
							// 다음 화면으로 넘어가기
							
						}
						else {
						%>
							<script type="text/javascript">
							alert("비밀번호가 올바르지 않습니다.");
							location.href=("form_member_home.jsp");
							</script>
						<%
						
						}
					}
					else {
						%>
						<script type="text/javascript">
						alert("로그인 정보를 확인해주세요");
						location.href=("form_member_home.jsp");
						</script>
						<%
					}
				}

				
			} catch(ClassNotFoundException e) {
				out.println(">> 연결 실패 : 드라이버 복사 필요" );
			}catch(SQLException e) {
				out.println(">> 연결 실패 : SQL 명령문 확인 필요");
			}  finally{ // 예외가 발생하든 안하든 무조건 실행되는 부분
				//5.닫기
				try{
					if(conn != null) 
						conn.close();
				} catch(SQLException e){
					;
				}
			}
		
	%>
</body>
</html>
