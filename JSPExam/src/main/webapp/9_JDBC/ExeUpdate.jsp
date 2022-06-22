<%@page import="java.sql.PreparedStatement"%>
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
	<h2>회원 추가하기(executeUpdate() 사용)</h2>
	<%
		// 1. DB 연결
		JDBConnect jdbc = new JDBConnect();
		
		// 2. 입력할 값 준비하기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		// 3. 쿼리문 생성
		// 3-1. SQL문을 문자열로 정의
		String sql = "INSERT INTO MEMBER VALUES(?, ?, ?, SYSDATE)";
		
		// 3-2. PreparedStatement 객체 생성
		PreparedStatement psmt = jdbc.con.prepareStatement(sql);
		
		// 3-3. 인파라미터에 실제 값을 대입
		psmt.setString(1, id);
		psmt.setString(2, pw);
		psmt.setString(3, name);
		
		// 4. 쿼리문 실행
		int inResult = psmt.executeUpdate();
		System.out.println(inResult + "행이 입력되었습니다.");
		out.println(inResult + "행이 입력되었습니다.");
		
		// 5. DB 연결 해제
		jdbc.close();
	%>
</body>
</html>