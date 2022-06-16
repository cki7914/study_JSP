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
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		// 사용자의 id와 pw를 가져오기
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		if(id.equals("admin") && pw.equals("1234"))
			response.sendRedirect("ResponseWelcome.jsp");
		else {
			// 로그인에 실패하면 ResponseMain으로 전달됨.
			// forward() : 페이지의 이동과는 다르게 제어 흐름을 넘겨주고자 할 때 사용
			// 쿼리 스트링을 이용하여 로그인 성공 여부를 알려줌
			request.getRequestDispatcher("ResponseMain.jsp?loginErr=1").forward(request , response);
		}
	%>
</body>
</html>