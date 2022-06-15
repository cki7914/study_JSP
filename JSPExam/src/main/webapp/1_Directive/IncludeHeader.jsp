<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- !가 붙은 것 : 변수를 선언 영역 -->    
<%!
	int pageCount = 0;
	void addCount() {
		pageCount++;
	}
%>

<% addCount(); %> <!-- 스크립틀릿 - 자바코드 작성가능 -->

<!-- 표현식. 출력문을 작성 -->
<p><%= pageCount %> 번째 방문입니다.</p>
