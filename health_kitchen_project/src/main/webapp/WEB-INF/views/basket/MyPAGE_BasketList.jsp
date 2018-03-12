<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/csBoard/csBoardAllList.css" rel="stylesheet">
<link href="${conPath}/css/product/basketPage.css" rel="stylesheet">
</head>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script>
$(document).ready(function(){
	 
	 $('#goMain').on("click",function(event){
	    	event.preventDefault();    
	    	post_to_url("${conPath}/full.do");
	    });
	 
	 $("input[name='allCheck']").change(function(){
		 if($(this).hasClass("unchecked")){ 
			 $(".ico_checkAll").prop("checked",true);
			 $(".ico_checkAll").addClass("checked");
			 $(".ico_checkAll").removeClass("unchecked");
			 
			 $(".ico_check").prop("checked",true);
			 $(".ico_check").addClass("checked");
			 $(".ico_check").removeClass("unchecked");
		 }else if($(this).hasClass("checked")){
			 $(".ico_checkAll").prop("checked",false);
			 $(".ico_checkAll").addClass("unchecked");
			 $(".ico_checkAll").removeClass("checked");
			 
			 $(".ico_check").prop("checked",false);
			 $(".ico_check").addClass("unchecked");
			 $(".ico_check").removeClass("checked");
		 }
		 basketChange();
		 basketText();
	 });
	 
	 $(".num_total").text($(".ico_check").length)// 여기야
	 
	  $(".ico_check").change(function(){
		this_id=$(this).attr("id");
		if($(this).hasClass("unchecked")){
			$("#"+this_id).prop("checked",true);
			$("#"+this_id).addClass("checked");
			$("#"+this_id).removeClass("unchecked");
			basketText();
			
		}else if($(this).hasClass("checked")){
			$("#"+this_id).prop("checked",false);
			$("#"+this_id).addClass("unchecked");
			$("#"+this_id).removeClass("checked");
			
			$(".ico_checkAll").prop("checked",false);
			$(".ico_checkAll").addClass("checked");
		    $(".ico_checkAll").removeClass("unchecked");
		}
		basketChange();
		basketText();
	});  
	 
	function basketText(){
		var chkCount=0;
		 $(".ico_check").each(function(){
			if($(this).is(":checked")){
				chkCount+=1;
			}
			
			if(chkCount==$(".ico_check").length){
				$(".ico_checkAll").prop("checked",true);
			};
		});
		$(".num_count").text(chkCount);
		$(".num_total").text($(".ico_check").length);
	}
	 
	function basketChange(){
		var totalOri = 0;
		var totalAfter=0;
		var itemCount=0;
		$(".ico_check").each(function(index,value){
			 if($(this).hasClass("checked")){
				 itemCount = $("#"+index+"bcount").val();
				 totalOri +=Number($("#"+index+"pprice").text())*itemCount;
				 totalAfter+=Number($("#"+index+"sellingPrice").text())*itemCount;
			 } 
		
		 });
		$(".amount_total").find(".result").find(".num").text(totalOri);
		amount_total =  $(".amount_total").find(".result").find(".num").text();
       $(".amount_dc").find(".result").find(".num").text(totalOri-totalAfter);
       $(".amout_order").find(".result").find(".num").text(totalAfter);
       if(totalAfter<=40000 && 0<totalAfter && amount_total){
        $(".amount_delivery").find(".result").find(".num").text(3000);
        $(".amout_result").find(".result").find(".num").text(3000+totalAfter);
       }else{
        $(".amout_result").find(".result").find(".num").text(totalAfter);	
       }
       if(totalAfter==0){
       	$(".amount_delivery").find(".result").find(".num").text(0);
       }
	}
	
	$(".btn_delete").on("click",function(event){
		var mid = $("#mid").val();
		var bnos = new Array(); 
		bnos.push($(this).closest("tr").find(".ico_check").val()); 
		$(this).closest("tr").remove();
		var list={"bnos":bnos,"mid":mid};
		basketDeleteAjax(list);
	});
	  
	$(".btn_deleteAll").on("click",function(event){
		var mid = $("#mid").val();
		var bnos = new Array(); 
		 $(".ico_check").each(function(index){
			 if($(this).hasClass("checked")){
				 bnos.push($("#"+index+"ico_check").val());
				 $(this).closest("tr").remove();
			 }
		 });
		 var list={"bnos":bnos, "mid":mid};
		 basketDeleteAjax(list);
	});
	
	$(document).on("click",".btn_reduce, .btn_rise ", function(e){
		// 지금여기
		var this_basket=$(this).closest("tr").find(".goods_check");
		var bno = this_basket.find(".ico_check").val();
		var pid = this_basket.find(".basket_pid").val();
		var qty = this_basket.find(".basket_bcount").val();
		var btotal = this_basket.find(".basket_btotal").val();
		
	    var comSubmit = new ComSubmit();
		comSubmit.setUrl("<c:url value='member_BasketPlusMinus.do' />");
		comSubmit.addParam("bno",bno);
		comSubmit.addParam("mid",$("#mid").val());
		comSubmit.addParam("pid",pid);
		
		if($(this).hasClass('btn_reduce')){
			
			comSubmit.addParam("bcount",Number(qty)-1);
			comSubmit.addParam("btotal",Number(btotal)-Number(btotal/qty));	
			comSubmit.submit();
		}else{
			comSubmit.addParam("bcount",Number(qty)+1);
			comSubmit.addParam("btotal",Number(btotal)+Number(btotal/qty));	
			comSubmit.submit();
		} 
	});
	
	function basketDeleteAjax(list){
		$.ajax({
	    	headers: { 
			        'Accept': 'application/json',
			        'Content-Type': 'application/json'},
			method:"post",
			url : '${conPath}/member_BasketDelete.do',
			datatype : 'json',
			data : JSON.stringify(list),
			async: false,
			success : function(data, status){
			},
			complete : function(){
				post_to_url("${conPath}/member_BasketList.do",{"mid":$("#mid").val()});
			}
		}); 
	}
  
	$.ajax({
		method:"post",
		url:'${conPath}/memberSelectOne.do',
		data: "mid="+$("#mid").val(),
		success: function(data){
			$("#oaddress").val($(data).find("#maddress").text());
			$("#ophone").val($(data).find("#mtel").text());	
		}
	});
	
	var date = new Date();
	var today = date.getDate();
	var currMonth = date.getMonth() + 1;
	$("#today").text(" "+currMonth+"월 "+parseInt(date.getDate()+1)+"일");
	$("#today_1").text(" "+currMonth+"월 "+parseInt(date.getDate()+2)+"일");
	$("#today_2").text(" "+currMonth+"월 "+parseInt(date.getDate()+3)+"일");
	
	today =parseInt(date.getDate());
	$("#delivery").find("td:nth-child(3n+2)").find(":input").val($(this).val()+currMonth+"월"+today+"일")
	$("#delivery").find("td:nth-child(3n)").find(":input").val($(this).val()+currMonth+"월"+parseInt(date.getDate()+1)+"일")
	$("#delivery").find("td:nth-child(3n+1)").find(":input").val($(this).val()+currMonth+"월"+parseInt(date.getDate()+2)+"일")
	 
	var oaddress = $("#oaddress").val();
	var ophone = $("#ophone").val();  
	var ocomplete =0;
	$("#delivery").children('tr:first').find("input[name=bno]").attr("value");  // 배송관련
	
	$(".btn_submit").click(function(){
		if($("#oaddress").val()==null || $("#oaddress").val()==""){
			event.preventDefault();
			alert("주소를 입력하세요");
			return false;
		}
		var mid = $("#mid").val(); 
		var ono = mid+""+Math.round(Math.random()*100000000);
		var odate = $("input[name=odate]:checked").attr("class") +" "+ $("input[name=odate]:checked").val();
		var oaddress = $("#oaddress").val();
		var ophone = $("#ophone").val();
		var ocompleteall = 0;
		var order_detail = {order_detail:[]}

		$(".ico_check").each(function(index){
			if($(this).hasClass("checked")){
				bno = $(this).val();
				pid = $(this).closest(".goods_check").find(".basket_pid").val();
				qty = $(this).closest(".goods_check").find(".basket_bcount").val();
				totalprice = $(this).closest(".goods_check").find(".basket_btotal").val();
				ocompleteone = 0;
				$(this).closest(".goods_check").remove();
				var items = {"bno":bno,"pid":pid,"qty":qty,"totalprice":totalprice,
						"ocompleteone":ocompleteone}
				order_detail.order_detail.push(items);
			} else{
			return;	
			} 
		});
		var orders = {"ono":ono,"mid":mid,"odate":odate,"oaddress":oaddress,"ophone":ophone,"ocompleteall":ocompleteall,
				 "order_detail":order_detail.order_detail}; 
		if(orders.order_detail.length>0){
		     $.ajax({
			  headers: { 
			        'Accept': 'application/json',
			        'Content-Type': 'application/json' 
			    },
			 	method:"post",
				url : '${conPath}/member_OrderInfoInsert.do',
				datatype : 'json',
				// contentType: "application/json",
				data : JSON.stringify(orders),
				async: false,
				success : function(data, status){
				},complete : function(){
					post_to_url("${conPath}/member_OrderList.do",{"mid":$("#mid").val()});
				}
			});   //ajax  
		}else{
		 alert("최소한 한개의 제품을 선택하세요");
		}
	}); // buy button
	
}); // document

</script>
<style>
.user_form {
    width: 80%;
    position: relative;
    left: -60px;
}
#content{
	background-color: #f3f5f7;
	margin-top: 0px;
}

.rcr_lnb {
    width: 179px;
    height: 1000px;
    padding: 13px 0;
    background-color: #fff;
    border-left: 1px solid #ebecef;
    POSITION: RELATIVE;
    LEFT: 426PX;
    text-align:center;
    border-right: 1px solid #ebecef;
}
.rcr_lnb .cateList {
    margin-top: 9px;
    width: 210px;
    margin: 9px 0 0;
}
.cateList :last-child{
	border-bottom: 1px solid #efeff1;
}
.rcr_lnb .cateList > li {
    border-top: 1px solid #efeff1;
    width: 179px;
    padding: 16px 24px 19px;
    POSITION: RELATIVE;
    
}
.cs-board-notice-wrapper{
	width: 800px;
	position: relative;
	left: 250PX;
	top: -1000px;
}
.user_form {
    width: 80%;}
.layout-page-header{
	padding-bottom: 80px;
}
</style>
<body>

<jsp:include page='../main/header.jsp'/>
<div id="content" class="clear">
	<div class="rcr_lnb">
		<ul class="cateList">
			<li>
				<a href="member_OrderListMyPage.do">주문내역</a>
			</li> 	
			<li>
				<a href="MyPage_BasketList.do">장바구니</a>
			</li> 
			<li>
				<a href="currentProductList.do">최근본상품</a>
			</li> 				
		</ul>
	</div>
	<!-- rcr_lnb -->
	<div class="layout-wrapper cs-board-area">
		<div class="cs-board-notice-wrapper">
		<!-- 	<ul class="cs-board-tab-group">
				<li class="cs-board-tab"><a href="admin_NoticeList.do"
					class="cs-board-view-tab-anchor ">공지사항</a></li>
				공지사항
				<li class="cs-board-tab"><a href="member_QnAList.do"
					class="cs-board-view-tab-anchor __active">Q&A</a></li>
			</ul> -->
			<!-- cs-board-tab-group -->
			<div id="container">
  <div class="layout-page-header">
   <h2 class="layout-page-title">장바구니</h2>
   <div class="pg_sub_desc">
    <p>주문하실 상품명 및 수량을 정확하게 확인해주세요.</p>
   </div>
  </div>
  <div id="main">
   <div id="content">
    <div class="user_form section_cart">
     <div class="tbl_comm cart_goods">
      <table class="tbl_comm tbl_header">
       <caption>장바구니 목록 제목</caption>
       <colgroup>
        <col style="width: 375px;">
        <col style="width: 432px;">
        <col style="width: 115px;">
        <col style="width: 110px;">
        <col style="width: auto">
       </colgroup>
       <thead>
        <tr>
         <th id="thSelect">
          <div class="all_select">
           <label class="label_check">
            <input type="checkbox" name="allCheck" class="ico_checkAll unchecked">
           </label>
           <span class="tit">
               전체선택 (
            <span class="num_count">0</span>
            /
            <span class="num_total"></span>)
           </span>
          </div>
          </th>
          <th id="thInfo">상품정보</th>
          <th id="thCount">수량</th>
          <th id="thCost">상품금액</th>
          <th id="thDelete"><span class="screen_out">삭제선택</span></th>
        </tr>
       </thead>
      </table>
      <div id="viewGoods">
      <c:set var="i" value="0"/>
      <c:forEach var="list" items="${member_BasketList}">
		
       <div>
        <div class="view_goods">
         <table class="tbl_goods goods">
          <caption>장바구니 목록 내용</caption>
          <colgroup>
           <col style="width: 76px;">
           <col style="width: 100px;">
           <col style="width: 488px;">
           <col style="width: 112px;">
           <col style="width: 86px;">
           <col style="width: 110px;">
           <col style="width: auto;">
          </colgroup>
          <tbody>
           <tr>
            <td header="thSelect" class="goods_check">
             <label class="label_check"> <!-- 지금여기 -->
              <input type="checkbox" id="${i}ico_check" class="ico_check unchecked" value="${list.bno}">
             </label>
              <input type="hidden" class="basket_mid" value="${list.mid }">
              <input type="hidden" class="basket_pid" value="${list.pid }">
              <input type="hidden" class="basket_bcount" value="${list.bcount }">
              <input type="hidden" class="basket_btotal" value="${list.btotal }">
            </td>
            <td header="thInfo" class="goods_thumb">
             <a class="thumb">
              <img src="${conPath }/upload/${list.pimage}">
             </a>
            </td>
            <td header="thInfo" class="goods_info">
             <a class="name">${list.pname }</a>
             <dl class="goods_cost">
              <dt class="screen_out">판매가격</dt>
              <dd class="selling_price">
               <span class="num" id="${i}sellingPrice">${list.btotal/list.bcount}</span>
               <span class="txt">원</span>
              </dd>
               <dt class="screen_out">원가</dt>
              <dd class="cost">
               <span class="num" id="${i}pprice">${list.pprice }</span>
               <span class="txt">원</span>
              </dd>
             </dl>
            </td>
            <td header="thInfo" class="goods_condition">
             <div class="condition"></div>
            </td>
            <td header="thCount">
             <div class="goods_quantity">
              <div class="quantity">
               <strong class="screen_out">수량</strong>
               <button type="button" class="btn btn_reduce"> <!-- 지금여기 -->
                <img src="https://res.kurly.com/pc/ico/1801/ico_minus_24x4_777.png">
               </button>
               <input type="text" readonly="readonly" class="inp_quantity" id="${i}bcount" value="${list.bcount }">
               <button type="button" class="btn btn_rise"> <!-- 가자가자 -->
                <img src="https://res.kurly.com/pc/ico/1801/ico_plus_24x24_777.png">
               </button>
              </div>
             </div>
            </td>
            <td header="thCost">
 			 <dl class="goods_total">
             <dt class="screen_out">합계</dt> 
             <dd class="result">
              <span class="num">${list.btotal}</span>
              <span class="txt">원</span>
             </dd>
            </dl>
           </td>
           <td header="thDelete" class="goods_delete">
			<button type="button" class="btn btn_delete">
			 <img src="https://res.kurly.com/pc/ico/1801/btn_close_24x24_514859.png" alt="삭제">
			</button>
		   </td>
           </tr>
          </tbody>
         </table>
        </div> <!-- view_goods -->
       </div> <!--  -->
        <c:set var="i" value="${i + 1 }"/>
       </c:forEach>
      </div>  <!-- viewGoods -->
      </div> <!-- tbl_comm cart_goods -->
      <div class="all_select select_option">
		<button type="button" class="btn_deleteAll">선택 삭제</button> 
	  </div>
	  <div>

<div id="hiddenData" style="display: none;">
<input type="hidden" id="mid" value="${mid}">
</div>
</div>
		<!-- 보이지 않는 테이블입니다. 다른데서 쓰기 위해서 놔둠 -->
		<table style="display: none;">
			<c:forEach var="basket" items="${member_BasketList}">
			<tr class="basket_list">

					<td><input type="checkbox" name="bno" id="bno" value="${basket.bno }" >${basket.bno }</td>
					<td class="basket_mid">${basket.mid }</td>
					<td class="basket_pid">${basket.pid }</td>
					<td class="basket_bcount">${basket.bcount }</td>
					<td class="basket_btotal">${basket.btotal}</td>
					<td class="basket_pimage">${basket.pimage }</td>
			</tr>
			</c:forEach>
		</table>
		 </div> <!-- user_form section_cart -->
		</div> <!-- content -->
 </div> <!-- main -->
 </div> <!-- container -->
 	</div>
</div>
</div>
<!-- content -->
</body>
</html>