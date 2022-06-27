<%@page import="model1.BoardDTO"%>
<%@page import="model1.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num = request.getParameter("num"); // 일련번호 매개변수
	BoardDAO dao = new BoardDAO(application); // DAO 객체 생성
	dao.updateVisitCount(num); // 조회수 증가
	BoardDTO dto = dao.selectView(num); // 게시글 가져오기
	dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="./Link.jsp"></jsp:include>
	
	<script>
		function deletePost() {
			let confirmed = confirm("정말로 삭제하시겠어요?");
			if(confirmed) {
				let form = document.viewForm;
				form.method = "post";
				form.action = "DeleteProcess.jsp";
				form.submit();
			}
		}
	</script>
	
	<h2>회원제 게시판 - 상세보기</h2>
	<form name="viewForm">
		<input type="hidden" name="num" value="<%= dto.getNum() %>">
		<table border="1" width="90%">
			<tr>
				<td>번호</td>
				<td><%= dto.getNum() %></td>
				<td>작성자</td>
				<td><%= dto.getName() %></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td><%= dto.getPostdate() %></td>
				<td>조회수</td>
				<td><%= dto.getVisitCount() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3"><%= dto.getTitle() %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"><%= dto.getContent().replace("\r\n", "<br>") %></td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<button type="button" onclick="location.href='./Edit.jsp?num=<%= dto.getNum() %>'">수정하기</button>
					<button type="button" onclick="deletePost()">삭제하기</button>
					<button type="button" onclick="location.href='./List.jsp'">목록보기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>