<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="SendProcess.jsp" method="post">
		<table border="1">
			<tr>
				<td>보내는 사람 : <input type="text" name="from" value="" /></td>
			</tr>
			<tr>
				<td>받는 사람 : <input type="text" name="to" value="" /></td>
			</tr>
			<tr>
				<td>제목 : <input type="text" name="subject" value="" /></td>
			</tr>
			<tr>
				<td>
					형식 :
					<label><input type="radio" name="format" value="text" checked /> TEXT</label>
					<label><input type="radio" name="format" value="html" /> HTML</label>
				</td>
			</tr>
			<tr>
				<td><textarea name="content" cols="60" rows="10"></textarea></td>
			</tr>
			<tr>
				<td><button type="submit">전송하기</button></td>
			</tr>
		</table>
	</form>
</body>
</html>