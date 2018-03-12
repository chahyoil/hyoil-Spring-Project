<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/csBoard/csBoardAllList.css" rel="stylesheet">
</head>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script>
</script>
<style>
#content{
	background-color: #f3f5f7;
}
td{
width: 100px
}
.rcr_lnb {
    width: 179px;
    height: 1000px;
    padding: 13px 0;
    background-color: #fff;
    border-left: 1px solid #ebecef;
    POSITION: RELATIVE;
    LEFT: 426PX;
    text-align:center;
    border-right: 1px solid #ebecef;
}
.rcr_lnb .cateList {
    margin-top: 9px;
    width: 210px;
    margin: 9px 0 0;
}
.cateList :last-child{
	border-bottom: 1px solid #efeff1;
}
.rcr_lnb .cateList > li {
    border-top: 1px solid #efeff1;
    width: 179px;
    padding: 16px 24px 19px;
    POSITION: RELATIVE;
    
}
.cs-board-notice-wrapper{
	width: 800px;
	position: relative;
	left: 250PX;
	top: -1000px;
}
</style>
<body>
<jsp:include page='../main/header.jsp'/>
<div id="content" class="clear">
	<div class="rcr_lnb">
		<ul class="cateList">
			<li>
				<a href="productAllList.do">물품관리</a>
			</li> 	
			<li>
				<a href="admin_buyList.do">물품 구매현황</a>
			</li> 
			<li>
				<a href="admin_OrderList.do">회원 주문내역</a>
			</li> 
			<li>
				<a href="admin_UserList.do">회원관리</a>
			</li> 	
		</ul>
	</div>
	<!-- rcr_lnb -->
	<div class="layout-wrapper cs-board-area">
		<div class="cs-board-notice-wrapper">
		<!-- 	<ul class="cs-board-tab-group">
				<li class="cs-board-tab"><a href="admin_NoticeList.do"
					class="cs-board-view-tab-anchor ">공지사항</a></li>
				공지사항
				<li class="cs-board-tab"><a href="member_QnAList.do"
					class="cs-board-view-tab-anchor __active">Q&A</a></li>
			</ul> -->
			<!-- cs-board-tab-group -->
			<div class="cs-view-information-content" id="cs-notice">
				<div id="notice-wrapper">
					<div class="notice-board">
						<div class="title_txt">
						<h2>회원 관리</h2>
								<div class="sort-wrap">
									<p>전체 회원 목록 리스트 목록입니다.</p>
							</div>
							<!-- sort-wrap -->
						</div>
						<!-- title_txt -->
						<table class="board-table-header">
							<tbody>
								<tr>
									<th width="70" scope="col" class="input_txt">아이디</th>
									<th width="*" scope="col" class="input_txt">이름</th>
									<th width="87" scope="col" class="input_txt">TEL</th>									
									<th width="80" scope="col" class="input_txt">주소</th>
									<th width="80" scope="col" class="input_txt">가입일</th>
									<th width="80" scope="col" class="input_txt">멤버쉽</th>
									<th width="80" scope="col" class="input_txt">등업</th>
								</tr>
							</tbody>
						</table>
						<table class="board-table-content">
						<tbody>
							<c:forEach items="${admin_UserList }" var="admin_UserList">
								<tr onmouseover="this.style.background='#F7F7F7'"
									onmouseout="this.style.background=''">
									<td>${admin_UserList.mid  }</td>
									<td>${admin_UserList.mname  }</td>
									<td>${admin_UserList.mtel }</td>									
									<td>${admin_UserList.maddress }</td>
									<td><fmt:formatDate value="${admin_UserList.mjoindate }" type="both" pattern="yyyy-MM-dd"/></td>
									<td>${admin_UserList.mlevelno }</td>
									<c:if test="${admin_UserList.mblock == 0}">
									<td>
									<input type="button" value="이용자 블럭" onclick="location.href='admin_Block.do?mid=${admin_UserList.mid }'">
									</td>
									</c:if>
									<c:if test="${admin_UserList.mblock == 1}">
									<td>
									<input type="button" value="블럭 완료" onclick="location.href='admin_Block.do?mid=${admin_UserList.mid }'">
									</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
						<!-- board-table -->
						<p class="btnArea">
							<span class="btn_button" style="line-height: 30px; width: 130px"
								onclick="location.href='productAllList.do'"> Home </span>
						</p>
						<!-- btnArea -->
					</div>
					<!-- notice-board -->
					 <%-- <div class="board_pg_area">
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
					</div>  --%>
					<!-- board_pg_area -->
				</div>
				<!-- notice-wrapper -->
			</div>
			<!-- cs-notice -->
	<!-- rcr_cnt -->
</div>
</div>
<!-- content -->
</body>
</html>