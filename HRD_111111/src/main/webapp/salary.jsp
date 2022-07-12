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
			
			String sql = "SELECT mem.custno, mem.custname, mem.grade, SUM(mon.price) price "
					   + "FROM member_tbl_02 mem INNER JOIN money_tbl_02 mon "
					   + "ON mem.custno = mon.custno "
					   + "GROUP BY mem.custno, mem.custname, mem.grade "
					   + "ORDER BY SUM(mon.price) DESC";
			rs = stmt.executeQuery(sql);
	%>

	<section>
        <h2>회원매출조회</h2>
        <form action="">
        	<table border="1">
        		<tr>
        			<th>회원번호</th>
        			<th>회원성명</th>
        			<th>고객등급</th>
        			<th>매출</th>
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
	    					<td><%= rs.getString("custno") %></td>
	    					<td><%= rs.getString("custname") %></td>
	    					<td><%= grade %></td>
	    					<td><%= rs.getString("price") %></td>
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