<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="ErrorPage.jsp"%>
    <!-- ErrorPage의 디렉티브 태그에 작성한 에러를 가지고 여기에서
         errorPage = 새로 생성한 에러페이지.jsp라고 작성하면된다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 오류 발생을 해결하는 방법
		 1. 예외 처리 (try - catch)
		 2. 에러 페이지를 생성	
	 -->
	<%-- <%
	/* 1. 오류 발생에 대한 예외 처리 방법 */
		try{
		/* 자바코드 */
			int myAge = Integer.parseInt(request.getParameter("age")) + 10;
			out.println("10년 후 당신의 나이는 " + myAge + "살 입니다.");
		} catch (Exception e) {
			out.println("예외 발생 : 매개변수 age를 찾을 수 없습니다.");
		}
		<%-- age라는 변수가 없어서 에러남 --%>
	%> --%>
	
	
	<!-- 2. 오류 발생에 대한 에러 페이지 생성 (작성) -->
	<%
		int myAge = Integer.parseInt(request.getParameter("age")) + 10;
		out.println("10년 후 당신의 나이는 " + myAge + "살 입니다.");
	%>
</body>
</html>