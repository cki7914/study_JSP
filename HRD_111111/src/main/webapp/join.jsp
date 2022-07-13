<%@page import="DBPKG.JDBConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="./check.js"></script>
	
	<jsp:include page="./header.jsp" />
	
	<%
		Connection con = null;
		Statement stmt = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String custno = "";
		
		try {
			con = JDBConnection.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT MAX(custno)+1 custno FROM member_tbl_02";
			rs = stmt.executeQuery(sql);
			rs.next();
			custno = rs.getString(1);
		} catch(Exception e){
			e.printStackTrace();
		}
	%>
	
	<section>
		<h2>홈쇼핑 회원 등록</h2>
		<form action="joinProcess.jsp" name="frm" method="post">
			<table border="1">
				<tr>
					<td>회원번호</td>
					<td><input type="text" name="custno" value="<%= custno %>" readonly /></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" /></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" /></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address" /></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" /></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP,B:일반,C:직원]</td>
					<td><input type="text" name="grade" /></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="등록" onclick="return joinCheck();" />
						<input type="button" value="조회" />
					</td>
				</tr>
			</table>
		</form>
	</section>
	
	<jsp:include page="./footer.jsp" />
</body>
</html>