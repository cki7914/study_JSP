<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.println("오늘 날짜와 시간 <br>");
	
		// java.util.Calendar : 날짜와 시간을 처리하기위해 Calendar사용
		// .getInstance() : 시스템의 날짜와 시간을 가져옴
		// .getTime() : 현재의 날짜와 시간을 Date객체로 변환
		out.println(java.util.Calendar.getInstance().getTime());
	%>
</body>
</html>