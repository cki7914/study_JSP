<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 스크립틀릿 : JSP 페이지가 요청을 받을 때 실행되어야 할 자바 코드를 작성 -->
	<%
		int a = 2;
		int b = 4;
		int sum = a + b;
		out.println("2 + 4 = " + sum + "<br>");
	%>
	
	<%
		// 0부터 10까지의 숫자중에서 짝수를 출력하시오.
		for (int i=0; i<=10; i++) {
			if (i % 2 == 0) {
				out.println(i + "<br>");
			}
		}
	%>
</body>
</html>