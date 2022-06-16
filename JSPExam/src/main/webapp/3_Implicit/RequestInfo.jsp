<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>클라이언트 IP : <%= request.getRemoteAddr() %></p>
	
	<!-- 웹 브라우저의 요청 정보의 길이를 가져옴 -->
	<p>요청 정보의 길이 : <%= request.getContentLength() %></p>
	
	<p>요청 정보 인코딩 : <%= request.getCharacterEncoding() %></p>
	
	<p>요청 컨텐츠 유형 : <%= request.getContentType() %></p>
	
	<p>요청 정보 프로토콜 : <%= request.getProtocol() %></p>
	
	<p>유청 정보 전송 방식 : <%= request.getMethod() %></p>
	
	<!-- 
		URL과 URI의 차이 : 호스트 포함 여부
		URL : 호스트를 포함한 전체 주소
		URI : 호스트를 제외한 컨텍스트
	 -->
	<p>요청 URL : <%= request.getRequestURL() %></p>
	
	<p>요청 URI : <%= request.getRequestURI() %></p>
	
	<p>컨텍스트 경로 : <%= request.getContextPath() %></p>
	
	<p>서버 이름 : <%= request.getServerName() %></p>
	
	<p>서버 포트 : <%= request.getServerPort() %></p>
	
	<!--
		쿼리스트링 : URL뒤에 "?키=값&키=값..." 형태로 작성된 부분
		쿼리스트링 중에서 특정 키의 값을 얻어오려면 getParameter("키값") 사용
	-->
	<p>쿼리스트링 : <%= request.getQueryString() %></p>
	
	<p>전송된 값 1 : <%= request.getParameter("eng") %></p>
	
	<p>전송된 값 2 : <%= request.getParameter("han") %></p>
</body>
</html>