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
#contentMyPage{
	background-color: #f3f5f7;
}

.rcr_lnb {
    width: 179px;
    height: 2000px;
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
	top: -2000px;
}
.img{
	width: 150px;
	height: 100px;
}
.contentMyPage{
background-color:background-color: #f3f5f7;
 }
</style>
<body>
<jsp:include page='../main/header.jsp'/>
<div id="contentMyPage" class="clear">
	<div class="rcr_lnb">
		<ul class="cateList">
		<li>
				<a href="member_OrderListMyPage.do">주문내역</a>
			</li> 	
			<li>
				<a href="MyPage_BasketList.do">장바구니</a>
			</li> 
			<li>
				<a href="currentProductList.do">최근본상품</a>
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
						<h2>최근본 상품</h2>
								<div class="sort-wrap">
									<p>최근 본 물품 리스트입니다.</p>
							</div>
							<!-- sort-wrap -->
						</div>
						<!-- title_txt -->
						<table class="board-table-header">
							<tbody>
								<tr>									
									<th width="*" scope="col" class="input_txt">제품명</th>
									<th width="87" scope="col" class="input_txt">제품이미지</th>
									
								</tr>
							</tbody>
						</table>
						<table class="board-table-content">
						<tbody>
							<c:forEach items="${currentProductList }" var="currentProductList">
								<tr onmouseover="this.style.background='#F7F7F7'"
									onmouseout="this.style.background=''">
																	
									<td>
										<a href="admin_ProductContentView.do?pid=${currentProductList.pid  }">${currentProductList.pname }</a></td>
									<td><img src="${conPath }/upload/${currentProductList.pimage}" width="150px" height="200px"></td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
						<!-- board-table -->
						<p class="btnArea">
							<span class="btn_button" style="line-height: 30px; width: 130px"
								onclick="location.href='full.do'"> Home </span>
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