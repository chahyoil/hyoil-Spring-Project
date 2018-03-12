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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
</head>
<body>
	<table>
		<caption>사용자 리스트</caption>
		<tr>
			<th>제품번호</th>
			<th>제품명</th>
			<th>제품설명</th>
			<th>제품평점</th>
			<th>제품이미지</th>
			<th>제품등록날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${admin_UserList}" var="admin_UserList">
		<tr>
		  <td>${admin_UserList.mid }</td>
		  <td>${admin_UserList.mname }</td>
		  <td>${admin_UserList.mtel }</td>
		  <td>${admin_UserList.mpostnum }</td>
		  <td>${admin_UserList.maddress }</td>
		  <td>${admin_UserList.mjoindate }</td>
		  <td>${admin_UserList.mlevelno }</td>
		</tr>
		
 
		<tr>
			<td><input type="button" value="이용자 블럭" onclick="location.href='admin_Block.do?mid=${admin_UserList.mid }'"></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>