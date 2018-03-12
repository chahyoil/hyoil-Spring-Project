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
							검색결과
						</h2>
					</div>
					<!-- main-section-header -->
					<ul class="main-goods-list">
						<c:forEach items="${search}" var="search">
							<li class="main-goods-item">
								<a href="ProductContentView.do?pid=${search.pid}&mid=${mid }">
									<div class="main-goods-figure">
										<img src="${conPath }/upload/${search.pimage}"></img>
										<%-- <img src="${conPath }/upload/${search.pimage}" alt=""> --%>
									</div>
									<div class="main-goods-item-content">
										<p class="main-goods-item-name">${search.pname }</p>
										<p class="main-goods-item-price">${search.pprice }원</p>
									</div>
								</a>
							</li>		
						</c:forEach> 	
					</ul>
					<!--디테일서치  -->
					<ul class="main-goods-list">
						<c:forEach items="${detailSearch}" var="detailSearch">
							<li class="main-goods-item">
								<a href="ProductContentView.do?pid=${detailSearch.pid}&mid=${mid }">
									<div class="main-goods-figure">
										<img src="${conPath }/upload/${detailSearch.pimage}" alt="디테일이미지"></img>
										<%-- <img src="${conPath }/upload/${search.pimage}" alt=""> --%>
									</div>
									<div class="main-goods-item-content">
										<p class="main-goods-item-name">${detailSearch.pname }</p>
										<p class="main-goods-item-price">${detailSearch.pprice }원</p>
									</div>
								</a>
							</li>		
						</c:forEach> 	
					</ul>
					<!-- main-goods-list -->
					<ul class="main-goods-list">
						<c:forEach items="${category_kcal}" var="category_kcal">
				    	  	<li class="main-goods-item">
				    	  		<a href="ProductContentView.do?pid=${category_kcal.pid}&mid=${mid }">
									<div class="main-goods-figure">
										<img src="${conPath }/upload/${category_kcal.pimage}" alt="디테일이미지"></img>
										<%-- <img src="${conPath }/upload/${search.pimage}" alt=""> --%>
									</div>
									<div class="main-goods-item-content">
										<p class="main-goods-item-name">${category_kcal.pname }</p>
										<p class="main-goods-item-price">${category_kcal.pprice }원</p>
									</div>
								</a>						        
				    		</li>
			      		</c:forEach>
			   	 	</ul> 
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