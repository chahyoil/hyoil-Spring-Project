package com.tj.health_kitchen2.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.tj.health_kitchen2.model.Basket;
import com.tj.health_kitchen2.model.Member;
import com.tj.health_kitchen2.model.Orders;
import com.tj.health_kitchen2.model.Orders_Detail;
import com.tj.health_kitchen2.model.Product;
import com.tj.health_kitchen2.model.ProductBuyList;
import com.tj.health_kitchen2.model.Reservation;
@Repository
public class ProductDaoImpl implements ProductDao{
	
	@Autowired
	   SqlSessionTemplate sqlSessionTemplate;

	   @Override
	   public List<Product> newProductList(Product product) {
	      // TODO Auto-generated method stub
	      return sqlSessionTemplate.selectList("newProductList", product);
	   }
	   
	   @Override
	   public List<Product> hotItemList() {
	      
	      return sqlSessionTemplate.selectList("hotItemList");
	   }

	   @Override
	   public int total() {
	      // TODO Auto-generated method stub
	      return sqlSessionTemplate.selectOne("newProductTotal");
	   }
	   
	   @Override
	   public Product getItem(String pid) {
	      return sqlSessionTemplate.selectOne("getItem",pid);
	   }

	   @Override
	   public List<Basket> member_BasketList(String mid) {
	      
	      return sqlSessionTemplate.selectList("member_BasketList",mid);
	   }

	   @Override
	   public int member_BasketInsert(Basket basket) {
	      int dupleResult =sqlSessionTemplate.selectOne("member_BasketDupleChk",basket);
	      int result=0;
	      String mid = basket.getMid();
	      System.out.println(mid+"아이디 들어옴??");
	      System.out.println(basket.getBtotal()+"가격 들어옴??");
	      float discount;
	      if(sqlSessionTemplate.selectOne("member_GradeDiscount",mid)==null) {
	    	  discount = 0;
	      }else {
	    	  discount = sqlSessionTemplate.selectOne("member_GradeDiscount",mid);
	      }
	      
	      basket.setBtotal(Math.round(basket.getBtotal()-basket.getBtotal()*discount));
	      System.out.println(discount+"할인율은 어때");
	      if(dupleResult==1) {
	         result=sqlSessionTemplate.update("member_BasketUpdate",basket);
	      }else if(dupleResult==0) {
	         result=sqlSessionTemplate.insert("member_BasketInsert",basket);
	      }
	      return result;
	   }

	   @Override
	   public int member_BasketDelete(ArrayList<Integer> bnos,String mid) {
	      int resultSum=0;
	      for(int i=0;i<bnos.size();i++) {
	      HashMap<String,Object> map =new HashMap<String, Object>();
	      map.put("bno", bnos.get(i));
	      System.out.println(bnos.get(i)+"여기 장바구니 아이디좀 뿌려봐");
	      map.put("mid", mid);
	       resultSum += sqlSessionTemplate.delete("member_BasketDelete",map);
	      }
	      return resultSum;
	   }


	   @Override
	   public Product admin_ProductContentView(String pid) {
	      sqlSessionTemplate.update("ProductUpdateHit",pid);
	      return sqlSessionTemplate.selectOne("admin_ProductContentView",pid);
	   }

	   @Override
	   public List<Product> megasalList(int pmega) {
	      // TODO Auto-generated method stub
	      return sqlSessionTemplate.selectList("megasalList",pmega);
	   }
	   
	   @Override
	   public List<Product> admin_ProductCountList(){
	      
	      return sqlSessionTemplate.selectList("admin_ProductCountList");
	   }

	   @Override
	   public int admin_ProductInsert(Product product) {
	      // TODO Auto-generated method stub
	      return sqlSessionTemplate.insert("admin_ProductInsert",product);
	   }

	   @Override
	   public int admin_ProductDelete(String pid) {
	      // TODO Auto-generated method stub
	      return sqlSessionTemplate.update("admin_ProductDelete",pid);
	   }

	   @Override
	   public int admin_ProductModify(Product product) {
	      // TODO Auto-generated method stub
		   System.out.println("PRODUDCT"+product);
	      return sqlSessionTemplate.update("admin_ProductModify",product);
	   }
	   
	   @Override
	   public List<Product> productAllList() {
	      // TODO Auto-generated method stub
	      return sqlSessionTemplate.selectList("productAllList");
	   }

	   @Override
	   public int member_BasketPlusMinus(Basket basket) {
	      
	      int bcount=basket.getBcount();
	      System.out.println(bcount);
	      if(bcount>0) {
	       return   sqlSessionTemplate.update("member_BasketPlusMinusUpdate",basket);
	      }
	      
	       return sqlSessionTemplate.delete("member_BasketPlusMinusDelete",basket);
	   }

	   @Override
	   public int member_OrderInfoInsert(Orders orders, ArrayList<Orders_Detail> order_details, Reservation reservation) {
	      
	      double random =0;
	      final int ISDUPLICATE = 1;
	      int dupleChk = ISDUPLICATE;
	      String ono = orders.getOno();
	      System.out.println(ono);
	      String mid = orders.getMid();
	      while(dupleChk==1) {
	         dupleChk = sqlSessionTemplate.selectOne("member_OrderInfoDuplicate",orders.getOno());
	         if(dupleChk==1) {
	            random = (int)(Math.random() * 100000000 + 1);
	            ono = mid+""+random;
	            orders.setOno(ono);
	         }
	      }
	      
	      int result =sqlSessionTemplate.insert("member_OrderInfoInsert",orders);
	      if(result>0) {
	         for(int i=0;i<order_details.size();i++) {
	            ono=orders.getOno();
	            order_details.get(i).setOno(ono);
	            result = sqlSessionTemplate.insert("member_OrderInfoInsertDetail",order_details.get(i));
	         }
	      }   
	      result = sqlSessionTemplate.insert("reservationInsert",reservation);
	      return result;
	   }
	   
	   @Override  
	   public List<Orders> member_OrderList(String mid) {
	      // TODO Auto-generated method stub
		   System.out.println(mid);
	      return sqlSessionTemplate.selectList("member_OrderList",mid);
	   }
	   
	   @Override //지금여기
	   public List<Orders_Detail> member_OrderListDetail(String ono) {
		  
	      return sqlSessionTemplate.selectList("member_OrderListDetail",ono);
	   }
	   
	   @Override
	   public int member_OrderListConfirm(String ono,String pid, Model model) {
	      Orders_Detail order_Detail = new Orders_Detail();
	      order_Detail.setOno(ono);
	      order_Detail.setPid(pid);
	      
	      order_Detail=sqlSessionTemplate.selectOne("member_OrderDetailOne",order_Detail);
	      
	      Orders order_Ono=sqlSessionTemplate.selectOne("member_Order",ono);
	      
	      int qty=0;
	      Product getProduct;
	      int result=0;
	      
	      Product product = new Product();
	      pid = order_Detail.getPid();
	      qty = order_Detail.getQty();
	      int totalPrice=order_Detail.getTotalprice();

	      getProduct=sqlSessionTemplate.selectOne("getItem",pid);
	      
	      // 물품 재고 계산을 위해서 pid로 가져옴   
	      product.setPid(pid);
	         
	         if(getProduct.getPstock()-qty>0) {
	            product.setPstock(getProduct.getPstock()-qty);
	         }else {
	            product.setPstock(0);
	         }
	      // 물품 재고를 확정 개수만큼 뺀다.
	         
	      Member member = new Member();
	      member.setMid(order_Ono.getMid());
	      int currTotal = sqlSessionTemplate.selectOne("member_GetTotal",member);
	      
	      System.out.println(currTotal+totalPrice+"여기어떻게되니");
	      member.setMtotal(currTotal+totalPrice);
	      // 물품확정 했을 때 고객이 여태까지 산 가격에 더함   
	      
	      result = sqlSessionTemplate.update("member_MTotalUpdate",member);
	      
	      int UpgradeAlert=0;
	      UpgradeAlert = sqlSessionTemplate.update("member_TotalBronzeUpdate");
	      System.out.println(UpgradeAlert+"이거1");
	      UpgradeAlert += sqlSessionTemplate.update("member_TotalSilverUpdate");
	      System.out.println(UpgradeAlert+"이거2");
	      UpgradeAlert += sqlSessionTemplate.update("member_TotalGoldUpdate");
	      System.out.println(UpgradeAlert+"이거3");
	      
		  System.out.println(UpgradeAlert+"이거 값 머니");
	      if(UpgradeAlert>0) {
	    	  System.out.println(UpgradeAlert+"이거 값");
	    	  model.addAttribute("UpgradeAlert", UpgradeAlert);
	      }
	      
	      result =sqlSessionTemplate.update("member_ProductStockChange",product); // 재고 UPDATE
	      result =sqlSessionTemplate.update("member_OrderListDetailConfirm",order_Detail); //구매확정 UPDATE
	      List<Orders_Detail> order_Onos=sqlSessionTemplate.selectList("member_OrderListDetail",ono);
	      int compleSize=0;
	      
	      for(int i=0;i<order_Onos.size();i++) {
	         compleSize +=order_Onos.get(i).getOcompleteone();
	      }
	      if(order_Onos.size()==compleSize) {
	         result = sqlSessionTemplate.update("member_OrderListConfirm",ono);
	      }
	      
	      return result;
	   }
	
	// 재규
	
	@Override
	public List<Product> searchService(Product product) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("searchList", product);
	}

	@Override
	public List<Product> detailSearchViewService() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("detailSearchListView");
	}
	
	@Override
	public List<Product> detailSearchService(Product product) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("detailSearchList", product);
	}

	@Override
	public List<Product> megaSaleList(int pmegapick) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("megaSaleList",pmegapick);
	}

	@Override
	public List<Product> mdList(int pmdpick) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("mdList", pmdpick);
	}
	//재규쓰
	@Override //지금여기
	   public List<Orders_Detail> Admin_OrderListService(String pid) {
	      // TODO Auto-generated method stub
	      return sqlSessionTemplate.selectList("admin_OrderListDetail",pid);
	   }
	   
	@Override
	   public List<Member> Admin_UserListService() {
	      // TODO Auto-generated method stub
	      return sqlSessionTemplate.selectList("Admin_UserList");
	   } 
	@Override
	   public List<ProductBuyList> admin_buyList() {
	      // TODO Auto-generated method stub
	      return sqlSessionTemplate.selectList("admin_ProductBuyList");
	   }
	   
	@Override
	   public int total(int pcal) {
	      // TODO Auto-generated method stub
	      return sqlSessionTemplate.selectOne("categoryTotal", pcal);
	   }
	@Override
	   public List<Product> category_kcal(Product product) {
	      // TODO Auto-generated method stub
	      return sqlSessionTemplate.selectList("category_kcal", product);
	   }
}
