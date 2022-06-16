<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- post의 경우 한글이 깨져서 출력되므로 인코딩을 변경해주어야 함 -->
	<%
		request.setCharacterEncoding("UTF-8");
		
		// 전송되는 값이 하나인 경우 getParameter() 사용
		String id = request.getParameter("id");
		String gender = request.getParameter("gender");
		
		// 전송되는 값이 여러개인 경우 getParameterValues() 사용
		String[] hobbys = request.getParameterValues("hobbys");
		
		String hobbysStr = "";
		if(hobbys != null){
			for(String hobby : hobbys){
				hobbysStr += hobby + " , ";
			}
		}
		
		// textarea의 내용 가져오기
		String intro = request.getParameter("intro").replace("\r\n" , "<br>");
	%>
	
	<ul>
		<li>아이디 : <%= id %></li>
		<li>성별 : <%= gender %></li>
		<li>취미 : <%= hobbysStr %></li>
		<li>자기소개 : <%= intro %></li>
	</ul>
</body>
</html>