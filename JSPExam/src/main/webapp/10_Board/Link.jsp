<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table border="1" width="90%">
	<tr>
		<td align="center">
			<%
				if(session.getAttribute("UserId") == null) { // 로그아웃 상태
			%>
					<a href="../8_Session/LoginForm.jsp">로그인</a>	
			<%	
				} else { // 로그인 상태
			%>
					<a href="../8_Session/Logout.jsp">로그아웃</a>
			<%
				}
			%>
			&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="../10_Board/List.jsp">게시판(페이징X)</a>
		<a href=""></a></td>
	</tr>
</table>