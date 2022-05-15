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
		String log_id = request.getParameter("p_id");
		String log_pw = request.getParameter("p_pw");
		
		
		String driverName="com.mysql.jdbc.Driver"; // DBMS마다 다르다.
		String url="jdbc:mysql://localhost:3306/odbo";
		String username="root";
		String password="1234";
		Connection conn = null;
		try{
			//2. 드라이브 로딩
			Class.forName(driverName);
			//3. 연동
			conn = DriverManager.getConnection(url,username,password);
			PreparedStatement pstmt = conn.prepareStatement("SELECT passwd FROM members WHERE id=?");
			pstmt.setString(1,log_id);
			// 아이디가 db에 있는지 비교해야
			
			
			ResultSet quer = pstmt.executeQuery();
			
			
			if(quer.next()) {
				if(quer.getString("passwd").equals(log_pw)){
					out.print("로그인 성공");
					// 다음 화면으로 넘어가기
				}
				else 
					out.print("비밀번호가 올바르지 않습니다.");
			}
			else {
				out.print("로그인 정보를 확인해주세요");
			}
			
		} catch(ClassNotFoundException e) {
			out.println(">> 연결 실패 : 드라이버 복사 필요" );
		} catch(SQLException e) {
			out.println(">> 연결 실패 : SQL 명령문 확인 필요");
		} finally{ // 예외가 발생하든 안하든 무조건 실행되는 부분
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
