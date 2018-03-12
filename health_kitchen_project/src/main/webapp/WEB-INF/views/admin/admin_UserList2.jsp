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
	<table>
	<c:forEach var="member" items="${admin_UserList}">
	 <tr>
	  <td>${member.mid }</td>
	  <td>${member.mpw }</td>
	  <td><a href="admin_Block.do?mid=${member.mid }">블락시키기</a></td>
	  <td><a href="admin_UserLevelup.do?mid=${member.mid }">등업시키기</a></td>
	 </tr>
	 </c:forEach>
	</table>
	
	<c:if test="${paging.startPage>paging.blockSize}">
	[ <a href="member_QnAList.do?pageNum=${paging.endPage-paging.blockSize }">이전</a> ]
</c:if>	
<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage }">
	<c:if test="${paging.currentPage==i }"> 
		<b> ${i } </b> 
	</c:if>
	<c:if test="${paging.currentPage != i }">
		[ <a href="member_QnAList.do?pageNum=${i }">${i }</a> ]
	</c:if>
</c:forEach>
<c:if test="${paging.endPage<paging.pageCnt }">
	[ <a href="member_QnAList.do?pageNum=${paging.startPage+paging.blockSize }">다음</a> ]
</c:if>
	
</body>
</html>