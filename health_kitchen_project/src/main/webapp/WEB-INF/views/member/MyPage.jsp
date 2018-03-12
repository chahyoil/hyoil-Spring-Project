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
<link href="${conPath}/css/product/orderInfoPage.css" rel="stylesheet">
</head>
<script src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script>
</script>
<style>
#content{
	background-color: #f3f5f7;
}
.layout-wrapper{
	width: 800px;
}
.cs-board-notice-wrapper {
    width: 800px;
    position: relative;
  	 left: 105PX;
    top: -1000px;
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

.user_form {
    width: 80%;
</style>
<body>
<script type="text/javascript">
$(document).ready(function(){
	 var order_length;
	 var pageIndex = 0;  
	 
	 function pageChr(pageIndex){$(".ono_detail").each(function(index){
		 var totalPrice=0;
		 var product_price=0;
		 var product_dc=0;
		 var finalCost=0;
	 	var ono_detail = $(this).text();
	 	if(pageIndex==index){
		$(".orderListTr").show();
	 	$(".ono_value").val(ono_detail);
	 	$.ajax({
	 		url:"member_OrderListDetail.do",
	 		mehtod:"post",
			dataType:"html",
			data:"ono="+ono_detail,
		  success: function(data){
			  $(data).find(".detail_pid").each(function(inner_index){
					var pid=$(this).text();  
					$("#pid"+inner_index).val(pid);
					$.ajax({
						url:"getProductOne.do",
						mehtod:"get",
						dataType:"html",
						data:"pid="+pid,
						async : false,
					  success: function(dataIn){
						  //img${i}
						  var product_img = $(dataIn).find("#product_img").val();
						  var product_name = $(dataIn).find("#product_name").val();
						  product_price = $(dataIn).find("#product_price").val();
						  product_img = "${conPath }/upload/"+product_img;
						  $("#img"+inner_index).find(".goods-cart-product-image").attr("src",product_img);
						  //$("#img"+inner_index).text(product_img); //지금여기
						  $("#productName"+inner_index).text(product_name);
						  $("#pprice"+inner_index).val(product_price);
						  
					  } //  success
			     }); //ajax inner
					var product_total = $(data).find("#totalprice"+inner_index).text();
					var product_count = $(data).find("#qty"+inner_index).text();
					$("#productCount"+inner_index).text(product_count+"개/ 개 당 "+Number(product_total/product_count)+"원");
					$("#productPrice"+inner_index).text(product_total+"원");
					if($(data).find("#ocompleteone"+inner_index).text()==1){
						var btn_confirm = $("#ocompleteoneout"+inner_index).closest("td").find(".btn_confirm");
						btn_confirm.attr("class","confirmOk"); 
						btn_confirm.val("구매완료");
					}else{
						var btn_confirm = $("#ocompleteoneout"+inner_index).closest("td").find(".confirmOk");
						btn_confirm.attr("class","btn_confirm"); 
						btn_confirm.val("구매확정");
					}
					totalPrice = Number(totalPrice) + Number(product_price)*Number(product_count);
					product_dc+=Number(product_price)*Number(product_count)-Number(product_total)
					finalCost +=Number(product_total);
					
			  });  // each inner_index

			  order_length = $(data).find(".detail_ono").length; 
			  $("#el-orderitem-goods-price").text(totalPrice);
			  $("#el-orderitem-total-special_discount_amount").text(product_dc);
			  $(".el-orderitem-total-result").text(finalCost);
			  
			  $(".orderListTr").each(function(list_index){
				if(list_index>=order_length){
					$("#orderList"+list_index).hide();
				}
			  });
			  
			} //success
		}); // ajax
	 	} // if 
	}); // $(".ono_detail").each(function(index){
  }
	 $(".btn_confirm").click(function(){
		 var ono = $(".ono_value").val();
		 var pid = $(this).closest("td").find(".pid").val();
		 $(this).attr("class","confirmOk");
		 $(this).val("구매완료");
		   $.ajax({
				url:"member_OrderListConfirm.do",
				mehtod:"post",
				dataType:"html",
				data:"ono="+ono+"&pid="+pid,
			  success: function(data){
			  }  
	     });  
 });
	 var order_Count = $(".ono_detail").length;
	 $(document).on("click",".btn_chr", function(e){
		if($(this).attr("id")=="btn_prev"){

		if(pageIndex>0){
	     pageIndex=pageIndex-1;
	     pageChr(pageIndex);
	    }
		
		}else if($(this).attr("id")=="btn_next"){
		 
		 if(pageIndex<order_Count){
		  pageIndex=pageIndex+1;
		  pageChr(pageIndex);
		 }
		}else{
		  pageIndex=0;
		  pageChr(pageIndex);
		}
		
	});  
	pageChr(pageIndex);
});
</script>
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
   <h2 class="layout-page-title">주문서</h2>
   <div class="pg_sub_desc">
    <p>주문하실 상품 명 및 수량을 정확하게 확인해 주세요.</p>
   </div>
  </div>
 </div>
 <div id="main">
  <div id="content">
   <div class="user_form">
    <div class="layout-wrapper">
     <div class="goods_orderitem">
      <table class="styled-table order_table">
       <thead>
        <tr>
         <th scope="col" colspan="2">상품정보</th>
         <th scope="col">주문금액</th>
         <th scope="col">구매확정</th>
        </tr>
       </thead>
       <tbody>
        <c:set var="i" value="0"/>
        <c:forEach var="orderList" begin="1" end="10">  <!-- 지금여기 -->  
        <tr id="orderList${i }" class="orderListTr">
         <td class="thumb_area" id="img${i}">
          <a><img src="" class="goods-cart-product-image"></a>
         </td>
         <td class="goods-cart-product-cell">
          <div class="goods-cart-product-content">
           <p class="goods-cart-product-name" id="productName${i}"></p> 
           <div class="goods-cart-no-package-name" id="productCount${i}">
           </div> 
          </div>
         </td>
         <td>
          <span class="goods-cart-price-value" id="productPrice${i}"></span>
         </td> 
         <td>
          <input type="button" class="btn_confirm" id="productConfirm${i}" value="구매확정">
          <input type="hidden" class="ocompleteone_value" id="ocompleteoneout${i}">
          <input type="hidden" class="ono_value">
          <input type="hidden" class="pprice" id="pprice${i }"> 
          <input type="hidden" class="pid" id="pid${i }">
         </td> 
         
        </tr>
        <c:set var="i" value="${i + 1 }"/>
        </c:forEach>
       </tbody>
       
      </table>
      <div class="goods-cart-result">
       <p class="goods-cart-delivery"></p>
       <div class="goods-cart-settleprice">
        총 상품 금액 <span id="el-orderitem-goods-price"></span>원 - 할인 
        <span id="el-orderitem-total-special_discount_amount"></span>원 = 총 결제 금액:
        <span class="goods-cart-price-value" ><span class="el-orderitem-total-result">57000</span>원</span>
       </div> <!-- goods-cart-settleprice -->
      </div> <!-- goods-cart-result -->
      <p class="txt_orderitem"> 4만원 이상 구매시 무료 배송</p>
     </div> <!-- goods_orderitem -->
  <div class="btn_page"> 
   <input type="button" class="btn_chr" id="btn_prev" value="<">
   <input type="button" class="btn_chr" id="btn_firstPage" value="주문서">
   <input type="button" class="btn_chr" id="btn_next" value=">">
  </div>
     </div> <!-- layout-wrapper -->
   </div> <!-- user_form -->
  </div> <!-- content -->
 </div> <!-- main -->
 <table style="display: none;"> <!-- 여기 밑에는 안보이는데 다른 데이터 처리하기 위해서 놔둔거야 -->
   <tr><td>주문번호</td>
   	   <td>회원아이디</td>
   		<td>주문날짜</td>
   		<td>배송지주소</td>
   		<td>배송지전화</td>
   		<td>배송완료여부</td>
   		<td>구매완료하기</td>
   </tr>
  <c:forEach items="${member_OrderList }" var="orderList">
   <tr>
    <td><a class="ono_detail">${orderList.ono }</a></td>
    <td class="ono_content"></td>
    <td>${orderList.mid }</td>
    <td>${orderList.odate }</td>
    <td>${orderList.oaddress }</td>
    <td>${orderList.ophone }</td>
    <td class="orderComplete">${orderList.ocompleteall }</td>
   </tr>
  </c:forEach>
 </table>
	<!-- rcr_cnt -->
</div>
</div>
<!-- content -->
</body>
</html>