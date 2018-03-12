<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
</head>
<body>
	<div>
	 <a href="admin_ReviewData.do">이용자 상품후기 리스트</a>
	</div>
	<div>
	 <a href="admin_OrderList.do">이용자 주문리스트</a>
	</div>
	<div>
	 <a href="admin_UserList.do">전체 회원 정보 리스트 출력(페이징처리)</a>
	</div>
	<div>
	 <a href="productAllList.do">관리자 물품관리 창</a>
	</div>
	
</body>
</html>