<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="conPath" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>

<!-- 
<script async src="https://connect.facebook.net/en_US/fbevents.js" class></script>
<script type="text/javascript" src="${conPath }/js/member/kakao.min.js"></script>
<script type="text/javascript" src="${conPath }/js/member/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script src="https://apis.google.com/js/client:platform.js" gapi_processed="true"></script>	
<script type="text/javascript" src="${conPath }/js/member/SNS.js"></script>
 -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="${conPath }/css/member/member_Join.css" rel="stylesheet">
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<script>
function telChk(mtel){
	var re=/^[0-3]{3}-[0-9]{4}-[0-9]{4}$/;
	if(!re.test(mtel)){
		alert('전화번호 형식대로 입력하세요.');
		return false;
	}else{
		return true;
	}
}



$(document).ready(function(){
	$('.idconfirm').click(function(){
		$.ajax({
			url : '${conPath}/member_Idconfirm.do',
			datatype : 'html',
			data : "mid="+$('#mid').val(),
			success : function(data, status){
				$('#idConfirmMsg').html(data);
				$('.id_confirm').addClass('on');
				$('.id_confirm').removeClass('off');
			}
		});
	});
	
	$('#mid').blur(function(){
		if(!$(this).val()){
			$('#idConfirmB').html('');
			$('.id_confirm').addClass('off');
			$('.id_confirm').removeClass('on');
		}
	});  
	

	$('#member_JoinSubmit').click(function(){
		
		if($("#mid").val().length==0){
			alert('아이디를 입력하세요');
			return false;
		}
		
		if($('#idConfirmMsg').html().length==0){
			alert('아이디 중복체크를 하세요');
			return false;
		}
		
		if($('#idConfirmB').html()==='중복된 ID입니다. 사용불가'){
			alert('중복된 ID입니다.');
			return false;
		}
		
		if($("#mname").val().length==0){
			alert('이름을 입력하세요');
			return false;
		}
		
		if($('#mpw').val()==$('#pwChk').val() & $('#mpw').val().length>0){
			if(telChk($('#mtel').val())){
				$("form").submit();
			}else{
				$("#mtel").val("");
				return false;
			}
		}else{
			alert('비밀번호를 확인하세요.');
			$('#mpw').val("");
			$('#pwChk').val("");
			$('#mpw').focus();
			return false;
		}
	});
});

</script>
</head>
<body class="Join">
	<jsp:include page="../main/sub_header.jsp"/>
	<div class="container">
	<div id="wrap">
	<div class="space">
		<div class="topline1">새로운 다이어트의 시작</div>
		<div class="topline2" style="color:#512772">Health Kitchen</div>
	</div>
		<div class="mbrRegist">
	<form action="${conPath}/member_Join.do" method="post" id="frm" name="frm">
	
	<!-- 
	<div class="row_group row_group_social">
	 <h4>소셜로 간편하게 로그인 하세요.</h4>
	 <div class="social_row">
	  <ul>
	   <li><button type="button" id="btnNvLogin" class="btSocial">
	    <span class="icn icnNa"></span>"네이버 로그인"
	    </button>
	   </li>
	   <li><button type="button" id="btnFbLogin" class="btSocial" onclick="facebookLogin()">
	    <span class="icn icnFb"></span>"페이스북 로그인"
	   </button>
	   </li>
	   <li><button type="button" id="btnKaLogin" class="btSocial" >
	    <span class="icn icnKo"></span>"카카오 로그인"
	   </button>
	   </li>
	   <li><button type="button" id="btnGlLogin" class="btSocial" >
	    <span class="icn icnGl"></span>"구글 로그인"
	   </button>
	   </li>
	  </ul>
	 </div>
	</div>
	 -->
	 
	<div class="row_group mbr_info">
	 <div class="row mbr_name">
	  <div class="col_2">
	   <input type="text" id="mname" name="mname" class="inputVal" maxlength="12" placeholder="이름(실명)"> 
	  </div> <!-- col_2 -->
	 </div> <!-- row mbr_name -->
	 
	 <div class="row mbr_id">
	  <div class="col_2">
	   <input type="text" id="mid" name="mid" class="inputVal" maxlength="16" placeholder="아이디">
	   
	  </div> <!-- col_2 -->
	  <span class="col_3">
	   <input type="button" class="idconfirm mbrBtnAuth-id" value="중복확인"><br>
	  </span>
	 </div> <!-- row mbr_id -->
	 <div class="id_confirm off">
	   <div class="col_2">
	    <input type="hidden" id="idConfirm">
	    <span id="idConfirmMsg"></span>
	   </div>
	 </div>
	 <div class="row mbr_passwd">
	  <div class="col_2">
	   <input type="password" id="mpw" name="mpw" class="inputVal" maxlength="16" placeholder="비밀번호"> 
	  </div> <!-- col_2 -->
	 </div> <!-- row mbr_name -->

	<div class="row mbr_pwChk">
	  <div class="col_2">
	   <input type="password" id="pwChk" name="pwChk" class="inputVal" maxlength="16" placeholder="비번확인"> 
	  </div> <!-- col_2 -->
	</div> <!-- row mbr_name -->
	<div class="row mbr_email">
	  <div class="col_2">
	   <input type="text" id="memail" name="memail" class="inputVal" maxlength="30" placeholder="이메일"> 
	  </div> <!-- col_2 -->
	</div> <!-- row mbr_email -->
	<div class="row mbr_tel">
	  <div class="col_2">
	   <input type="text" id="mtel" name="mtel" class="inputVal" maxlength="13" placeholder="연락처"> 
	  </div> <!-- col_2 -->
	</div> <!-- row mbr_email -->
	<div class="row mbr_gender">
	  <div class="col_2">
	  <input type="text" placeholder="성별" readonly="readonly">
	  </div> <!-- col_2 -->
	 <div class="col_3">
	   <select name="mgender" class="mbrBtnAuth">
	    <option value="남자">남자</option>
	    <option value="여자">여자</option>
	   </select>
	 </div>
	</div> <!-- row mbr_gender -->
	<div class="row mbr_postnum">
	  <div class="col_1">
	  </div>
	  <div class="col_2">
	   <input type="text" id="sample4_postcode" name="mpostnum" class="text_box"  placeholder="우편번호">
						
	  </div> <!-- col_2 -->
	  <div class="col_3">
	   <input type="button" class="idconfirm mbrBtnAuth-id"onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
	  </div>
	</div> <!-- row mbr_postnum -->
	<div class="row mbr_address">
	  <div class="col_1">
	  </div>
	  <div class="col_2">
	   <input type="text" id="sample4_roadAddress" name="maddress"  placeholder="도로명주소">
						<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
						<span id="guide"></span>
						
	  </div> <!-- col_2 -->
	</div> <!-- row mbr_postnum -->
    </div> <!-- row_group mbr_info -->
    
    <div class="row_group line_none regist_complete" style="position:relative;">
     <div class="row">
      <button type="button" id="member_JoinSubmit">
      		<span>가입하기</span>
      </button>
     </div>
    </div>
	</form>
	<div class="space"></div>
	</div>
	<iframe name="oauth2relay1749992973" id="oauth2relay1749992973" src="https://accounts.google.com/o/oauth2/postmessageRelay?parent=https%3A%2F%2Fwww.jobkorea.co.kr&amp;jsh=m%3B%2F_%2Fscs%2Fapps-static%2F_%2Fjs%2Fk%3Doz.gapi.ko.S_p_x89v_kY.O%2Fm%3D__features__%2Fam%3DAQE%2Frt%3Dj%2Fd%3D1%2Frs%3DAGLTcCNWxPKRkpEu-_ZNAnb80v5WrSKnCg#rpctoken=587827949&amp;forcesecure=1" tabindex="-1" aria-hidden="true" style="width: 1px; height: 1px; position: absolute; top: -100px;"></iframe>
	</div>
	</div>	
</body>
</html>