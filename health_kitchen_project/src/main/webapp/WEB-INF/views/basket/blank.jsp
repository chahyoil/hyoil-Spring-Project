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
			<tr>
				<td id="UpgradeAlert">${UpgradeAlert}</td>
				<th>장바구니리스트</th>
			</tr>
			<tr>
				<th>장바구니 번호</th>
				<th>회원이름</th>
				<th>제품명</th>
				<th>구매갯수</th>
				<th>총합</th>
			</tr>
			<c:forEach var="basket" items="${member_BasketList}">
			<tr class="basket_list">
					<td><input type="checkbox" name="bno" id="bno" value="${basket.bno }" >${basket.bno }</td>
					<td class="basket_mid">${basket.mid }</td>
					<td class="basket_pid">${basket.pid }</td>
					<td class="basket_bcount">${basket.bcount }</td>
					<td class="basket_btotal">${basket.btotal}</td>
			</tr>
			</c:forEach>
			</table>
</body>
</html>