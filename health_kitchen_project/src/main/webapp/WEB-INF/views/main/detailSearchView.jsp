<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script>
$(document).ready(function(){
	$('#detailSearchView').hide();
    $('#detailSearchButton').on("click",function(event){
    	$('#detailSearchView').toggle();
    });
    
    
    
    $('#pcalView').html($('#pcal').val());
    $('#ppriceView').html($('#pprice').val());
    
    $('#pcal').change(function(){
    	$('#pcalView').html($('#pcal').val());
    });
    
    $('#pprice').change(function(){
    	$('#ppriceView').html($('#pprice').val());
    });
});
</script>
</head>
<body>
<div>
	<div>
		<input type="button" name="detailSearchButton" id="detailSearchButton" ><!-- onclick="location.href='detailSearchView.do'" -->
	</div>
	<form action="detailSearch.do" id="detailSearchView">
		<div id="detailsearchtab">
			<p>칼로리</p> <input type="range" min="100" max="500" step="50" value="300" name="pcal" id="pcal"><span id="pcalView">cal</span>
		</div>
		<div id="detailsearchtab">	
			<p>가격</p> <input type="range" min="10000" max="50000" step="5000" value="30000" name="pprice" id="pprice"><span id="ppriceView">원</span>
		</div>
		<div id="detailsearchpmain">
		<p id="pmain">주재료</p>
			<select name="pmain" id="detailsearchoption">
				<c:forEach items="${detailSearchView}" var="detailSearchView">
					<option value="${detailSearchView.pmain}">${detailSearchView.pmain}</option>
				</c:forEach>
			</select>
		</div>
		<input type="submit" value="검색" id=dtailsearchbtn><%-- <input type="image" src="${conPath }/css/2018-02-02.jpeg" class="btn_search"> --%>
	</form>
</div>
</body>
</html>