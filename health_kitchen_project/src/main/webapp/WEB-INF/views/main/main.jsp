<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

</script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="${conPath }/css/main.css" rel="stylesheet">
</head>
<body>
	<div id="main">
		<div id= "content">
			<div class="main-slider __slide-wrapper" data-slide-auto="8000">
				<div class="main-slider-wrapper">
					<a href="#">
						<img src="${conPath }/css/mainpic.jpeg"></img>
					</a>
				</div>
				<!-- main-slider-wrapper -->
			</div>
			<!-- main-slider -->
			<div class="main-section-HOT">
	 	<div class="layout-wrapper-HOT">
	  <div class="main-section-header-HOT">
	   <h2 class="main-goods-title-HOT">TODAY`S HOT</h2>
	  </div>	
		<ul class="main-goods-list" id="main_goods_list-hot"> <!-- ul!!! -->
		<c:forEach items="${hotItemList }" var="list" end="4">  
						<li class="main-goods-item">
							<a href="ProductContentView.do?pid=${list.pid}&mid=${mid}">
								<div class="main-goods-figure">
									<img src="${conPath }/upload/${list.pimage}"></img>
								</div>
								<div class="main-goods-item-content">
									<p class="main-goods-item-name">${list.pname }</p>
									<p class="main-goods-item-price">${list.pprice }원</p>
								</div>
							</a>
						</li>
		</c:forEach>
		</ul>
		</div>
	</div> <!-- main-section-HOT -->
	<div class="main-section-NEW">
				<div class="layout-wrapper-NEW">
					<div class="main-section-header-NEW">
						<h2 class="main-goods-title-NEW">
							NEW
						</h2>
					</div>
					<!-- main-section-header -->
					<ul class="main-goods-list">
					<c:forEach items="${newProductList }" var="newProductList" end="4">
						<li class="main-goods-item">
							<a href="ProductContentView.do?pid=${newProductList.pid}&mid=${mid}">
								<div class="main-goods-figure">
									<img src="${conPath }/upload/${newProductList.pimage}"></img>
								</div>
								<div class="main-goods-item-content">
									<p class="main-goods-item-name">${newProductList.pname }</p>
									<p class="main-goods-item-price">${newProductList.pprice }원</p>
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