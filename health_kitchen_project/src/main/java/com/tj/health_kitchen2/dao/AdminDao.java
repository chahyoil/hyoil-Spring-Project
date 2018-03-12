package com.tj.health_kitchen2.dao;

import java.util.ArrayList;
import java.util.List;

import com.tj.health_kitchen2.model.Admin;
import com.tj.health_kitchen2.model.Member;
import com.tj.health_kitchen2.model.Orders;
import com.tj.health_kitchen2.model.Orders_Detail;
import com.tj.health_kitchen2.model.Page;
import com.tj.health_kitchen2.model.Product;

public interface AdminDao {
	public int admin_View(Admin admin);
	public List<Admin> getAdmin();
	public List<Member> admin_ReviewData();
	public int admin_UserLevelupService(String mid);
	public int admin_Block(String mid);
	public int admin_OrderShipping(Orders_Detail orders_Detail);
	public int admin_ProductStockChange(Product product);
	public int admin_OrderShippingAll(Orders orders);
	public List<Member> admin_UserList(Page page);
}
