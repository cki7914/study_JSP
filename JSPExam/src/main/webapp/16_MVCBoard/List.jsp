<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 첨부형 게시판 - 목록보기(List)</h2>
	
	<!-- 검색창 만들기 -->
	<form action="/model2/ListController" method="get">
		<table border="1" width="90%">
			<tr>
				<td align="center">
					<select name="searchField">
						<option value="TITLE">제목</option>
						<option value="CONTENT">내용</option>
					</select>
					<input type="text" name="searchWord" />
					<input type="submit" value="검색" />
				</td>
			</tr>
		</table>
	</form>
	
	<table border="1" width="90%">
		<tr>
			<th width="10%">번호</th>
			<th width="*">제목</th>
			<th width="15%">작성자</th>
			<th width="10%">조회수</th>
			<th width="15%">작성일</th>
			<th width="10%">첨부파일</th>
		</tr>
		<c:choose>
			<c:when test="${ empty boardLists }">
				<tr>
					<td colspan="6" align="center">등록된 게시물이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<!-- items : 반복하고자 하는 컬렉션 객체, var : 변수명, varStatus : 반복상태를 확인할 수 있는 변수 -->
				<c:forEach items="${ boardLists }" var="row" varStatus="loop">
					<tr align="center">
						<td>${ map.totalCount - (((map.pageNum - 1) * map.pageSize) + loop.index) }</td>
						<td><a href="../model2/view.do?idx=${ row.idx }">${ row.title }</a></td>
						<td>${ row.name }</td>
						<td>${ row.visitcount }</td>
						<td>${ row.postdate }</td>
						<td>
							<c:if test="${ not empty row.ofile }">
								<a href="../model2/download.do?idx=${ row.idx }&ofile=${ row.ofile }&sfile=${ row.sfile}">[Down]</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	
	<table border="1" width="90%">
		<tr align="center">
			<td>${ map.pagingImg }</td>
			<td><button type="button" onclick="location.href='../model2/write.do'">글쓰기</button></td>
		</tr>
	</table>
</body>
</html>