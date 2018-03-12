<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
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
									<tr>
										<td>${qbBoardDetail.qbno }</td>
										<td>${qbBoardDetail.qbtitle }</td>
										<c:if test="${qbBoardDetail.aid != '0'}">
											<td>${qbBoardDetail.aid }</td>
										</c:if>
										<td>${qbBoardDetail.qbtime }</td>									
										<td>${qbBoardDetail.qbhit }</td>
									</tr>
							</tbody>
						</table>
						<!-- board-table -->						
						<div class="board-contentView">
							<table>
								<tr>
									<td><img src="${conPath}/upload/${qbBoardDetail.qbfile }"
										alt="이미지" width="1000px"><input type="hidden" name="qbfile"
										value="${qbBoardDetail.qbfile }"></td>
								</tr>
								<tr>
									<td>
										${qbBoardDetail.qbcontent }
									</td>
								</tr>						
							</table>
						</div>
						<!-- board-contentView -->
							<p class="btnArea">
								<span class="btn_button" style="line-height: 30px; width: 130px" onclick="location.href='member_QnADelete.do?qbno=${qbBoardDetail.qbno }'">
									삭제하기
								</span>
								<span class="btn_button" style="line-height: 30px; width: 130px" 
										onclick="location.href='member_QnAModifyView.do?qbno=${qbBoardDetail.qbno }&qbtitle=${qbBoardDetail.qbtitle }&mid=${qbBoardDetail.mid }&qbtime=${qbBoardDetail.qbtime}&qbhit=${qbBoardDetail.qbhit }&qbcontent=${qbBoardDetail.qbcontent }&qbfile=${qbBoardDetail.qbfile }'">
									수정하기
								</span>
							
							</p>
						<!-- btnArea -->
						</div>
					</div>
				</div>
			</div>
			<!-- cs-board-notice-wrapper -->
		</div>
		<!-- cs-board-area -->
<jsp:include page="../main/footer.jsp"/>
</body>
</html>