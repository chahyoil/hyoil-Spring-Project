<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC>
<html>
<head>
<link href="${conPath}/css/footer.css" rel="stylesheet">

</head>
<body>
<footer class="footer">   
   <div class="footer_wrap">
      <div class="footer_logo">
         <img src="${conPath }/css/logo.jpg" alt="로고사진">
      </div>
      <!-- footer_logo -->
      <div class="company_info">
         <ul>
            <li>(주)헬스키친 | 대표자 : 고구마 |개인정보보호책임자:감자(IT@google.com)</li>
            <li>사업자등록번호:261-81-23567[사업자정보확인]|팀명 고된램지</li>
            <li>서울 종로구 삼일대로 17길51 스타골드빌딩 3,4,5층 | 전화 : 02-766-8970</li>
            <li>Copyright(c) 2018 헬스키친.All rights reserved</li>
         </ul>
      </div>
      <!-- company_info -->
   </div>
   <!-- footer_wrap -->
</footer>

<div class="cart_area" id="cart_area">
   <div class="cart_wrap" id="cart_wrap">
      <div class="cart_head" id="cart_head">
         <button class="open_cart" id="open_cart" type="button">장바구니 열기/닫기</button>
         <button  class="btn_top" id="btn_top" type="button" onclick="location.href='#'">
         TOP
         </button>
      </div>
      <div class="cart_container clearfix" id="cart_container">
       <article class="cart_article cart_product" id="cart_product" style="overflow-x: auto;">
        <ul class="cart_prod_list" id="cart_prod_list" style="width: 792px;">
        <!-- 여기에 전부 들어옴 -->
        </ul> 
        </article>
        <article class="cart_article cart_total" id="cart_total_info">
         <h3 class="yg76">총금액</h3>
         <table sumarry="상품총금액">
          <tbody>
           <tr>
           <th>상품가</th>
           <td><span id="cart_prod_total">0</span>
               <span>원</span>
           </td>
           </tr>
           <tr>
           <th>배송료</th>
           <td><span id="cart_deli_total">0</span>
               <span>원</span>
           </td>
           </tr>
          </tbody>
          <tfoot>
           <tr>
           <th>합계</th>
           <td>
            <span id="cart_settle_total">0</span>
            <span>원</span>
           </td>
          </tr>
          </tfoot>
         </table>
         <!-- href="member_BasketList.do?mid=${mid }" -->
         <a href="member_BasketList.do?mid=${mid }" class="link_order" onclick="doBasket();">주문하기</a>
        </article> 
        </div> <!-- cart_container clearfix -->
      </div> <!-- cart_wrap -->
   </div> <!-- cart_area -->
<div style="display: none;">
<table >
 <c:forEach var="i" begin="0" end="20">  <!-- 지금여기 --> 
 <tr> 
   <td id="basketImg${i}">${i}</td>
 </tr>
</c:forEach>
</table>
</div>
</div> 
<%@ include file="/WEB-INF/include/include-body.jspf" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
<script src="<c:url value='/js/goMain.js'/>" charset="utf-8"></script>
<script>
(function($){
   
   $('#goMain').on("click",function(event){
          event.preventDefault();
          post_to_url("${conPath}/homewithLogin.do",{"mid":$("#mid").val()});
       });   
   var imgList=[];
    $.fn.cart = function(count){
         var cartProd_W = 132;
         var cartProd_standart_num = 6;
         var isClick = false;
         var isOpen = false;
         var set_timeout = null;
         
         
         // 상품 추가(+) 삭제(-) 를 눌렀을 경우
         $(document).on("click", '.btn_cart, .btn_cart_p, .btn_cart_m, .btn_prod_p, .btn_prod_m, #btn_in_cart, .btn_in_cart, .btn_addCart', function (e){         
            if($('#mid_Session').val()==null || $('#mid_Session').val()==""){
               event.preventDefault();
               alert("로그인이 필요합니다");
               return false;
            }
            
            if(!$(e.target).hasClass('btn_prod_m') && !$(e.target).hasClass('btn_prod_p') ){
               //location.reload();
               isClick = true
            } else {
               isClick = false
            }
            if(!isOpen){  // 장바구니 창이 닫혀있을 경우
               $.cartOpen();
               clearTimeout(set_timeout);
               set_timeout = setTimeout($.cartClose, 1000, $(this)) // 천천히 열리라는 뜻인가?
            }
            else if(!$(this).hasClass('btn_in_cart'))
            {
               var goodsData = $(this).getGoodsData();
               $("#cart_prod_list").addCart(goodsData);
            }
         });
         
         // ajax에서 장바구니 변화에 해당하는 부분을 따로 뺐다.
         $.basketChange = function(data){  
            var basketList = {'items':[]};
            $(data).find(".basket_list").each(function(i,value){
                    var bno=$(value).find("td").first().text();
                    var mid=$(value).find(".basket_mid").text();
                    var pid=$(value).find(".basket_pid").text();
                    var bcount=$(value).find(".basket_bcount").text();
                    var btotal=$(value).find(".basket_btotal").text();
                    $("#mid").val(mid);
                    basketList.items.push({'bno':bno,'mid':mid,'pid':pid,'bcount':bcount,'btotal':btotal})
               });
               //지금여기
               $(document).makeCartItem(basketList);
         }
         
         $.cartOpen = function(target){   // 카트 여는 함수
            $('.cart_area').animate({bottom:'0'},200);
            $("#open_cart").data('ch',1).addClass('on');
            
         };
         $.cartClose = function(target){   // 카트 닫는 함수
            $('.cart_area').animate({bottom:'-218px'},200);
            $("#open_cart").data('ch',0).removeClass('on');
            $('.prod_box').children('.bot_con').children('.cnt_box').children().css('color', '');
            isClick = false;
            isOpen = false;
         };   
         
         $("#open_cart").on('click',function(){  // 카트 열고 닫는 버튼
            isOpen = true;
            if(!$(this).data('ch')){
               $.cartOpen();
            } else {
               isOpen = false;
               $.cartClose();
            }
         });
         
         $("#cart_product").css('overflow-x', 'auto')
         $('.cart_container').on('mouseenter', function(){ // 뭘까... 시간조정하는 것 같은데..
            clearTimeout(set_timeout);
            isOpen = true;
         });
      
         //장바구니에 추가/감소
         $.fn.addCart = function( goodsData, isReload){
            
            $.ajax({
               type: "POST",
               url: "${conPath}/member_BasketPlusMinus.do",
               data: goodsData,
               dataType: "html",
               success: function(data,status){
                  $.basketChange(data);
               }
            });
         };
         
         
         $.btn_in_cart= function(){ // 장바구니 추가 버튼 함수.
             
          var basketData = $("#basketForm").serialize();
          $.ajax({
             type:"POST",
             url: "${conPath}/member_BasketInsert.do",
             data: basketData,
             async : false,
             dataType:'html',
             success :function(data){ 
               $(data).find(".basket_list").each(function(index){
                     $("#basketImg"+index).text($(this).find(".basket_pimage").text());
                 });
               $.cartOpen();
               $.basketChange(data);
             }
          });
          }
          
          $("#btn_in_cart").click(function(){ // 장바구니 버튼을 클릭했을 경우에 장바구니에 insert 함.
             $.btn_in_cart();
          });
         
          // 장바구니 관련 버튼을 눌렀을 때 ul -> li 에 태그를 추가하는 함수
         $.fn.makeCartItem = function(obj, pid){
            $("#cart_prod_list").empty();
            if(obj.items.length > 0){
            //지금여기 basketImg${i}
            $(obj.items).each(function(i,cart_item){
             var img = $("#basketImg"+i).text();
             
               var tag = '';
               tag+='<input type="hidden" class="btotal" value="' + this.btotal + '">';
               tag+='<li class="cart_prod">';
               tag+='<div class="prod_box">';
               tag+='<div class="img_con">';
               tag+='<a href=ProductContentView.do?pid='+this.pid +'&mid='+this.mid+' id="itemno_'+this.pid +'"> <img src="${conPath }/upload/'+img+'"> </a>';
               tag+='</div>'; //img_con                       
               tag+='<div class="bot_con">';
               tag+='<div class="cnt_box">';
               tag+='<span>수량</span>';
               tag+='<input type="text" class="prod_cnt" readonly="readonly" value="' + this.bcount + '">';
               tag+='</div>'; // cnt_box
               tag+='<div class="btn_box">';
               tag+='<div class="btn_prod_box btn_top_box"><button class="btn_prod btn_prod_p" data-pid="' + this.pid + '" data-bno="'+this.bno+'"  data-mid="'+this.mid+'"  data-bcount="'+ (parseInt(this.bcount)+1) +'"  data-btotal="'+(parseInt(this.btotal)+parseInt(this.btotal)/parseInt(this.bcount))+'" >추가</button></div>';
               tag+='<div class="btn_prod_box btn_bot_box"><button class="btn_prod btn_prod_m" data-pid="' + this.pid + '" data-bno="'+this.bno+'"  data-mid="'+this.mid+'"  data-bcount="'+ (parseInt(this.bcount)-1) +'"  data-btotal="'+(parseInt(this.btotal)-parseInt(this.btotal)/parseInt(this.bcount))+'" >감소</button></div>';
               tag+='</div>'; //btx_box
               tag+='</div>'; // bot_con
               tag+='</div>'; //prod_box
               tag+='<div class="prod_cost_box">'
               tag+='<span class="prod_cost">'+ this.btotal +'</span><span class="yg76">원</span>';
               tag+='</div>'; 
               tag+='</li>';
               $("#cart_prod_list").append(tag); 
         
            }); // each
            var total_price =0;
            var deli_total  = 3000;
             $(".btotal").each(function(){
               total_price += Number($(this).val());
            });
         }else{
            var total_price =0;
            var deli_total  =0;
         } // if
         
         if(total_price>=40000){
            var deli_total = 0;
         }
         cartBgSet();  // 장바구니 개수가 6개가 넘었을 때, 사이드로 가게 하는 함수
         
         $("#cart_prod_total").text(total_price);
         $("#cart_deli_total").text(deli_total);
         $("#cart_settle_total").text(parseInt(total_price)+parseInt(deli_total));
         
      } // makeCartItem
      
      $(window).resize(function (){
         cartBgSet();
      }); 
      
      function cartBgSet(){ // 장바구니 개수가 6개가 넘었을 때, 사이드로 가게 하는 함수

         var cartProd_num = $("#cart_prod_list").find('.cart_prod').length;
         
         if (cartProd_num > cartProd_standart_num){
            $("#cart_product").addClass('over');
         }else{
            $("#cart_product").removeClass('over');
         }
      

         $("#cart_prod_list").width(cartProd_W * cartProd_num);
         //$open_cart_btn.click();
      } // cartBgSet
      
      var price = parseInt($("#price").text());
       var total_price;
       $("#bcount").change(function(){ // 장바구니의 물품 개수가 변할 경우에 가격도 변함
         total_price = $('#bcount').val() * parseInt($("#price").text());
         $("#btotal").val(total_price); 
       });

      function init(){ 
         //지금여기
         $.ajax({
            url: "${conPath}/member_BasketList.do",
            data: "mid="+$('#mid_Session').val(),
            dataType: "html",
            success: function(data,status){
               $(data).find(".basket_list").each(function(index){
                  $("#basketImg"+index).text($(this).find(".basket_pimage").text());
                  $.basketChange(data);
               });
            }
         });
      } // init
      
      init();
      
      }//cart (end plugin)
      
    $.fn.getGoodsData = function(){
         return {
                  "bno":$(this).data("bno"),
                  "mid":$(this).data("mid"),
                  "pid":$(this).data("pid"),
                  "bcount":$(this).data("bcount"),
                  "btotal": $(this).data("btotal")
               };
      };
      $.fn.cart();

})(jQuery);

function doBasket() {
   
   if ($('#cart_prod_list').is(':empty')){
        event.preventDefault();
        alert("장바구니에 물품을 넣어주세요");
        return false;
      }
   return true;
}


</script>
</body>
</html>