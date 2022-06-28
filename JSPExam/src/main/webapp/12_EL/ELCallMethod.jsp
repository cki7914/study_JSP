<%@page import="el.MyELClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MyELClass myClass = new MyELClass();
	pageContext.setAttribute("myClass", myClass);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>영역에 저장한 후 메서드 호출하기</h2>
	911122-1236598 -> ${ myClass.getGender("911122-1236598") }<br>
	911122-4236598 -> ${ myClass.getGender("911122-4236598") }<br>
	
	<h2>static 메서드 호출하기</h2>
	${ MyELClass.showGugudan(7) }
</body>
</html>