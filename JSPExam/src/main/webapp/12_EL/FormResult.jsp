<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>EL로 폼값 받기</h2>
	<ul>
		<li>이름 : ${ param.name }</li>
		<li>성별 : ${ param.gender }</li>
		<li>학력 : ${ param.grade }</li>
		<li>관심사항 : 
			${ paramValues.inter[0] }
			${ paramValues.inter[1] }
			${ paramValues.inter[2] }
			${ paramValues.inter[3] }
		</li>
		<li> 표현식 이용 :
			<%
				String[] InterArr = request.getParameterValues("inter");
				out.println(InterArr[0]);
			%>
		</li>
	</ul>
</body>
</html>