<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>2초에 한번씩 새로고침하기</p>
	
	<%
		response.setIntHeader("Refresh" , 2);
	%>
	
	<%= (new java.util.Date()) %>
</body>
</html>