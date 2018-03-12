<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/csBoard/csBoardWirte.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../main/header.jsp"/>
<form action="member_QnAWrite.do" method="post" enctype="multipart/form-data">
	<div class="layout-wrapper cs-board-area">
			<div class="cs-board-notice-wrapper">
				<ul class="cs-board-tab-group">
					<li class="cs-board-tab"><a href="admin_NoticeList.do" 
						class="cs-board-view-tab-anchor">공지사항</a></li>
					<!-- 공지사항 -->
					<li class="cs-board-tab"><a href=#
						class="cs-board-view-tab-anchor  __active">Q&A</a></li>
				</ul>
				<!-- cs-board-tab-group -->
				<div class="cs-view-information-content" id="cs-notice">
					<div id="notice-wrapper">
						<div class="notice-board">
							<div class="title_txt">
								<h2>Q&A</h2>
								<div class="sort-wrap">
									<p>고객의 궁금증을 풀어주는 Q&A게시판입니다.무엇이든 질문해주세요 최대한 빨리 답변해 드리겠습니다.</p>
								</div>
								<!-- sort-wrap -->
											</div>
						<table class="board-table-header">
							<tbody>								
								<tr>	
									<th width="*" scope="col" class="input_txt">제목</th>
									<td><input type="text" name="title"></td>
								</tr>
								<%-- <c:if test="${qbBoardDetail.mid != '0'}"> --%>
										<tr>
											<th width="87" scope="col" class="input_txt">작성자 </th>
											<td>${writer }<input type="hidden" value="${writer }" name="mid"></td>
										</tr>
								<%-- </c:if> --%> 
										
										<%-- <c:if test="${qbBoardDetail.mid == '0' }"> --%>
							<%-- 	<tr>	
									<th width="87" scope="col" class="input_txt">작성자</th>
									<td>${qbBoardDetail.mid }</td>
								</tr> --%>
								<tr>
									<th class="input_txt">내용</th>
									<td><textarea name="content" cols="50" rows="10"></textarea></td>
								</tr>							
								<tr>
									<th class="input_txt">첨부파일</th>
									<td><input type="file" name="file" ></td>
								</tr>
							</tbody>
						</table>
						<p class="btnArea">
						<input type="submit" value="글 등록" class="btn_button" style="line-height: 30px; width: 130px">
						</p>
						</div>
					</div>
				</div>
			</div>
			<!-- cs-board-notice-wrapper -->
		</div>
		<!-- cs-board-area -->
	</form>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>	