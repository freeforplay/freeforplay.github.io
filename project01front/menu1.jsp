<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더 -->
	<%@ include file="admin_header.jsp" %>
<ul>
	<li><a href="GetMemberListCtrl">회원 관리</a></li>
	<li><a href="GetNoticeListCtrl">게시판 관리</a></li>
	<li><a href="GetProductListCtrl">제품 관리</a></li>
	<li><a href="logout.jsp">로그아웃</a>
</ul>

<!-- 푸터 -->
	<%@ include file="admin_footer.jsp" %>
</body>
</html>