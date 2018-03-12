<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
</script>
</head>
<link href="${conPath }/css/product/productList.css" rel="stylesheet">
<body>
	<jsp:include page='../main/header.jsp'/>
		<div id="main">
		<div id= "content">	
			<div class="main-section">
				<div class="layout-wrapper">
					<div class="main-section-header">
						<h2 class="main-goods-title">
							인기상품
						</h2>
					</div>
					<!-- main-section-header -->
					<ul class="main-goods-list">
						<c:forEach items="${hotItemList}" var="list">
							<li class="main-goods-item">
								<a href="ProductContentView.do?pid=${list.pid}&mid=${mid }">
									<div class="main-goods-figure">									
									<img src="${conPath }/upload/${list.pimage}" alt=""> 
									</div>
									<div class="main-goods-item-content">
										<p class="main-goods-item-name">${list.pname }</p>
										<p class="main-goods-item-price">${list.pprice }원</p>
									</div>
								</a>
							</li>		
						</c:forEach> 	
					</ul>
					<!-- main-goods-list -->
				</div>
				<!-- layout-wrapper -->
			</div>
			<!-- main-section -->
		</div>
		<!-- content -->
	</div>
	<!-- main -->
</body>
</html>