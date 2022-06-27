<%@page import="model1.BoardDTO"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%
	String num = request.getParameter("num"); // 일련번호 받기
	BoardDAO dao = new BoardDAO(application); // DAO 생성
	BoardDTO dto = dao.selectView(num);
	dao.close();
	
	String sessionId = session.getAttribute("UserId").toString();
	if(!sessionId.equals(dto.getId())) {
		JSFunction.alertBack("작성자만 수정할 수 있습니다.", out);
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		function validateForm(form) {
			if(form.title.value == "") {
				alert("제목을 입력하세요");
				form.title.focus();
				return false;
			}
			if(form.content.value == "") {
				alert("내용을 입력하세요");
				form.content.focus();
				return false;
			}
		}
	</script>
	
	<jsp:include page="./Link.jsp"></jsp:include>
	
	<h2>회원제 게시판 - 수정하기</h2>
	<form name="EditForm" method="post" onsubmit="return validateForm(this)" action="./EditProcess.jsp">
		<input type="hidden" name="num" value="<%= dto.getNum() %>">
		<table border="1" width="90%">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" style="width:90%" value="<%= dto.getTitle() %>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" style="width:90%; height:100px"><%= dto.getContent() %></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성완료</button>
					<button type="reset">초기화</button>
					<button type="button" onclick="location.href='./List.jsp'">목록 보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>