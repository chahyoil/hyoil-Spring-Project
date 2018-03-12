<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/csBoard/csBoardWirte.css" rel="stylesheet">
</head>
<script>
$(document).ready(function(){
    
    //listReply(); // **댓글 목록 불러오기
    listReply2(); // ** json 리턴방식
    
    // ** 댓글 쓰기 버튼 클릭 이벤트 (ajax로 처리)
    $("#btnReply").click(function(){
        var rbcontent=$("#rbcontent").val();
        var rbno="${member_ReviewContentView.rbno}"
        var param="replytext="+replytext+"&rbno="+rbno;
        $.ajax({                
            type: "post",
            url: "${path}/boarder/member_ReviewReply.do",
            data: param,
            success: function(){
                alert("댓글이 등록되었습니다.");
                listReply2();
            }
        });
    });
</script>
<body>
<jsp:include page="../main/header.jsp"/>
<form action="member_ReviewReply.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="rbref" value="${member_ReviewContentView.rbref }"> ${member_ReviewContentView.rbref }
		<input type="hidden" name="rbstep" value="${member_ReviewContentView.rbstep }">${member_ReviewContentView.rbstep }
		<input type="hidden" name="rblevel" value="${member_ReviewContentView.rblevel }">${member_ReviewContentView.rblevel }
	<div class="layout-wrapper cs-board-area">
			<div class="cs-board-notice-wrapper">
				<ul class="cs-board-tab-group">
					<li class="cs-board-tab"><a href="member_ReviewList.do" 
						class="cs-board-view-tab-anchor __active">상품후기</a></li>
					<!-- 공지사항 -->
					<li class="cs-board-tab"><a href="member_QnAList.do"
						class="cs-board-view-tab-anchor ">Q&A</a></li>
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
									<th width="*" scope="col" class="input_txt">제목</th>
									<td><input type="text" name="rbtitle" required="required"
						value="└──[답]${member_ReviewContentView.rbtitle }"></td>
								</tr>
								<tr>	
									<th width="87" scope="col" class="input_txt">작성자</th>
									<td>${ member_ReviewContentView.mid}<input type="hidden" value=${ member_ReviewWrite.mid} name="mid"></td>
								</tr>
								<tr>
									<th class="input_txt">내용</th>
									<td><textarea name="rbcontent" cols="50" rows="10"></textarea></td>
								</tr>							
								<tr>
									<th class="input_txt">첨부파일</th>
									<td><input type="file" name="rbfile"></td>
								</tr>
							</tbody>
						</table>
						<p class="btnArea">
						<input type="submit" id="btnReply" value="답변글 등록" class="btn_button" style="line-height: 30px; width: 130px">
						</p>
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