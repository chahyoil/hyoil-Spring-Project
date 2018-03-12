package com.tj.health_kitchen2.model;

import java.sql.Timestamp;

public class Orders {
	   private String ono; // 주문번호
	   private String mid;// 회원아이디
	   private Timestamp odate;// 주문날짜
	   private String oaddress;// 배송지주소
	   private String ophone;// 배송지전화
	   private int ocompleteall;
	public String getOno() {
		return ono;
	}
	public void setOno(String ono) {
		this.ono = ono;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Timestamp getOdate() {
		return odate;
	}
	public void setOdate(Timestamp odate) {
		this.odate = odate;
	}
	public String getOaddress() {
		return oaddress;
	}
	public void setOaddress(String oaddress) {
		this.oaddress = oaddress;
	}
	public String getOphone() {
		return ophone;
	}
	public void setOphone(String ophone) {
		this.ophone = ophone;
	}
	public int getOcompleteall() {
		return ocompleteall;
	}
	public void setOcompleteall(int ocompleteall) {
		this.ocompleteall = ocompleteall;
	}
 	   
}