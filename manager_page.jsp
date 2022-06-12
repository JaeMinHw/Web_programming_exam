<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>

<script type="text/javascript">	
		function checkFun() 
		{
			var f = document.find_form;
			if(f.find_ID.value == "")
			{
				alert("검색할 이름 혹은 관리번호를 입력해 주세요.");
				f.uID.focus();
				return false;
			}
			else return true;
		}
</script>
</head>
<body>
	<%  String u_id1 = request.getParameter("find_ID");	
	%>
		<form action="manager_page.jsp" method="post"  name = "find_form" onsubmit="return checkFun()" > 
	<input type="submit" value=" ◀ 검색 " > <br>
		<tr height="30">
		 <select name="cate">
        <option value="user"selected>독거인</option>
        <option value="master">마스터 보호자</option>
        <option value="protecter">보호자 </option>
    </select>
		<td align="right"> 검색할 이름 혹은 관리번호 &nbsp;</td>
		<td><input type="text" name="find_ID"></td>
	</tr>
	</form>
	<br><br>
	회원 정보 관리
	
	<% 

	
	if(session.getAttribute("memberId")==null)
	{
		response.sendRedirect("form_member_home.jsp");
	}
	else if(!((session.getAttribute("membertype")).equals("MANAGER")))
	{
		response.sendRedirect("form_member_home.jsp");
	}
	
	%>
	<hr>
	
	<% 
		String membername = (String)session.getAttribute("memberType");
		out.println("새로운 세션 생성 성공 ! <br>");
		out.println("" + membername + " 님이 입장하였습니다. <p>");
		String u_id = request.getParameter("userID");
		String u_pw = request.getParameter("userPW");
		
		
		String str="";
		String str1="";
		String str2="";
		int count = 1;
		System.out.println(u_id1);
		
	%>
	
	<table border = "1">
		
		<% 
	
		if(u_id1 != null)
		{
			Statement sm1 = conn.createStatement();
			ResultSet rs1 = sm1.executeQuery("SELECT * FROM user where userNum like '%" +u_id1+ "%' or userName like '%" +u_id1+ "%' ");
			
			while(rs1.next())
			{
				str += "<tr>" + "<td>" +"<center>" + count + "</td>" + "<td>" + rs1.getString("userNum") + "</td>" + "<td>" + rs1.getString("userName") + "</td>" +"<td>" + rs1.getString("userPassword") + "</td>" +"<td>" +  rs1.getString("userPhone") + "</td>" + "<td>" + "<center>" + "<a href='modify.jsp?Uid="+rs1.getString("userNum")+"'> □ </a>" +"<td>" + "<center>" + "<a href='delete_ch.jsp?Uid="+rs1.getString("userNum")+"'> X</a>" + "</td>" + "</tr>";
				count++;
			}
			 out.print("<tr> <td> NO </td> <td>userNum</td> <td>userName</td> <td>userPassword</td> <td>userPhone</td> <td>수정</td> <td>삭제</td> </tr>");
	     out.print(str);
	     rs1.close();
			sm1.close();
			conn.close();	
			
		}
		else
		{
			Statement sm = conn.createStatement();
			
			ResultSet rs = sm.executeQuery("SELECT userNum, userName, userPassword, userPhone FROM user ");
			
		
			
			while(rs.next())
			{
				str += "<tr>" + "<td>" +"<center>" + count + "</td>" + "<td>" + rs.getString("userNum") + "</td>" + "<td>" + rs.getString("userName") + "</td>" +"<td>" + rs.getString("userPassword") + "</td>" +"<td>" +  rs.getString("userPhone") + "</td>" + "<td>" + "<center>" + "<a href='modify.jsp?Uid="+rs.getString("userNum")+"'> □ </a>" +"<td>" + "<center>" + "<a href='delete_ch.jsp?Uid="+rs.getString("userNum")+"'> X</a>" + "</td>" + "</tr>";
				count++;
			}
			 out.print("<tr> <td> NO </td> <td>userNum</td> <td>userName</td> <td>userPassword</td> <td>userPhone</td> <td>수정</td> <td>삭제</td> </tr>");
		   out.print(str);
		   rs.close();
		 	 sm.close();
		 	 
		 	 out.println();
		 	 
		 	 out.println();
		 	
		 	 Statement sm1 = conn.createStatement();
		 	 ResultSet rs1 = sm1.executeQuery("SELECT userNum, masName, masPassword, masPhone FROM master ");
			 while(rs1.next())
				{
					str1 += "<tr>" + "<td>" +"<center>" + count + "</td>" + "<td>" + rs.getString("userNum") + "</td>" + "<td>" + rs.getString("masName") + "</td>" +"<td>" + rs.getString("masPassword") + "</td>" +"<td>" +  rs.getString("masPhone") + "</td>" + "<td>" + "<center>" + "<a href='modify.jsp?Uid="+rs.getString("userNum")+"'> □ </a>" +"<td>" + "<center>" + "<a href='delete_ch.jsp?Uid="+rs.getString("userNum")+"'> X</a>" + "</td>" + "</tr>";
					count++;
				}
			 
			 out.println();
			 out.println();
				
			 out.print("<tr> <td> NO </td> <td>userNum</td> <td>masName</td> <td>masPassword</td> <td>masPhone</td> <td>수정</td> <td>삭제</td> </tr>");
			   out.print(str1);
			   rs1.close();
				 sm1.close();
				
					Statement sm2 = conn.createStatement();
					ResultSet rs2 = sm2.executeQuery("SELECT userNum, proName, proPassword, proPhone FROM protecter ");
			   while(rs2.next())
				{
					str2 += "<tr>" + "<td>" +"<center>" + count + "</td>" + "<td>" + rs.getString("userNum") + "</td>" + "<td>" + rs.getString("proName") + "</td>" +"<td>" + rs.getString("proPassword") + "</td>" +"<td>" +  rs.getString("proPhone") + "</td>" + "<td>" + "<center>" + "<a href='modify.jsp?Uid="+rs.getString("userNum")+"'> □ </a>" +"<td>" + "<center>" + "<a href='delete_ch.jsp?Uid="+rs.getString("userNum")+"'> X</a>" + "</td>" + "</tr>";
					count++;
				}
			   
			   out.println();
			   out.println();
				 out.print("<tr> <td> NO </td> <td>userNum</td> <td>proName</td> <td>proPassword</td> <td>proPhone</td> <td>수정</td> <td>삭제</td> </tr>");
			   out.print(str2);
			   
		     rs2.close();
		     sm2.close();

				 
			conn.close();
			
			
			
		}
		
		
		
		
		
		%>
		
	
	</table>
	
	
	
	<hr>
	<table border="0">
		<tr>
		
			<td>
				<form action="logout.jsp" method="post" >
					<input type="submit" value=" 로그 아웃 ▶" >
				</form>
			</td>
		</tr>
	</table>  

</body>
</html>