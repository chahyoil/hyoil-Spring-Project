package com.tj.health_kitchen2.model;

public class Orders_Detail {
	private String ono;
	private String pid;
	private String pname;
	private int qty;
	private int totalprice;
	private int ocompleteone;
	private String ophone;// 배송지전화
	public String getOphone() {
		return ophone;
	}
	public void setOphone(String ophone) {
		this.ophone = ophone;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public int getOcompleteone() {
		return ocompleteone;
	}
	public void setOcompleteone(int ocompleteone) {
		this.ocompleteone = ocompleteone;
	}
	@Override
	public String toString() {
		return "Orders_Detail [ono=" + ono + ", pid=" + pid + ", pname=" + pname + ", qty=" + qty + ", totalprice="
				+ totalprice + ", ocompleteone=" + ocompleteone + "]";
	}
 
	
}
