<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>답변 글 쓰기</h2>
<form action="member_QnAReply.do">
<input type="hidden" value="${member_QnAReplyView.qbref }" name="qbref">
<input type="hidden" value="${member_QnAReplyView.qbstep }" name="qbstep">
<input type="hidden" value="${member_QnAReplyView.qblevel }" name="qblevel">
	<table>
		
		<%-- <c:if test="${qbBoardDetail.mid != '0'}">
		<tr>
			<td>작성자: </td>
			<td>${qbBoardDetail.mid }<input type="hidden" value="${qbBoardDetail.mid }" name="mid"></td>
		</tr>
		</c:if> --%>
		
		<%-- <c:if test="${qbBoardDetail.mid == '0' }"> --%>
		
		<tr>
			<td>글번호: </td>
			<td>${qbno}의 답변 글<input type="hidden" value="${qbno}" name="qbno"></td>
		</tr>
		
		<tr>
			<td>작성자: </td>
			<td>admin<input type="hidden" value="admin" name="aid"></td>
		</tr>
		
		<%-- </c:if> --%>
		
		<tr>
			<td>제목:</td>
			<td><input type="text" name="title"></td>
		</tr>
		
		<tr>
			<td>내용:</td>
			<td><textarea name="content" cols="30" rows="10"></textarea></td>
		</tr>
		
		
		<tr>
			<td><input type="submit" value="글 등록"></td>
		</tr>
		
	</table>
</form>
</body>
</html>