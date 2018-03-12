package com.tj.health_kitchen2.model;

import java.sql.Date;

public class CurrentProduct {
	private int cno;
	private String mid;
	private String pid;
	private String pname;
	private String pimage;
	private Date ctime;
	private int startRow;
	private int endRow;
	
	@Override
	public String toString() {
		return "CurrentProduct [cno=" + cno + ", mid=" + mid + ", pid=" + pid + ", pname=" + pname + ", pimage="
				+ pimage + ", ctime=" + ctime + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
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
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public Date getCtime() {
		return ctime;
	}
	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	
	
	
	
}
