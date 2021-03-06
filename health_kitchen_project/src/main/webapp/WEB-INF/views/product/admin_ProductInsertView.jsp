<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.button{
	position: relative;
	width: 500px;
	top: 18px;
	background-color: #512772;
	border: 0;
    color: white;
    height: 50px;
	
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/product/productBoardContent.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<form action="admin_ProductInsert.do" enctype="multipart/form-data" method="post">
		<div id="contnet">
			<div class="layout-wrapper goods-view-area">
				<div class="goods-view-wrapper" id="goods-view-wrapper">
					<div class="goods-view-figure">
						<img src="${conPath }/upload/${productContentView.pimage}" id="obImg" class="goods-view-figure-image">
					</div>
					<!-- goods-view-figure -->
					<div class="goods-view-form">
						<!-- <div class="goods-view-form-header">
							<h2 class="goods-view-name"><input type="text" name="pname"></h2>					
						</div> -->
						<!-- goods-view-form-header -->
						<div class="goods-view-form-table-wrapper">
							<table class="goods-view-form-table">
								<tbody>
									<tr class="goods-view-form-price">
										<th scop="row" class="goods-view-form-table-heading">상품명</th>
										<td class="goods-view-form-table-cell"><input type="text" name="pname"></td>
									</tr>
								</tbody>
							</table>
							<table class="goods-view-form-table">
								<tbody>
									<tr class="goods-view-form-price">
										<th scop="row" class="goods-view-form-table-heading">판매가</th>
										<td class="goods-view-form-table-cell"><input type="text" name="pprice"></td>
									</tr>
								</tbody>
							</table>
							<table class="goods-view-form-table">
								<tbody>
									<tr class="goods-view-form-price">
										<th scop="row" class="goods-view-form-table-heading">이미지</th>
										<td class="goods-view-form-table-cell"><input type="file" name="pimage"></td>
									</tr>
								</tbody>
							</table>
							<table class="goods-view-form-table">
								<tbody>
									<tr class="goods-view-form-price">
										<th scop="row" class="goods-view-form-table-heading">칼로리</th>
										<td class="goods-view-form-table-cell"><input type="text" name="pcal"></td>
									</tr>
								</tbody>
							</table>
							<table class="goods-view-form-table">
								<tbody>
									<tr class="goods-view-form-price">
										<th scop="row" class="goods-view-form-table-heading">재고</th>
										<td class="goods-view-form-table-cell"><input type="text" name="pstock"></td>
									</tr>
								</tbody>
							</table>
							<table class="goods-view-form-table">
								<tbody>
									<tr class="goods-view-form-price">
										<th scop="row" class="goods-view-form-table-heading">주재료</th>
										<td class="goods-view-form-table-cell"><input type="text" name="pmain"></td>
									</tr>
								</tbody>
							</table>
								<table class="goods-view-form-table">
								<tbody>
									<tr class="goods-view-form-price">
										<th scop="row" class="goods-view-form-table-heading">MD추천</th>
										<td class="goods-view-form-table-cell"><input type="checkbox" name="pmdpick" value="1"></td>
										<th scop="row" class="goods-view-form-table-heading">메가세일여부</th>
										<td class="goods-view-form-table-cell"><input type="checkbox" name="pmegapick" value="1"></td>
									</tr>
								</tbody>
							</table>
							<table class="goods-view-form-table">
								<tbody>
									<tr class="goods-view-form-price">
										<th scop="row" class="goods-view-form-table-heading">상세설명</th>
										<td class="goods-view-form-table-cell"><textarea name="pcontent" cols="21" rows="10"></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- goods-view-form-table-wrapper -->
						<div class="goods-view-form-button">
							<input type="submit" value="물품등록" class="button">
					<!-- 		<button type="button">상품후기</button> -->
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
</body>
</html>