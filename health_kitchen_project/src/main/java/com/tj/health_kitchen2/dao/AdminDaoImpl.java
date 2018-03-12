package com.tj.health_kitchen2.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.health_kitchen2.model.Admin;
import com.tj.health_kitchen2.model.Member;
import com.tj.health_kitchen2.model.Orders;
import com.tj.health_kitchen2.model.Orders_Detail;
import com.tj.health_kitchen2.model.Page;
import com.tj.health_kitchen2.model.Product;
@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	@Override
	public int admin_View(Admin admin) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectOne("admin_View",admin);
	}
	
	@Override
	public List<Admin> getAdmin() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("adminList");
	}

	@Override
	public List<Member> admin_ReviewData() {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("admin_ReviewData");
	}

	@Override
	public int admin_UserLevelupService(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("admin_UserLevelupService",mid);
	}

	@Override
	public int admin_Block(String mid) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("admin_Block",mid);
	}

	@Override
	public int admin_OrderShipping(Orders_Detail orders_Detail) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("admin_OrderShipping",orders_Detail);
	}

	@Override
	public int admin_ProductStockChange(Product product) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("admin_ProductStockChange",product);
	}

	@Override
	public int admin_OrderShippingAll(Orders orders) {
		// TODO Auto-generated method stub
		return sessionTemplate.update("admin_OrderShippingAll",orders);
	}

	@Override
	public List<Member> admin_UserList(Page page) {
		// TODO Auto-generated method stub
		return sessionTemplate.selectList("admin_UserList",page);
	}

}
