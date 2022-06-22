<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원 목록 조회하기</h2>
	<%
		// 1. DB 연결
		JDBConnect jdbc = new JDBConnect();
		
		// 2. 쿼리문 생성
		String sql = "SELECT ID, PASS, NAME, REGIDATE FROM MEMBER";
		
		Statement stmt = jdbc.con.createStatement();
		
		// 3. 쿼리 실행
		// ResultSet : 조회 결과를 담고 있는 집합
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			String id = rs.getString("ID");
			String pw = rs.getString("PASS");
			String name = rs.getString(3);
			java.sql.Date regidate = rs.getDate(4);
			
			out.println(String.format("%s %s %s %s",id, pw, name, regidate) + "<br>");
		}
		
		// 4. DB 연결 종료
		jdbc.close();
	%>
</body>
</html>