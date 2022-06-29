<%@page import="java.util.*"%>
<%@page import="common.Person"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>List 컬렉션 활용하기</h2>
	<%
		LinkedList<Person> lists = new LinkedList<>();
		lists.add(new Person("김그린", 11));
		lists.add(new Person("최자바", 22));
		lists.add(new Person("박제이", 33));
	%>
	<c:set var="lists" value="<%= lists %>" />
	<c:forEach var="list" items="${ lists }">
		<li>이름 : ${ list.name }, 나이 : ${ list.age }</li>
	</c:forEach>
	
	<h2>Map 컬렉션 활용하기</h2>
	<%
		Map<String, Person> maps = new HashMap<>();
		maps.put("1st", new Person("김그린", 99));
		maps.put("2nd", new Person("최자바", 88));
		maps.put("3rd", new Person("박제이", 77));
	%>
	
	<c:set var="maps" value="<%= maps %>" />
	<c:forEach var="map" items="${ maps }">
		<li>key : ${ map.key }<br>value : 이름 - ${ map.value.name }, 나이- ${ map.value.age }</li>
	</c:forEach>
</body>
</html>