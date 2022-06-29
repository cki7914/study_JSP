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
	<c:set var="number" value="100" />
	
	<h2>choose를 이용하여 홀/짝 구분하기</h2>
	<c:choose>
		<c:when test="${ number mod 2 eq 0 }">${ number }는 짝수입니다.</c:when>
		<c:when test="${ number mod 2 eq 1 }">${ number }는 홀수입니다.</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
	
	<h2>국, 영, 수 점수를 입력하면 평균과 학점을 계산</h2>
	<form>
		국어 : <input type="text" name="kor"/><br>
		영어 : <input type="text" name="eng"/><br>
		수학 : <input type="text" name="math"/><br>
		<input type="submit" value="학점계산하기"/>
	</form>
	<!-- 모든 과목의 점수가 입력되었는지 확인 -->
	<c:if test="${ not(empty param.kor or empty param.eng or empty param.math) }">
		<!-- 평균 계산 (평균 점수 : __점) -->
		<c:set var="avg" value="${ (param.kor + param.eng + param.math) / 3 }" />
		평균은 ${ avg }점으로 
		
		<!-- 평균을 이용해 학점 출력 -->
		<!-- 90이상 : A, 80이상 : B, 70이상 : C, 60점 이상 : D, 나머지 F -->
		<c:choose>
			<c:when test="${ avg ge 90 }">A학점입니다.</c:when>
			<c:when test="${ avg ge 80 }">B학점입니다.</c:when>
			<c:when test="${ avg ge 70 }">C학점입니다.</c:when>
			<c:when test="${ avg ge 60 }">D학점입니다.</c:when>
			<c:otherwise>F학점입니다.</c:otherwise>
		</c:choose>
	</c:if>
	
	<!-- 출력 결과 -->
	<!-- 평균은 __점으로 _학점입니다. -->
</body>
</html>