<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// LoginForm 에서 가져온 아이디와 패스워드
	String userId = request.getParameter("user_id");
	String userPw = request.getParameter("user_pw");
	
	// web.xml에서 정보를 가져와 DB 연결
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleUrl = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePw = application.getInitParameter("OraclePw");
	
	MemberDAO dao = new MemberDAO(oracleDriver, oracleUrl, oracleId, oraclePw);
	MemberDTO memberDTO = dao.getMemberDTO(userId, userPw);
	dao.close();
	
	if(memberDTO.getId() != null) {
		session.setAttribute("UserId", memberDTO.getId());
		session.setAttribute("UserName", memberDTO.getName());
		response.sendRedirect("LoginForm.jsp");
	} else {
		request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
%>