<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>예외 처리하기</h2>
	<% int num1 = 100; %>
	<c:catch var="msg">
		<% int result = num1 / 0; %>
	</c:catch>
	예외 내용 : ${ msg }
	
	<h2>EL에서의 예외</h2>
	<c:set var="num2" value="200" />
	<c:catch var="msg">
		${ num2 + "원" }
	</c:catch>
	예외 내용 : ${ msg }
</body>
</html>