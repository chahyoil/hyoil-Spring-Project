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
<script type="text/javascript">
$("#btn_button").click(function() {
	//var title = document.form1.title.value; ==> name속성으로 처리할 경우
	//var content = document.form1.content.value;
	//var writer = document.form1.writer.value;
	var title = $("#rbtitle").val();
	var content = $("#rbcontent").val();
	//var writer = $("#writer").val();
	if (title == "") {
		alert("제목을 입력하세요");
		document.form1.title.focus();
		return;
	}
	if (content == "") {
		alert("내용을 입력하세요");
		document.form1.content.focus();
		return;
	}
	/* if(writer == ""){
	    alert("이름을 입력하세요");
	    document.form1.writer.focus();
	    return;
	} */
	document.form1.action = "${path}/board/member_ReviewModify.do"
	// 폼에 입력한 데이터를 서버로 전송
	document.form1.submit();

});
</script>
<body>
	<jsp:include page="../main/header.jsp" />
	<form action="member_ReviewModify.do?rbno=${member_ReviewModify.rbno }" enctype="multipart/form-data" method="post">
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
										<td>${member_ReviewContentView.rbno  }<input type="hidden" name="rbno" value="${param.rbno }"></td>
										<td>${member_ReviewModify.rbtitle  }<input type="hidden" name="rbtitle" value="${param.rbtitle }"></td>
										<c:if test="${member_ReviewModify.mid != '0'}">
											<td>${member_ReviewModify.mid }<input type="hidden" name="mid" value="${param.mid }"></td>
										</c:if>
										<td>${member_ReviewModify.rbtime }<input type="hidden" name="rbtime" value="${param.rbtime }"></td>									
										<td>${member_ReviewModify.rbhit }<input type="hidden" name="rbhit" value="${param.rbhit }"></td>
									</tr>
							</tbody>
						</table>
						<!-- board-table -->						
						<div class="board-contentView">
							<table>
								<tr>
									<td><img src="${conPath}/upload/${param.rbfile }" alt="이미지" width="1000px">
								</tr>
								<tr>
									<td>
										<textarea cols="140" rows="10" id="rbcontent" name="rbcontent">${member_ReviewModify.rbcontent  }</textarea>
									</td>
								</tr>	
							</table>
				
							<input type="file" name="rbfile" value="${member_ReviewModify.rbfile }">
		
						</div>
						<!-- board-contentView -->
							<p class="btnArea">
								<span class="btn_button" style="line-height: 30px; width: 130px" onclick="location.href='member_ReviewDelete.do?rbno=${param.rbno }'">
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