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
<form action="admin_NoticeModify.do" method="post" enctype="multipart/form-data">
		<div class="layout-wrapper cs-board-area">
			<div class="cs-board-notice-wrapper">
				<ul class="cs-board-tab-group">
					<li class="cs-board-tab"><a href="admin_NoticeList.do" 
						class="cs-board-view-tab-anchor __active">공지사항</a></li>
					<!-- 공지사항 -->
					<li class="cs-board-tab"><a href=#
						class="cs-board-view-tab-anchor">Q&A</a></li>
				</ul>
				<!-- cs-board-tab-group -->
				<div class="cs-view-information-content" id="cs-notice">
					<div id="notice-wrapper">
						<div class="notice-board">
							<div class="title_txt">
								<h2>Notice Board</h2>
								<div class="sort-wrap">
									<p>홈페이지 이용 관련 공지사항을 올리는 공간입니다. 헬스 키친의 소식을 읽어보세요</p>
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
										<td>${param.nbno }<input type="hidden" name="nbno" value="${param.nbno }"></td>
										<td>${param.nbtitle }<input type="hidden" name="nbtitle" value="${param.nbtitle }"></td>
										<c:if test="${param.aid != '0'}">
											<td>${param.aid }<input type="hidden" name="aid" value="${param.aid }"></td>
										</c:if>
										<td>${param.nbtime }<input type="hidden" name="nbtime" value="${param.nbtime }"></td>									
										<td>${param.nbhit }<input type="hidden" name="nbhit" value="${param.nbhit }"></td>
									</tr>
							</tbody>
						</table>
						<!-- board-table -->						
						<div class="board-contentView">
							<table>
								<tr>
									<td><img src="${conPath}/upload/${param.nbfile }" alt="이미지" width="1000px">
								</tr>
								<tr>
									<td>
										<textarea cols="140" rows="10" name="nbcontent">${param.nbcontent }</textarea>
									</td>
								</tr>	
							</table>
				
							<input type="file" name="file">	
		
						</div>
						<!-- board-contentView -->
							<p class="btnArea">
								<span class="btn_button" style="line-height: 30px; width: 130px" onclick="location.href='admin_NoticeDelete.do?nbno=${param.nbno }'">
									삭제하기
								</span>
								<input type="submit" value="수정하기" class="btn_button" style="line-height: 30px; width: 130px">
								<%-- <span class="btn_button" style="line-height: 30px; width: 130px" onclick="location.href='admin_NoticeModify.do?nbno=${nBoardDetail.nbno }'">
									수정하기
								</span> --%>
							
							</p>
						<!-- btnArea -->
						</div>
					</div>
				</div>
			</div>
			<!-- cs-board-notice-wrapper -->
		</div>
		<!-- cs-board-area -->
	</form>
</body>
</html>