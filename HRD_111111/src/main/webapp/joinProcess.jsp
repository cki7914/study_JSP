<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;
	Statement stmt = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	int result;
	
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	try{
		conn = JDBConnection.getConnection();
		
		String sql = "INSERT INTO member_tbl_02 VALUES(?, ?, ?, ?, ?, ?, ?)";
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, custno);
		psmt.setString(2, custname);
		psmt.setString(3, phone);
		psmt.setString(4, address);
		psmt.setString(5, joindate);
		psmt.setString(6, grade);
		psmt.setString(7, city);
		result = psmt.executeUpdate();
		
		response.sendRedirect("list.jsp");
	} catch(Exception e){
		e.printStackTrace();
	}
%>