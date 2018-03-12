package com.tj.health_kitchen2.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;

import com.tj.health_kitchen2.model.Basket;
import com.tj.health_kitchen2.model.Member;
import com.tj.health_kitchen2.model.Orders;
import com.tj.health_kitchen2.model.Orders_Detail;
import com.tj.health_kitchen2.model.Product;
import com.tj.health_kitchen2.model.ProductBuyList;
import com.tj.health_kitchen2.model.Reservation;

public interface ProductDao {
	public List<Product> newProductList(Product product);
	   public List<Product> hotItemList();
	   public int total();
	   public Product getItem(String pid);
	   public List<Basket> member_BasketList(String mid);
	   public int member_BasketInsert(Basket basket);
	   public int member_BasketDelete(ArrayList<Integer> bnos,String mid);
	   public Product admin_ProductContentView(String pid);
	   public List<Product> megasalList(int pmega);
	   public List<Product> admin_ProductCountList();
	   public int admin_ProductInsert(Product product);
	   public int admin_ProductDelete(String pid);
	   public int admin_ProductModify(Product product);
	   public List<Product> productAllList();
	   public int member_BasketPlusMinus(Basket basket);
	   public int member_OrderInfoInsert(Orders orders, ArrayList<Orders_Detail> order_details, Reservation reservation);
	   public List<Orders> member_OrderList(String mid);
	   public List<Orders_Detail> member_OrderListDetail(String ono);
	   public int member_OrderListConfirm(String ono, String pid,Model model);
	
	  
	
	// 재규
	
	public List<Product> searchService(Product product);
	public List<Product> detailSearchViewService();
	public List<Product> detailSearchService(Product product);
	public List<Orders_Detail> Admin_OrderListService(String pid);
	public List<Member> Admin_UserListService();
	public List<ProductBuyList> admin_buyList();
	public int total(int pcal);
	public List<Product> category_kcal(Product product);

	
	//지원
	public List<Product> megaSaleList(int pmegapick);
	public List<Product> mdList(int pmdpick);
	
	
	
}
