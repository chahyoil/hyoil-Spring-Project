package com.tj.health_kitchen2.model;

import java.sql.Timestamp;

public class ProductBasket {
	private String pid;
	private String pname;
	private int pcal;
	private int pmegapick;
	private int pmdpick;
	private String pmain;
	private int pstock;
	private int pprice;
	private String pcontent;
	private float prate;
	private String pimage;
	private Timestamp phiredate;
	private int phit;
	private int bno; 
	private String mid; 
	private int bcount; 
	private int btotal;
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPcal() {
		return pcal;
	}
	public void setPcal(int pcal) {
		this.pcal = pcal;
	}
	public int getPmegapick() {
		return pmegapick;
	}
	public void setPmegapick(int pmegapick) {
		this.pmegapick = pmegapick;
	}
	public int getPmdpick() {
		return pmdpick;
	}
	public void setPmdpick(int pmdpick) {
		this.pmdpick = pmdpick;
	}
	public String getPmain() {
		return pmain;
	}
	public void setPmain(String pmain) {
		this.pmain = pmain;
	}
	public int getPstock() {
		return pstock;
	}
	public void setPstock(int pstock) {
		this.pstock = pstock;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public String getPcontent() {
		return pcontent;
	}
	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}
	public float getPrate() {
		return prate;
	}
	public void setPrate(float prate) {
		this.prate = prate;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public Timestamp getPhiredate() {
		return phiredate;
	}
	public void setPhiredate(Timestamp phiredate) {
		this.phiredate = phiredate;
	}
	public int getPhit() {
		return phit;
	}
	public void setPhit(int phit) {
		this.phit = phit;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getBcount() {
		return bcount;
	}
	public void setBcount(int bcount) {
		this.bcount = bcount;
	}
	public int getBtotal() {
		return btotal;
	}
	public void setBtotal(int btotal) {
		this.btotal = btotal;
	}
	@Override
	public String toString() {
		return "ProductBasket [pid=" + pid + ", pname=" + pname + ", pcal=" + pcal + ", pmegapick=" + pmegapick
				+ ", pmdpick=" + pmdpick + ", pmain=" + pmain + ", pstock=" + pstock + ", pprice=" + pprice
				+ ", pcontent=" + pcontent + ", prate=" + prate + ", pimage=" + pimage + ", phiredate=" + phiredate
				+ ", phit=" + phit + ", bno=" + bno + ", mid=" + mid + ", bcount=" + bcount + ", btotal=" + btotal
				+ "]";
	}
	
	
}
