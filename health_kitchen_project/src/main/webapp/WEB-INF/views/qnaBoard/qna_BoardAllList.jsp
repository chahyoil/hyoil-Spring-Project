<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/csBoard/csBoardAllList.css" rel="stylesheet">
</head>

<body>
	<jsp:include page="../main/header.jsp" />
	<div class="layout-wrapper cs-board-area">
		<div class="cs-board-notice-wrapper">
			<ul class="cs-board-tab-group">
				<li class="cs-board-tab"><a href="admin_NoticeList.do"
					class="cs-board-view-tab-anchor ">공지사항</a></li>
				<!-- 공지사항 -->
				<li class="cs-board-tab"><a href="member_QnAList.do"
					class="cs-board-view-tab-anchor __active">Q&A</a></li>
			</ul>
			<!-- cs-board-tab-group -->
			<div class="cs-view-information-content" id="cs-notice">
				<div id="notice-wrapper">
					<div class="notice-board">
						<div class="title_txt">
						<h2>Q&A Board</h2>
								<div class="sort-wrap">
									<p>고객의 궁금증을 풀어주는 Q&A게시판입니다.무엇이든 질문해주세요 최대한 빨리 답변해 드리겠습니다.</p>
							</div>
							<!-- sort-wrap -->
						</div>
						<!-- title_txt -->
						<table class="board-table-header">
							<tbody>
								<tr>
									<th width="70" scope="col" class="input_txt">번호</th>
									<th width="*" scope="col" class="input_txt">제목</th>
									<th width="87" scope="col" class="input_txt">작성자</th>
									<th width="80" scope="col" class="input_txt">작성일</th>
									<th width="80" scope="col" class="input_txt">조회수</th>
								</tr>
							</tbody>
						</table>
						<table class="board-table-content">
						<tbody>
							<c:forEach items="${qnaBoardList }" var="qnaBoardList">
								<tr onmouseover="this.style.background='#F7F7F7'"
									onmouseout="this.style.background=''">
									<td>${qnaBoardList.qbno }</td>
									<td><a
										href="member_QnAContent.do?qbno=${qnaBoardList.qbno }">${qnaBoardList.qbtitle }</a></td>
									<td>${qnaBoardList.mid }</td>
									<td>${qnaBoardList.qbtime }</td>
									<td>${qnaBoardList.qbhit }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
						<!-- board-table -->
						<p class="btnArea">
							<span class="btn_button" style="line-height: 30px; width: 130px"
								onclick="location.href='member_QnAWriteView.do'"> 질문하기 </span>
						</p>
						<!-- btnArea -->
					</div>
					<!-- notice-board -->
					<div class="board_pg_area">
						<c:if test="${paging.startPage>paging.blockSize}">
							[ <a
								href="member_QnAList.do?pageNum=${paging.endPage-paging.blockSize }"
								class="layout-pagination-button layout-pagination-prev-page">
								이전 </a> ]
						</c:if>
						<c:forEach var="i" begin="${paging.startPage}"
							end="${paging.endPage }">
							<c:if test="${paging.currentPage==i }"> 
								[<b> ${i } </b>] 
							</c:if>
							<c:if test="${paging.currentPage != i }">
							[ <a href="member_QnAList.do?pageNum=${i }">${i }</a> ]
							</c:if>
						</c:forEach>
						<c:if test="${paging.endPage<paging.pageCnt }">
							<a
									href="member_QnAList.do?pageNum=${paging.startPage+paging.blockSize }"
								class="layout-pagination-button layout-pagination-next-page">
								다음</a>
						</c:if>
					</div>
					<!-- board_pg_area -->
				</div>
				<!-- notice-wrapper -->
			</div>
			<!-- cs-notice -->
			
			<!-- cs-board-tab-group -->


</body>
</html>