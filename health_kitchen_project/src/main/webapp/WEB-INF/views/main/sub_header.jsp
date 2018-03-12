<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html ">
<html>
<head>
<script  src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script>
function member_JoinView(){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='member_JoinView.do' />");
    comSubmit.submit();
}

function member_LoginView(){
    var comSubmit = new ComSubmit();
    comSubmit.setUrl("<c:url value='member_LoginView.do' />");
    comSubmit.submit();
}
function member_LogOut(){
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='member_LogOut.do' />");
    comSubmit.submit();
}

	$(document).ready(function(){
		 /* 전체카테고리 */
	    $('.menu1').mouseenter(function(){
	    	$('.gnb_sub').show();
	    });
	    $('.gnb_sub').mouseleave(function(){
	    	$('.gnb_sub').hide();
	    });
	    /* 고객센터 서브 메뉴 */
	    $('.top-navagation-anchor-cs').mouseenter(function(){
	    	$('.top-navigation-submenu').show();
	    });
	    $('.top-navigation-submenu').mouseleave(function(){
	    	$('.top-navigation-submenu').hide();
	    });
	   
	    $('#member_JoinView').on("click",function(event){
	    	event.preventDefault();
	    	member_JoinView();
	    });
	    $('#member_LoginView').on("click",function(event){
	    	event.preventDefault();
	    	member_LoginView();
	    });
	    $('#member_LogOut').on("click",function(event){
	    	event.preventDefault();
	    	member_LogOut();
	    });
	    
	    $('#detailSearchView').hide();
	    $('#detailSearchButton').on("click",function(event){
	    	$('#detailSearchView').toggle();
	    });
	    $.ajax({ // 재규
	           url : '${conPath}/detailSearchView.do',
	           async: true,
	           datatype : 'html',
	           success : function(data, status){
	              $('#enters').html(data);
	              $.ajax({
	                  url : '${conPath}/currentProductList.do',
	                  async: true,
	                  datatype : 'html',
	                  success : function(data, status){
	                     $('#currentProduct').html(data);
	                  }
	               });
	           }
	        });
	});
</script> 
<link href="${conPath }/css/header.css" rel="stylesheet">
<style>
	#currentProduct{
		position:fixed;
		right:350px;
		z-index:999;
		top
	}
</style>
</head>
<body>
	<c:if test="${not empty loginFail }">
	 <script>
	  alert("아이디나 비번을 확인하세요");
	 </script>
	</c:if>

	<div id="header">
		<div id="gnb" class="top-navigation">
			<ul class="top-navigation-menu layout-wrapper">
				<c:choose>
					<c:when test="${empty mid && empty aid }">
					<li class="top-navigation-menu-item ">
					<a href="#this" id="member_LoginView" class="top-navagation-anchor">로그인</a>
					</li>
					<li class="top-navigation-menu-item">
					<a href="#this" id="member_JoinView" class="top-navagation-anchor">회원가입</a>
					</li>
					</c:when>
					<c:when test="${not empty mid }">
					<li class="top-navigation-menu-item ">
					<a href="#this" id="member_LogOut" class="top-navagation-anchor">로그아웃</a>
					</li>
					<li class="top-navigation-menu-item">
					<a href="#this" id="member_QuitView" class="top-navagation-anchor">회원탈퇴</a>
					</li>
					</c:when>
					<c:when test="${not empty aid }">
					<li class="top-navigation-menu-item ">
					<a href="#this" id="member_LogOut" class="top-navagation-anchor">로그아웃</a>
					</li>
					</c:when>
				</c:choose>
				
				<li class="top-navigation-menu-item">
					<a href="#" class="top-navagation-anchor-cs">고객센터</a>
						<ul class="top-navigation-submenu">
							<li class="top-navigation-submenu-item">
								<a href="admin_NoticeList.do" class=top-navagation-anchor>공지사항</a>
							</li>
							<li class="top-navigation-submenu-item">
								<a href="member_QnAList.do" class=top-navagation-anchor>Q&A</a>
							</li>
							<li class="top-navigation-submenu-item">
								<a href="#" class=top-navagation-anchor>주문내역</a>
							</li>
						</ul>
						<!-- top-navigation-submenu -->					
				</li>
				<li class="top-navigation-menu-item">
					<a href="admin_LoginView.do" class="top-navagation-anchor">Admin</a>
				</li>
				<li class="top-navigation-menu-item">
					
					<a href="#" class="top-navagation-anchor">배송예약</a>
				</li>
				
			</ul>
			<!-- top-navigation-menu layout-wrapper -->
		</div>
		<!-- top-navigation -->	
		
	</div>
	<!-- header -->
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>

</body>
</html>