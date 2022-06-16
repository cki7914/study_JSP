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
		// 버퍼의 내용 삭제하기
		out.print("출력시켜줘!");
		/* out.clearBuffer(); */
		
		out.print("<h2>out 내장 객체<h2>");
		
		// 현재 페이지에 설정된 버퍼의 크기를 가져옴
		out.print("출력 버퍼의 크기 : " + out.getBufferSize() + "<br>");
		out.print("남은 버퍼의 크기 : " + out.getRemaining() + "<br>");
		
		// 버퍼에 저장된 내용을 강제로 출력함
		out.flush();
		out.print("flush이후 남은 버퍼의 크기 : " + out.getRemaining() + "<br>");
		
		out.print(1);
		out.print(true);
		out.print('가');
		out.print("남은 버퍼의 크기 : " + out.getRemaining() + "<br>");
	%>
</body>
</html>