package com.tj.health_kitchen2.Service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.tj.health_kitchen2.model.Admin;
import com.tj.health_kitchen2.model.Member;
import com.tj.health_kitchen2.model.Page;


public interface AdminService {
	public int admin_View(String aid);
	public List<Admin> getAdmin();
	public int idConfirm(String aid);
	public int joinAdmin(Admin admin);
	public int modifyAdmin(Admin admin);
	public String loginCheck(String aid, String apw, HttpSession httpSession);
	public List<Member> admin_ReviewData();
	public int admin_UserLevelupService(String mid);
	public int admin_Block(String mid);
	public int admin_OrderShipping(String ono, String pid);
	public int admin_ProductStockChange(String pid, int qtyMinus);
	public int admin_OrderShippingAll(String ono);
	public List<Member> admin_UserList(Page page);
}
