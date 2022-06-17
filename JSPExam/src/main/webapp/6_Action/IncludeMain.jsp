<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String outerPath1 = "./Include/OuterPage1.jsp";
	String outerPath2 = "./Include/OuterPage2.jsp";
	
	pageContext.setAttribute("pAttr", "집에가자");
	request.setAttribute("rAttr", "지금당장");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>지시어 방식으로 포함하기</h2>
	<%@ include file="./Include/OuterPage1.jsp" %>
	<%-- <%@ include file=<%= outerPath1 %> %> --%>
	<p>외부 파일의 변수 확인하기 : <%= newVar1 %></p>
	
	<h2>액션태그 방식으로 포함하기</h2>
	<jsp:include page="./Include/OuterPage2.jsp"></jsp:include>
	<jsp:include page="<%= outerPath2 %>"></jsp:include>
	<%-- <p>외부 파일의 변수 확인하기 : <%= newVar2 %></p> --%>
</body>
</html>