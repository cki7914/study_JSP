<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<h4>Include 페이지</h4>
	
	<%
		int pageInteger2 = (Integer)pageContext.getAttribute("pageInteger");
		/* String pageString2 = pageContext.getAttribute("pageString").toString(); */
		Person pagePerson2 = (Person)pageContext.getAttribute("pagePerson");
	%>
	
	<ul>
		<li>Integer객체 : <%= pageInteger2 %></li>
		<li>String객체 : <%= pageContext.getAttribute("pageString") %></li>
		<li>Person객체 : <%= pagePerson2.getName() %>, <%= pagePerson2.getAge() %></li>
	</ul>