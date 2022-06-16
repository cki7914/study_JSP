<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1. 환경정보 확인하기</h2>
	
	<a href="./RequestInfo.jsp?eng=Hello&han=안녕">GET 방식 전송</a>
	
	<br><br><br>
	
	<form action="./RequestInfo.jsp" method="post">
		영어 : <input type="text" name="eng" value="bye">
		한글 : <input type="text" name="han" value="잘가">
		<input type="submit" value="post 방식 전송">
	</form>
	
	<br><br><br>
	
	<h2>2. 요청 매개변수 확인하기</h2>
	<form method="post" action="RequestParameter.jsp">
		아이디 : <input type="text" value="" name="id"><br>
		성별 :
			<input type="radio" value="man" name="gender"> 남자
			<input type="radio" value="woman" name="gender"> 여자
			<br>
		취미 :
			<input type="checkbox" value="sports" name="hobbys"> 운동
			<input type="checkbox" value="book" name="hobbys"> 독서
			<input type="checkbox" value="dance" name="hobbys"> 댄스
			<br>
		자기소개 :
			<textarea cols="30" rows="5" name="intro"></textarea>
			<br>
		<input type="submit" value="전송">
	</form>
	
	<br><br><br>
	
	<h2>3. HTTP의 요청 헤더의 정보 확인하기</h2>
	
	<a href="RequestHeader.jsp">요청 헤더 정보 확인</a>
</body>
</html>