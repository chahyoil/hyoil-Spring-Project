<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="google-signin-client_id" content="856746680840-jti6ivlh57aun2nnsmnuevvkdo9b718h.apps.googleusercontent.com">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- 
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="${conPath }/js/google.js"> </script>
<script src="${conPath }/js/facebook.js"> </script>
<script src="${conPath }/js/kakao.js"> </script>
 -->
<link href="${conPath }/css/member/member_Login.css" rel="stylesheet">
<%@ include file="/WEB-INF/include/include-header.jspf" %>

</head>
<body>
	<c:if test="${not empty returnFalse }">
	 <script>
	  alert("사용정지된 회원입니다.");
	 </script>
	</c:if>
	<c:if test="${not empty mid }">
	 <script>
	  console.log("이거 어떻게됨?");
	 </script>
	</c:if>
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<jsp:include page="../main/sub_header.jsp"/>

	   <div class="layout-page-header">
	    <h2 class="layout-page-title">로그인</h2>
	   </div>
	   <div id="content">
	    <div class="indiv">
	     <div class="layout-bg">
	      <div class="layout-wrapper">
	       <div class="login_wrap_outer">
	        <form action="${conPath }/member_Login.do" method="post">
	        <input type="hidden" name="returnUrl" value="member_JoinView.do">
	        <div class="xans-element- xans-member xans-member-login login_wrap">
	         <div class="login">
	          <ul class="text">
	           <li><span>아이디</span>
	           <li><span>비밀번호</span>
	          </ul>
	          <ul>
	           <li><input type="text" id="member_id" name="mid" size="20" tabindex="1"></li>
	           <li><input type="password" id="member_password" name="mpw" size="20" tabindex="2"></li> 
	          </ul>
	          <ul class="button"><li class="button"><input type="submit" value="회원 로그인" class="bhs_button" tabindex="4"></li></ul>
	       </div>
	       <div class="login_button">
	        <ul>
	         <li><a href="full.do"><span class="bhs_button">메인으로 가기</span></a></li>
	         <li><a href="member_JoinView.do"><span class="bhs_button">회원가입</span></a></li>
	        </ul>
	       </div> <!-- login_button -->
	        
	       </div>
	      
	      </form>
	      </div> <!-- xans-element- -->
	     </div> <!-- login_wrap_outer -->
	    </div> <!-- layout-wrapper -->
	   </div> <!-- layout-bg -->


	
	<div class="space"></div>
	</div>
	</div>

</body>
</html>