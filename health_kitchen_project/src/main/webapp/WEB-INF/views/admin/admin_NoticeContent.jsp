<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
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
	      <table class="board_set board_view_table">
	       <thead>
	        <tr><th class="title">${admin_NoticeList.nbtitle}</th></tr>
	        </thead>
	        <tbody>
	         <tr><td class="td_info">
	          <span class="tit_s">작성일</span>" | "
	          <span class="con_s">${admin_NoticeList.nbtime }</span>
	          <span class="tit_s">조회</span>" | "
	          <span class="con_s">${admin_NoticeList.nbhit }</span>
	          </td>
	         </tr>
	         <tr><td class="content_file">${admin_NoticeList.nbfile }</td></tr>
	         <tr><td class="content_td">${admin_NoticeList.nbcontent }</td></tr>
	         <tr><td class="link_id">
	         	<span class="prev_s">이전글</span>
	         	<a href="#"></a>
	         	</td>
	         </tr>
	         <tr><td class="link_id">
	         	<span class="next_s">다음을</span>
	         	<a href="#"></a>
	         	</td>
	         </tr>
	        </tbody>
	      </table>
	      <div class="btn_box">
	       <a href="#" class="btn_list">목록</a>
	       <a href="admin_NoticeModifyView.do?"+${admin_NoticeList.nbno } class="admin_NoticeModifyView">글 수정 페이지</a>
	       <a href="#" class="admin_NoticeDelete">글 삭제 </a>
	       
	      </div>
	      </section>
	    </div>
	    </section>
	 </div>
	</div>
</body>
</html>