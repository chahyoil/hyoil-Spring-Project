<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
	 <div class="content_area">
	  <section class="cs_center">
	   <section class="sub_top_section">
	    <h2 class="cate_title"><span>고객 센터</span></h2>
	    </section>
	    <div class="cs_menu_box cs_menu_box1">
	     <a href="admin_NoticeList.do" class="cs_menu on">공지사항</a>
	    </div>
	    <div class="sub_in_top_box" >
	     <h3 class="sub_in_tit">공지사항</h3>
	     <p class="sub_caption">헬스키친의 새로운 소식과 공지사항을 확인해라 닝겐.</p>
	    </div>
	    <div class="cs_content_wrap">
	     <section class="board_area">
	      <table class="board_set board_list_table">
	       <thead>
	       <tr> <th>번호</th><th>제목</th><th>작성일</th><th>조회</th>
	       </thead>
	       <c:forEach var="list" items="${admin_NoticeList }">
	       <tbody>
	        <tr class="point_tr">
	         
	          <td>${list.nbno }</td>
	          <td class="tit_td">
	           <a href="admin_NoticeContent.do?nbno=${list.nbno}">${list.nbtitle }</a>
	          </td>
	         <td>${list.nbtime }</td>
	         <td>${list.nbhit }</td>
	         
	       </tbody>
	       </c:forEach>
	       <div class="btn_box">
	        <a href="admin_NoticeWriteView.do">글 추가</a>
	       </div>
	      </table>
	      <ul class="page_list">
	       <li class="page_link on"></li>
	      </ul>
	     </section>
	    </div>
	  </section>
	 </div>
	</div>
</body>
</html>