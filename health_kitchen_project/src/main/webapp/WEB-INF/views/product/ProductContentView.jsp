<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script src="<c:url value='/js/goMain.js'/>" charset="utf-8"></script>
<script>


</script>
<link href="${conPath }/css/product/productBoardContent.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<form action="" method="post" id="basketForm">
		<div id="contnet">
			<div class="layout-wrapper goods-view-area">
				<div class="goods-view-wrapper" id="goods-view-wrapper">
					<div class="goods-view-figure">
						<img src="${conPath }/upload/${productContentView.pimage}" id="obImg" class="goods-view-figure-image">
					</div>
					<!-- goods-view-figure -->
					<div class="goods-view-form">
						<div class="goods-view-form-header">
							<h2 class="goods-view-name">${productContentView.pname }</h2>					
						</div>
						<!-- goods-view-form-header -->
						<div class="goods-view-form-table-wrapper">
							<table class="goods-view-form-table">
								<tbody>
									<tr class="goods-view-form-price">
										<th scop="row" class="goods-view-form-table-heading">판매가</th>
										<td class="goods-view-form-table-cell" id="price">${productContentView.pprice}</td>
									</tr>
								</tbody>
							</table>
							<table class="goods-view-form-table">
								<tbody>
									<tr class="goods-view-form-price">
										<th scop="row" class="goods-view-form-table-heading">칼로리</th>
										<td class="goods-view-form-table-cell">${productContentView.pcal }</td>
									</tr>
								</tbody>
							</table>
							<table class="goods-view-form-table">
								<tbody>
									<tr class="goods-view-form-price">
										<th scop="row" class="goods-view-form-table-heading">재고</th>
										<td class="goods-view-form-table-cell">${productContentView.pstock }</td>
									</tr>
								</tbody>
							</table>
							<table class="goods-view-form-table">
								<tbody>
									<tr class="goods-view-form-price">
										<th scop="row" class="goods-view-form-table-heading">구매수량</th>
										<td class="goods-view-form-table-cell"><input type="number" name="bcount" id="bcount" min="0" value="1"></td>
										<input type="hidden" name="btotal" id="btotal">
										<input type="hidden" name="mid" id="mid" value="${mid }">
										<input type="hidden" name="pid" id="pid" value="${productContentView.pid }">
				   						<input type="hidden" name="bno" value="1">
									</tr>
								</tbody>
							</table>
							<table class="goods-view-form-table">
								<tbody>
									<tr class="goods-view-form-price">
										<th scop="row" class="goods-view-form-table-heading">상세설명</th>
										<td class="goods-view-form-table-cell">${productContentView.pcontent }</td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- goods-view-form-table-wrapper -->
						<div class="goods-view-form-button">
						<c:choose>
							<c:when test="${empty mid && not empty aid }">
								<button type="button"  onclick="location.href='admin_ProductDelete.do?pid=${productContentView.pid }'"  >물품삭제</button>
								<button type="button" onclick="location.href='admin_ProductModifyView.do?pid=${productContentView.pid }'">물품수정</button>
							</c:when>
							<c:when test="${not empty mid && empty aid }">
								<button type="button"class="btn_in_cart" id="btn_in_cart" >장바구니 담기</button>
								<button type="button" onclick="location.href='member_ReviewList.do?pid=${productContentView.pid }'">상품후기</button>
							</c:when>
						</c:choose>
						</div>
						
						<!-- goods-view-form-button -->
					</div>
					<!-- goods-view-form -->
				</div>
				<!-- goods-view-wrapper -->	
					<hr>
					
			</div>
			<!-- layout-wrapper -->
		</div>
		<!-- contnet -->	
		
	</form>
		<jsp:include page='../main/footer.jsp'/>	
</body>
</html>