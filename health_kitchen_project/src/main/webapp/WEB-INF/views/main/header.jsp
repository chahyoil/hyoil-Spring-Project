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
</head>
<body>
	<c:if test="${not empty returnFalse }">
	 <script>
	  alert("골드회원만 이용가능");
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
					<c:when test="${not empty mid && empty aid }">
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
								<a href="member_OrderListMyPage.do?mid=${mid}" class=top-navagation-anchor>My Page</a>
							</li>
						</ul>
						<!-- top-navigation-submenu -->					
				</li>
				<c:choose>
					<c:when test="${empty aid }">
						<li class="top-navigation-menu-item">
							<a href="admin_LoginView.do" class="top-navagation-anchor">Admin Login</a>
						</li>
						
					</c:when>	
					<c:when test="${not empty aid }">
						<li class="top-navigation-menu-item">
							<a href="admin_LogOut.do" class="top-navagation-anchor">Admin Logout</a>
						</li>
						<li class="top-navigation-menu-item">
							<a href="productAllList.do" class="top-navagation-anchor">Admin Home</a>
						</li>
					</c:when>	
				</c:choose>
			</ul>
			<!-- top-navigation-menu layout-wrapper -->
		</div>
		<!-- top-navigation -->	
		<div id="header-main" class="layout-wrapper">
			<div class="heaer-main-logo">
				<a href="full.do" >
					<img src="${conPath }/css/logo.jpg" alt="로고사진" class="heaer-main-logo-pic" >
				</a>
			</div>
		
		</div>
		<!-- header-main -->
		<div id="gnb">
			<div class="gnb_hellodieter">
				<div class="inner_hellodieter">
					<div class="gnb_main">
						<ul class="gnb">
							<li class="menu1">
								<a href="full.do">
									<!-- <img src="#" alt="카테고리 삼색"> -->
									<span class="txt">전체 카테고리</span>
								</a>
							</li>
							<li>
								<a href="newProductList.do">
									<span class="txt">신상품</span>
								</a>
							</li>
							<li>
								<a href="hotItemList.do">
									<span class="txt">인기상품</span>
								</a>
							</li>
							<li>
								<a href="mdList.do">
									<span class="txt">MD추천</span>
								</a>
							</li>
							<li>
		                        <a href="megaSaleList.do?mid=${mid}">
		                           <span class="txt">메가세일</span>
		                        </a>
                    		</li>
						</ul>
						<%-- a href="#">
							<img src="${conPath }/css/full-shopping-cart.png" alt="cart사진" class="cart">
						</a> --%>
						<!-- gnb -->
						<div id="side_search" class="gnb_search">
							<!--검색용 기능 추가 -->
							<form action="search.do">
								<input type="text" class="inp_search" placeholder="프로 다이어트 식단" name="inp_search">
								<input type="image" src="${conPath }/css/2018-02-02.jpeg" class="btn_search">
							</form>
							
							<div>
								<form action="detailSearch.do" id="enters">
									
								</form>
							</div>
							
							
						</div>
						<!-- side_search -->
					</div>
					<!-- gnb_main -->
					<div class="gnb_sub" >
						<div class ="inner_gnbsub">
							<div class="gnb_menu gnb_200">
								<a href="category_kcal.do?pcal=200" class="link_menu">
									<span class="ico">
										<img src="${conPath }/header_pic/kcal1.png" alt="배터리 1">			
									</span>
									<strong class="tit">
										200kcal
									</strong>
								</a>
								<div class="list">
									Diet Season<br>
									200kcal<br>
									미니멀 식단
								</div>
							</div>
							<div class="gnb_menu gnb_500">
								<a href="category_kcal.do?pcal=500" class="link_menu">
									<span class="ico">
										<img src="${conPath }/header_pic/kcal2.png" alt="배터리 2">			
									</span>
									<strong class="tit">
										500kcal
									</strong>
								</a>
								<div class="list">
									Diet Forever<br>
									500kcal<br>
									맞춤 식단
								</div>
							</div>
							<div class="gnb_menu gnb_800">
								<a href="category_kcal.do?pcal=800" class="link_menu">
									<span class="ico">
										<img src="${conPath }/header_pic/kcal3.png" alt="배터리 3">			
									</span>
									<strong class="tit">
										800kcal
									</strong>
								</a>
								<div class="list">
									It's cheat day<br>
									800kcal<br>
									든든식단							
								</div>
								<!-- list -->
							</div>
							<!-- gnb_menu gnb_800 -->
							<div class="gnb_menu gnb_800">
								<a href="category_kcal.do?pcal=1000" class="link_menu">
									<span class="ico">
										<img src="${conPath }/header_pic/kcal4.png" alt="배터리 4">			
									</span>
									<strong class="tit">
										1000kcal
									</strong>
								</a>
								<div class="list">
									<span>Super Strong</span><br>
									1000kcal<br>
									다이어터 보양식						
								</div>
								<!-- list -->
							</div>
							<!-- gnb_menu gnb_800 -->
						</div>
						<!-- inner_gnbsub -->
					</div>
					<!-- gnb_sub -->
				</div>
				<!-- inner_hellodieter -->
			</div>
			<!--gnb_hellodieter  -->
		</div>
		<!-- gnb -->
	   <input type="hidden" id="mid_Session" value="${mid }">
	</div>
	<!-- header -->
	
	<%@ include file="/WEB-INF/include/include-body.jspf" %>

</body>
</html>