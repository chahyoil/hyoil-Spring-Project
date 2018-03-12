package com.tj.health_kitchen2.model;

import java.sql.Date;

public class QnaBoard {
	private int qbno;
	private String aid;
	private String mid;
	private String qbtitle;
	private String qbcontent;
	private int qbhit;
	private String qbfile;
	private int qbref;
	private int qbstep;
	private int qblevel;
	private Date qbtime;
	private int startRow;
	private int endRow;
	
	
	
	
	
	@Override
	public String toString() {
		return "QnaBoard [qbno=" + qbno + ", aid=" + aid + ", mid=" + mid + ", qbtitle=" + qbtitle + ", qbcontent="
				+ qbcontent + ", qbhit=" + qbhit + ", qbfile=" + qbfile + ", qbref=" + qbref + ", qbstep=" + qbstep
				+ ", qblevel=" + qblevel + ", qbtime=" + qbtime + "]";
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


	public int getQbno() {
		return qbno;
	}
	public void setQbno(int qbno) {
		this.qbno = qbno;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getQbtitle() {
		return qbtitle;
	}
	public void setQbtitle(String qbtitle) {
		this.qbtitle = qbtitle;
	}
	public String getQbcontent() {
		return qbcontent;
	}
	public void setQbcontent(String qbcontent) {
		this.qbcontent = qbcontent;
	}
	public int getQbhit() {
		return qbhit;
	}
	public void setQbhit(int qbhit) {
		this.qbhit = qbhit;
	}
	public String getQbfile() {
		return qbfile;
	}
	public void setQbfile(String qbfile) {
		this.qbfile = qbfile;
	}
	public int getQbref() {
		return qbref;
	}
	public void setQbref(int qbref) {
		this.qbref = qbref;
	}
	public int getQbstep() {
		return qbstep;
	}
	public void setQbstep(int qbstep) {
		this.qbstep = qbstep;
	}
	public int getQblevel() {
		return qblevel;
	}
	public void setQblevel(int qblevel) {
		this.qblevel = qblevel;
	}
	public Date getQbtime() {
		return qbtime;
	}
	public void setQbtime(Date qbtime) {
		this.qbtime = qbtime;
	}
	
	
	
}
