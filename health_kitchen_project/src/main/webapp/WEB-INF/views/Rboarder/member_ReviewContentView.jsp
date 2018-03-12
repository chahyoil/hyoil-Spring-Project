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
					<li class="cs-board-tab"><a href="member_ReviewList.do" 
						class="cs-board-view-tab-anchor __active">상품후기</a></li>
					<!-- 공지사항 -->
					<li class="cs-board-tab"><a href=#
						class="cs-board-view-tab-anchor">Q&A</a></li>
				</ul>
				<!-- cs-board-tab-group -->
				<div class="cs-view-information-content" id="cs-notice">
					<div id="notice-wrapper">
						<div class="notice-board">
							<div class="title_txt">
								<h2>상품후기</h2>
								<div class="sort-wrap">
									<p>상품후기를 올리는 공간입니다.</p>
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
										<td>${member_ReviewContentView.rbno }</td>
										<td>${member_ReviewContentView.rbtitle }</td>
										<c:if test="${member_ReviewContentView.mid != '0'}">
											<td>${member_ReviewContentView.mid }</td>
										</c:if>
										<td>${member_ReviewContentView.rbtime }</td>									
										<td>${member_ReviewContentView.rbhit }</td>
									</tr>
							</tbody>
						</table>
						<!-- board-table -->						
						<div class="board-contentView">
							<table>
								<tr>
									<td><img src="${conPath}/upload/${member_ReviewContentView.rbfile }"
										alt="이미지" width="1000px"><input type="hidden" name="nbfile"
										value="${member_ReviewContentView.rbfile }"></td>
								</tr>
								<tr>
									<td>
										${member_ReviewContentView.rbcontent }
									</td>
								</tr>						
							</table>
						</div>
						<!-- board-contentView -->
							<p class="btnArea">
								<span class="btn_button" style="line-height: 30px; width: 130px" onclick="location.href='${conPath}/member_ReviewDelete.do?rbno=${member_ReviewContentView.rbno }'">
									삭제하기
								</span>
								<span class="btn_button" style="line-height: 30px; width: 130px" 
										onclick="location.href='member_ReviewModifyView.do?rbno=${member_ReviewContentView.rbno }&rbtitle=${member_ReviewContentView.rbtitle }&mid=${member_ReviewContentView.mid }&rbtime=${member_ReviewContentView.rbtime}&rbhit=${member_ReviewContentView.rbhit }&rbcontent=${member_ReviewContentView.rbcontent }&rbfile=${member_ReviewContentView.rbfile }'">
									수정하기
								</span>
								<span class="btn_button" style="line-height: 30px; width: 130px" onclick="location.href='member_ReviewReplyView.do?rbno=${member_ReviewContentView.rbno}'">
									답변하기
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
	

</body>
</html>