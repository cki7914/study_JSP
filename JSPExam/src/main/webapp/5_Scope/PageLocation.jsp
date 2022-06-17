<%@ page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>페이지 이동 후 속성값 확인하기</h2>
	<%
		Object pageInteger = pageContext.getAttribute("pageInteger");
		Object pageString = pageContext.getAttribute("pageString");
		Object pagePerson = pageContext.getAttribute("pagePerson");
	%>
	
	<ul>
		<li>Integer객체 : <%= (pageInteger == null) ? "값 없음" : pageInteger %></li>
		<li>String객체 : <%= (pageString == null) ? "값 없음" : pageString %></li>
		<li>Person객체 : <%= (pagePerson == null) ? "값 없음" : ((Person)pagePerson).getName() %></li>
	</ul>
</body>
</html>