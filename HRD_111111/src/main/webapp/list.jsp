<%@page import="java.sql.*"%>
<%@page import="DBPKG.JDBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./style.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="./header.jsp" />
	
	<%
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String grade = "";
		
		try{
			conn = JDBConnection.getConnection();
			stmt = conn.createStatement();
			
			String sql = "SELECT * FROM member_tbl_02 ORDER BY custno";
			rs = stmt.executeQuery(sql);
	%>
	
	<section>
        <h2>회원목록조회/수정</h2>
        <form action="">
        	<table border="1">
        		<tr>
        			<th>회원번호</th>
        			<th>회원성명</th>
        			<th>전화번호</th>
        			<th>주소</th>
        			<th>가입일자</th>
        			<th>고객등급</th>
        			<th>거주지역</th>
        		</tr>
        		<%
	        			while(rs.next()){
	        				grade = rs.getString("grade");
	        				
	        				switch(grade){
	        				case "A" :
	        					grade = "VIP";
	        					break;
	        				case "B" :
	        					grade = "일반";
	        					break;
	        				case "C" :
	        					grade = "직원";
	        					break;
	        				}
	        	%>
	        		<tr>
	        			<td><a href=""><%= rs.getString("custno") %></a></td>
	        			<td><%= rs.getString("custname") %></td>
	        			<td><%= rs.getString("phone") %></td>
	        			<td><%= rs.getString("address") %></td>
	        			<td><%= rs.getString("joindate") %></td>
	        			<td><%= grade %></td>
	        			<td><%= rs.getString("city") %></td>
	        		</tr>
	        	<%
	        			}
					} catch(Exception e){
						e.printStackTrace();
					}
        		%>
        	</table>
        </form>
    </section>
    
    <jsp:include page="./footer.jsp" />
</body>
</html>