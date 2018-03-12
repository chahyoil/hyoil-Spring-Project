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
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
</head>
<body>
<c:set var="i" value="0"/>
 <c:forEach items="${member_OrderListDetail}" var="orderDetailList">
 <div class="orderDetailList">
  <div class="detail_ono" id="ono${i}">${orderDetailList.ono }</div>
  <div class="detail_pimg" id="pimg${i}">0</div>
  <div class="detail_pname" id="pname${i}">0</div>
  <div class="detail_pid" id="pid${i}">${orderDetailList.pid }</div>
  <div class="detail_qty" id="qty${i}">${orderDetailList.qty }</div>
  <div class="detail_totalprice" id="totalprice${i}">${orderDetailList.totalprice }</div>
  <div class="detail_ocompleteone" id="ocompleteone${i}">${orderDetailList.ocompleteone }</div>
  <c:set var="i" value="${i + 1 }"/>
 </div>
 </c:forEach>
 
</body>
</html>