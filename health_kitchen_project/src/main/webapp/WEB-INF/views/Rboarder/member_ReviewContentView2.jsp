<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상세보기</h1>
	<table>
		<tr>
			<th>글번호</th>
			<td>${member_ReviewContentView.rbno }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${member_ReviewContentView.rbtitle }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${member_ReviewContentView.rbcontent }</td>
		</tr>
		<tr>
			<th>사진</th>
			<td>${member_ReviewContentView.rbfile }</td>
		</tr>
		<tr>
			<td><input type="button" value="수정하기"
				onclick="location.href='member_ReviewModifyView.do?rbno=${member_ReviewContentView.rbno}'">
				<input type="button" value="삭제하기"
				onclick="location.href='${conPath}/member_ReviewDelete.do?rbno=${member_ReviewContentView.rbno }'">

				<input type="button" value="답변"
				onclick="location.href='member_ReviewReplyView.do?rbno=${member_ReviewContentView.rbno}'">
				<input type="button" value="메인으로" onclick="location.href='full.do '"></td>
		</tr>
	</table>



</body>
</html>