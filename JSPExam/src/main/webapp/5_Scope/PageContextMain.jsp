<%@ page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 속성 저장하기 -->
<%
	pageContext.setAttribute("pageInteger", 1000);
	pageContext.setAttribute("pageString", "페이지 영역의 문자");
	pageContext.setAttribute("pagePerson", new Person("김그린", 30));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>page영역의 속성값 읽어오기</h2>
	<%
		int pageInteger = (Integer)pageContext.getAttribute("pageInteger");
		String pageString = pageContext.getAttribute("pageString").toString();
		Person pagePerson = (Person)pageContext.getAttribute("pagePerson");
	%>
	
	<ul>
		<li>Integer객체 : <%= pageInteger %></li>
		<li>String객체 : <%= pageString %></li>
		<li>Person객체 : <%= pagePerson.getName() %>, <%= pagePerson.getAge() %></li>
	</ul>
	
	<h2>include된 파일에서 page영역 확인하기</h2>
	<%@ include file="PageInclude.jsp" %>
	
	<h2>페이지 이동 후 page영역 확인하기</h2>
	<a href="./PageLocation.jsp">PageLocation.jsp 바로가기</a>	
</body>
</html>