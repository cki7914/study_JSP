<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 변수 선언 -->
<c:set var="scopeVar" value="page 영역" scope="page" />
<c:set var="scopeVar" value="request 영역" scope="request" />
<c:set var="scopeVar" value="session 영역" scope="session" />
<c:set var="scopeVar" value="application 영역" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>변수값 출력하기</h2>
	<ul>
		<li>scopeVar : ${ scopeVar }</li>
		<li>requestScope : ${ requestScope.scopeVar }</li>
		<li>sessionScope : ${ sessionScope.scopeVar }</li>
		<li>applicationScope : ${ applicationScope.scopeVar }</li>
	</ul>
	
	<h2>session 영역에서 삭제하기</h2>
	<c:remove var="scopeVar" scope="session" />
	<ul>
		<li>scopeVar : ${ scopeVar }</li>
		<li>requestScope : ${ requestScope.scopeVar }</li>
		<li>sessionScope : ${ sessionScope.scopeVar }</li>
		<li>applicationScope : ${ applicationScope.scopeVar }</li>
	</ul>
	
	<h2>영역 지정 없이 삭제하기</h2>
	<c:remove var="scopeVar" />
	<ul>
		<li>scopeVar : ${ scopeVar }</li>
		<li>requestScope : ${ requestScope.scopeVar }</li>
		<li>sessionScope : ${ sessionScope.scopeVar }</li>
		<li>applicationScope : ${ applicationScope.scopeVar }</li>
	</ul>
</body>
</html>