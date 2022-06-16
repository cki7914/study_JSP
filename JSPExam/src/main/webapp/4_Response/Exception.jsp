<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// response 내장 객체로부터 에러 코드 확인하기
		int err = response.getStatus();
		if(err == 404) {
			out.print("404 에러 발생<br>");
			out.print("파일의 경로를 확인해주세요.");
		} else if(err == 405) {
			out.print("405 에러 발생<br>");
			out.print("전송방식을 확인해주세요.");
		} else if(err == 500) {
			out.print("500 에러 발생<br>");
			out.print("코드에 오류가 있는지 확인해주세요.");
		}
	%>
</body>
</html>