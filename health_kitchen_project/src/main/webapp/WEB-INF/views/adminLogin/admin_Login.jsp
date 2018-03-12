<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<link href="${conPath }/css/admin/admin_Login.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="../main/sub_header.jsp"/>
	   <div class="layout-page-header">
	   	 <h2 class="layout-page-title">관리자 로그인</h2>
	   </div>
	   <div id="content">
	    <div class="indiv">
	     <div class="layout-bg">
	      <div class="layout-wrapper">
	       <div class="login_wrap_outer">
	        <form action="${conPath }/admin_Login.do" method="post">
			        <div class="xans-element- xans-member xans-member-login login_wrap">
					         <div class="login">
					          	<ul class="text">
						           <li><span>아이디</span>
						           <li><span>비밀번호</span>
					          	</ul>
					          <ul>
					          	 <li><input type="text" id="admin_id" name="aid" size="20" tabindex="1"></li>
					          	 <li><input type="password" id="admin_password" name="apw" size="20" tabindex="2"></li> 
					          </ul>
					          <ul class="button">
					          	<li class="button">
					          		<input type="submit" value="로그인" class="bhs_button" tabindex="4">
					          	</li>
					          </ul>
					       </div>
					       <!-- login -->
				    </div>
				    <!-- xans-element- -->
			    </form>
	       </div>
	       <!-- login_wrap_outer -->
	      </div>
	      <!-- layout-wrapper -->
	     </div> 
	     <!-- layout-bg -->
	    </div> 
	    <!-- indiv-->
	   </div>
	    <!-- content -->	 
</body>
</html>