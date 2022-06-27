<%@page import="model1.BoardDAO"%>
<%@page import="model1.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include	file="./IsLoggedIn.jsp" %>
<%
	String num = request.getParameter("num");
	BoardDAO dao = new BoardDAO(application);
	BoardDTO dto = dao.selectView(num);
	
	String id = session.getAttribute("UserId").toString();
	int result = 0;
	if(id.equals(dto.getId())) {
		dto.setNum(num);
		result = dao.deletePost(dto);
		dao.close();
		
		if(result == 1) {
			JSFunction.alertLocation("게시물이 삭제되었습니다.", "./List.jsp", out);
		} else {
			JSFunction.alertBack("삭제에 실패했습니다.", out);
		}
	} else {
		JSFunction.alertBack("작성자 본인만 삭제할 수 있습니다.", out);
		return;
	}
%>