<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1. 쿠키 설정</h2>
	<%
		Cookie cookie = new Cookie("myCookie", "쿠키맛있어요~");
		cookie.setPath(request.getContextPath()); // 프로젝트명을 컨텍스트루트로 설정
		cookie.setMaxAge(3600); // 쿠키의 유지시간을 1시간으로 설정
		response.addCookie(cookie);
	%>
	
	<h2>2. 쿠키 설정 후 쿠키값 확인하기</h2>
	<%
		// 요청 헤더의 모든 쿠키값 가져오기
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null){
			for(Cookie c : cookies){
				String cookieName = c.getName();
				String cookieValue = c.getValue();
				
				out.println(String.format("%s : %s<br>", cookieName, cookieValue));
			}
		}
	%>
	
	<h2>3. a태그를 이용하여 페이지 이동 후 확인하기</h2>
	<a href="CookieResult.jsp">쿠키 확인하기</a>
</body>
</html>