<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 표현식 : 값을 웹브라우저 화면에 출력할 때 사용함 -->
	<!-- import를 따로 안해주기 때문에 new 키워드를 사용하여 바로 선언 -->
	<p> 오늘 날짜 : <%= new java.util.Date() %></p>
	<br>
	
	<!--
		태그 안에 태그 사용 불가
		스크립틀릿 안에서 내용을 출력하려면 out.println 사용
		표현식을 사용하려면 스크립틀릿 태그 밖에서 사용해야함
	-->
	<%
		int a = 10;
		int b = 20;
		int c = 30;	
	%>
	
	<%= a+b+c %>
</body>
</html>