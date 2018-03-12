<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body>
	  <c:forEach var="list" items="${hotItemList}" end="3">
	   <li class="main-goods-item">
	 	<a href="ProductContentView.do?pid=${list.pid}&mid=${mid }">
	 	
			      <img src="/health_kitchen/food_pic/4pic.jpeg">
	
			     <div class="main-goods-item-content">
			      <p class="main-goods-item-name">${list.pname }</p>
			      <p class="main-goods-item-price"><fmt:formatNumber value="${list.pprice }" pattern="#,###,### 원"/></p>
			     </div>
		 </a>
		</li>
	  </c:forEach>
	 
</body>
</html>