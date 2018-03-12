package com.tj.health_kitchen2.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.health_kitchen2.Service.AdminService;
import com.tj.health_kitchen2.Service.MemberService;
import com.tj.health_kitchen2.Service.Paging2;
import com.tj.health_kitchen2.Service.ProductService;
import com.tj.health_kitchen2.model.Basket;
import com.tj.health_kitchen2.model.Member;
import com.tj.health_kitchen2.model.Orders;
import com.tj.health_kitchen2.model.Orders_Detail;
import com.tj.health_kitchen2.model.Page;
import com.tj.health_kitchen2.model.Product;
import com.tj.health_kitchen2.model.Reservation;


/**
 * Handles requests for the application home page.
{"mailId":"kaikyong99","mailData":[{"mailSN":6993,"size":35403,"status":2130432,"attachCount":0,"name":"[네이버페이]주문에 대한 입금이 완료되었습니다.eml"}],"enableResend":false} */
@Controller
public class HomeControllerH {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "full", method = {RequestMethod.GET, RequestMethod.POST})
	public String home(Locale locale, Model model, Product product, String pageNum) {
		Paging2 paging = null;
		paging = new Paging2(4, productService.total(), pageNum);
		product.setStartRow(paging.getStartRow());
		product.setEndRow(paging.getEndRow());
		model.addAttribute("newProductList", productService.newProductList(product));
		model.addAttribute("hotItemList", productService.hotItemList());
		model.addAttribute("paging", paging);
		return "main/full";
	}
	
	@RequestMapping(value = "member_JoinView", method = {RequestMethod.GET, RequestMethod.POST})
	public String member_JoinView(Locale locale, Model model) {
		return "member/member_Join";
	}
	
	@RequestMapping(value = "member_LoginView", method = {RequestMethod.GET, RequestMethod.POST})
	public String member_LoginView(Locale locale, Model model) {
		return "member/member_Login";
	}
	
	@RequestMapping(value = "member_Login", method = {RequestMethod.GET, RequestMethod.POST})
	public String member_Login(String mid,String mpw, Model model, HttpSession httpSession) {
		
		int result = memberService.member_Login(mid, mpw); // 블락회원 , 회원이 없는 경우 0
		Member member = memberService.memberSelectOne(mid); 
		int isBlock;
		if(result==0) {
			try {
			 isBlock = member.getMblock();
			}catch(NullPointerException e) {
				model.addAttribute("loginFail", "아이디, 비번을 확인하세요");
				return "member/member_Login";
			}
			if(isBlock==1) {
				model.addAttribute("returnFalse", "블락된 회원입니다");
				return "member/member_Login";
			}
			
			return "member/member_Login";
		}else {
		  httpSession.setAttribute("mid", mid);
		  return "forward:full.do";
		}
		
	}

	@RequestMapping(value = "member_LogOut",method = {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession httpSession) {
		httpSession.invalidate();
		return "forward:full.do";
	}
	
	@RequestMapping(value="member_Idconfirm", method={RequestMethod.GET, RequestMethod.POST})
	public String member_Idconfirm(String mid, Model model) {
		int result = memberService.member_IdConfirm(mid);
		model.addAttribute("result", result);
		return "member/member_IdConfirm";
	}
	
	@RequestMapping(value="member_Join", method={RequestMethod.GET, RequestMethod.POST})
	public String member_Join(Member member, Model model, HttpSession httpSession) {
		int result = memberService.member_Join(member);
		httpSession.setAttribute("mid", member.getMid());
		return "forward:full.do";
	}
	


	
	//product/ProductContentView
	@RequestMapping(value = "ProductContentView")
	public String productContentView(HttpServletRequest request, String pid, Product product, Model model) {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("mid");
		product.setMid(mid);
		product.setPid(pid);
		model.addAttribute("productContentView", productService.admin_ProductContentView(pid));
		model.addAttribute("mid", mid);
		return "forward:currentProductInsert.do";
	}
	
	@RequestMapping(value="admin_LoginAfter")
	public String admin_View(String aid, Model model) {
		model.addAttribute("admin_Login", adminService.admin_View(aid));
		return "admin/admin_view";
	}
	
	@RequestMapping(value="admin_ReviewData")
	public String admin_ReviewData(Model model) {
		model.addAttribute("admin_ReviewData", adminService.admin_ReviewData());
		return "admin/admin_ReviewData";
	}
	
	@RequestMapping(value="admin_UserLevelup")
	public String admin_UserLevelup(Model model,String mid) {
		model.addAttribute("admin_UserLevelupService",adminService.admin_UserLevelupService(mid));
		return "forward:admin_ReviewData.do";
	}
	
	@RequestMapping(value="admin_UserList")
	public String admin_UserList(String pageNum,Model model) {
		Paging2 paging = new Paging2(memberService.member_Total(), pageNum);
		Page page = new Page();
		page.setStartRow(paging.getStartRow());
		page.setEndRow(paging.getEndRow());
		model.addAttribute("admin_UserList",adminService.admin_UserList(page)) ;
		model.addAttribute("paging", paging);
		return "main/admin_UserList";
	}
	
	@RequestMapping(value = "admin_Block", method = RequestMethod.GET)
	   public String admin_Block(String mid, String pageNum, Model model) {
	      model.addAttribute("admin_Block",adminService.admin_Block(mid));
	      return "redirect:admin_UserList.do";
	}
	
	@RequestMapping(value="admin_OrderShipping")
	public String admin_OrderShipping(Model model,String ono, String pid,int qtyMinus,int orderLength, int orderIndex) {
		int result =  adminService.admin_OrderShipping(ono,pid);
		if(result>0) {
			result=adminService.admin_ProductStockChange(pid,qtyMinus);
		}
		int finalResult=0;
		if(orderLength==orderIndex) {
			finalResult = adminService.admin_OrderShippingAll(ono);
		}
		model.addAttribute("finalResult", finalResult);
		return "redirect:admin_LoginView";
	}


	@RequestMapping(value = "admin_ProductCountList")
	public String admin_ProductCountList(int pid, Model model) {
		model.addAttribute("admin_ProductCountList", productService.admin_ProductCountList());
		return "product/admin_ProductCountList";
	}

	@RequestMapping(value = "admin_ProductInsertView")
	public String admin_ProductInsertView() {
		return "product/admin_ProductInsertView";
	}

	@RequestMapping(value = "admin_ProductInsert")
	public String admin_ProductInsert(MultipartHttpServletRequest multipartHttpServletRequest, Model model) {
		int result = productService.admin_ProductInsert(multipartHttpServletRequest);
		System.out.println(result);
		if (result > 0) {
			model.addAttribute("admin_ProductInsert", "물품등록성공");
		} else {
			model.addAttribute("admin_ProductInsert", "물품등록실패");
		}
		return "redirect:productAllList.do";

	}

	@RequestMapping(value = "admin_ProductContentView")
	public String productContentView(String pid, Product product, Model model) {
		model.addAttribute("productContentView", productService.admin_ProductContentView(pid));
		return "product/ProductContentView";
	}

	@RequestMapping(value = "admin_ProductModifyView")
	public String admin_ProductModifyView(String pid, Product product, Model model) {
		model.addAttribute("admin_ProductModifyView", productService.admin_ProductContentView(pid));
		return "product/admin_ProductModifyView";
	}

	@RequestMapping(value = "admin_ProductModify", method = RequestMethod.POST)
	public String admin_ProductModify(MultipartHttpServletRequest multipartHttpServletRequest, Model model) {
		int result = productService.admin_ProductModify(multipartHttpServletRequest);
		System.out.println(result);
		if (result > 0) {
			model.addAttribute("admin_ProductModify", "물품수정성공");
		} else {
			model.addAttribute("admin_ProductModify", "물품수정실패");
		}
		System.out.println("컨트롤러 돌아감");
		return "redirect:productAllList.do";

	}

	@RequestMapping(value = "admin_ProductDelete", method = RequestMethod.GET)
	public String admin_ProductDelete(String pid, Model model) {
		int result = productService.admin_ProductDelete(pid);
		if (result > 0) {
			model.addAttribute("admin_ProductDeleteView", "물품 삭제성공");
		} else {
			model.addAttribute("admin_ProductDeleteView", "물품 삭제실패");
		}
		return "redirect:productAllList.do";
	}

	// 장바구니 리스트
	   @RequestMapping(value = "member_BasketList", method= {RequestMethod.GET,RequestMethod.POST})
	   public String member_BasketList(String mid, Model model) {
	      model.addAttribute("member_BasketList", productService.member_BasketList(mid));
	      model.addAttribute("mid", mid);

	      return "basket/member_BasketList";
	   }
	   @RequestMapping(value = "MyPage_BasketList", method= {RequestMethod.GET,RequestMethod.POST})
	   public String MyPage_BasketList(HttpServletRequest request, Model model) {
		  HttpSession session = request.getSession();
		  String mid = (String)session.getAttribute("mid");
	      model.addAttribute("member_BasketList", productService.member_BasketList(mid));
	      model.addAttribute("mid", mid);
	      return "basket/MyPAGE_BasketList";
	   }

	   // 장바구니 추가
	   @RequestMapping(value = "member_BasketInsert")
	   public String member_BasketInsert(Basket basket, Model model) {
	      int result = productService.member_BasketInsert(basket);   
	      model.addAttribute("mid", basket.getMid());
	       return "forward:member_BasketList.do";
	   }
	   
	   @RequestMapping(value="member_BasketPlusMinus")
	   public String member_BasketPlusMinus(Basket basket,Model model) {
	      productService.member_BasketPlusMinus(basket);
	      model.addAttribute("mid", basket.getMid());
	      model.addAttribute("member_BasketList", productService.member_BasketList(basket.getMid()));
	      return "forward:member_BasketList.do";
	   }

	   @RequestMapping(value = "member_BasketDelete",
	      method = RequestMethod.POST, 
	      consumes = MediaType.APPLICATION_JSON_VALUE,
	      headers = "content-type=application/x-www-form-urlencoded")
	   public String member_BasketDelete(@RequestBody Map<String,Object> bnosList) {
	      ArrayList<Integer> bnos =  (ArrayList<Integer>) bnosList.get("bnos");
	      String mid = (String) bnosList.get("mid");
	      productService.member_BasketDelete(bnos,mid);
	      return "basket/blank"; 
	   }
	   
	   @RequestMapping(value = "member_OrderInfoInsert", 
	   method = RequestMethod.POST, 
	   consumes = MediaType.APPLICATION_JSON_VALUE,
	   headers = "content-type=application/x-www-form-urlencoded")
	   @ResponseBody
	   public String member_OrderInfoInsert(@RequestBody Map<String,Object> order) {
	      Orders orders = new Orders();
	      Reservation reservation = new Reservation();
	      orders.setOno(order.get("ono").toString());
	      orders.setMid(order.get("mid").toString());
	      orders.setOaddress(order.get("oaddress").toString());
	      orders.setOphone(order.get("ophone").toString());
	      orders.setOcompleteall((Integer) order.get("ocompleteall"));
	      
	      reservation.setOno(order.get("ono").toString());
	      reservation.setOshipdate(order.get("odate").toString());
	      
	      List<Map<String,Object>> order_details_map =  (List<Map<String, Object>>) order.get("order_detail");
	      ArrayList<Orders_Detail> order_details = new ArrayList<Orders_Detail>();
	      ArrayList<Integer> basket_Num = new ArrayList<Integer>();
	      String mid = order.get("mid").toString();

	      for(int i=0;i<order_details_map.size();i++) {
	         Orders_Detail o_detail = new Orders_Detail();
	         o_detail.setOno(order.get("ono").toString());
	         o_detail.setPid(order_details_map.get(i).get("pid").toString());
	         o_detail.setQty(Integer.parseInt((String) order_details_map.get(i).get("qty")));
	         o_detail.setTotalprice((Integer.parseInt((String) order_details_map.get(i).get("totalprice"))));
	         o_detail.setOcompleteone(0);
	         order_details.add(o_detail);
	         
	         basket_Num.add(Integer.parseInt(order_details_map.get(i).get("bno").toString()));
	         
	      }
	      productService.member_BasketDelete(basket_Num,mid);
	      
	      productService.member_OrderInfoInsert(orders,order_details,reservation);
	      return "basket/member_BasketList";
	   }
	   
	   @RequestMapping(value = "member_OrderList")
	   public String member_OrderList(String mid,Model model) {
	      model.addAttribute("member_OrderList", productService.member_OrderList(mid)) ;
	      return "basket/member_OrderList";
	   }
	   
	   @RequestMapping(value = "member_OrderListMyPage")
	   public String member_OrderListMyPage(HttpServletRequest request, Model model) {
		   HttpSession session = request.getSession();
		   String mid = (String)session.getAttribute("mid");
	      model.addAttribute("member_OrderList", productService.member_OrderList(mid)) ;
	      return "member/MyPage";
	   }
	   
	   @RequestMapping(value = "member_OrderListDetail")
	   public String member_OrderListDetail(String ono,Model model) { 
	      model.addAttribute("member_OrderListDetail", productService.member_OrderListDetail(ono)) ;
	      return "basket/member_OrderListDetail";
	   }
	   
	   @RequestMapping(value="member_OrderListConfirm")
	   public String member_OrderListConfirm(String ono,String pid, Model model) {
	      productService.member_OrderListConfirm(ono,pid,model);
	      
	      return "basket/blank";
	   }

	   @RequestMapping(value="memberSelectOne")
	   public String memberSelectOne(String mid,Model model) {
	      model.addAttribute("memberSelectOne", memberService.memberSelectOne(mid));
	      return "member/blank";
	   }

	   @RequestMapping(value="getProductOne")
	   public String getProductOne(String pid,Model model) {
	      model.addAttribute("getProductOne", productService.admin_ProductContentView(pid));
	      return "product/blank";
	   }
	   
	
}
