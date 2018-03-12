package com.tj.health_kitchen2.Service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.health_kitchen2.dao.AdminDao;
import com.tj.health_kitchen2.dao.ProductDao;
import com.tj.health_kitchen2.model.Admin;
import com.tj.health_kitchen2.model.Member;
import com.tj.health_kitchen2.model.Orders;
import com.tj.health_kitchen2.model.Orders_Detail;
import com.tj.health_kitchen2.model.Page;
import com.tj.health_kitchen2.model.Product;
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao dao;
	
	@Autowired
	private ProductDao productDao;

	@Override
	public int admin_View(String aid) {
		Admin admin=new Admin();
		admin.setAid(aid);
		int result=dao.admin_View(admin);
		return result;
	}
	
	@Override
	public List<Admin> getAdmin() {
		// TODO Auto-generated method stub
		return dao.getAdmin();
	}

	@Override
	public int idConfirm(String aid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int joinAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String loginCheck(String aid, String apw, HttpSession httpSession) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int modifyAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Member> admin_ReviewData() {
		return dao.admin_ReviewData();
	}

	@Override
	public int admin_UserLevelupService(String mid) {
		return dao.admin_UserLevelupService(mid);
	}

	@Override
	public int admin_Block(String mid) {
		// TODO Auto-generated method stub
		return dao.admin_Block(mid);
	}

	@Override
	public int admin_OrderShipping(String ono, String pid) {
		Orders_Detail orders_Detail = new Orders_Detail();
		orders_Detail.setOno(ono);
		orders_Detail.setPid(pid);
		return dao.admin_OrderShipping(orders_Detail);
	}

	@Override
	public int admin_ProductStockChange(String pid, int qtyMinus) {
		Product product;
		product = productDao.getItem(pid);
		int ProductStock=product.getPstock();
		ProductStock = ProductStock - qtyMinus;
		product.setPstock(ProductStock);
		return dao.admin_ProductStockChange(product);
	}

	@Override
	public int admin_OrderShippingAll(String ono) {
		Orders orders = new Orders();
		orders.setOno(ono);
		return dao.admin_OrderShippingAll(orders);
	}

	@Override
	public List<Member> admin_UserList(Page page) {
		// TODO Auto-generated method stub
		return dao.admin_UserList(page);
	}


}
