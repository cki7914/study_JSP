<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>MVC패턴으로 회원 인증하기</h2>
	<p>${ authMessage }</p>
	<br />
	<span><a href="./MemberAuth.mvc?id=admin_green&pw=1234">회원인증(관리자)</a></span>
	&nbsp;&nbsp;&nbsp;
	<span><a href="./MemberAuth.mvc?id=green&pw=1234">회원인증(회원)</a></span>
	&nbsp;&nbsp;&nbsp;
	<span><a href="./MemberAuth.mvc?id=strainger&pw=1234">회원인증(비회원)</a></span>
</body>
</html>