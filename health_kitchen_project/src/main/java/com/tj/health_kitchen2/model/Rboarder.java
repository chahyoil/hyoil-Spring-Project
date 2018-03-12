package com.tj.health_kitchen2.model;
//Review�Խ���

import java.util.Date;

public class Rboarder {
	private int rbno;
	private String rbtitle;
	private String rbcontent;
	private int rbhit;
	private String rbfile;
	private int rbgroup;
	private int rbref;
	private int rbstep;
	private int rblevel;
	private Date rbtime;
	private String mid;
	private String aid;
	private String pid;
	private int startRow;
	private int endRow;

	public Rboarder() {
		// TODO Auto-generated constructor stub
	}

	public Rboarder(int rbno, String rbtitle, String rbcontent, int rbhit, String rbfile, int rbgroup, int rbref,
			int rbstep, int rblevel, Date rbtime, String mid, String aid, String pid, int startRow, int endRow) {
		super();
		this.rbno = rbno;
		this.rbtitle = rbtitle;
		this.rbcontent = rbcontent;
		this.rbhit = rbhit;
		this.rbfile = rbfile;
		this.rbgroup = rbgroup;
		this.rbref = rbref;
		this.rbstep = rbstep;
		this.rblevel = rblevel;
		this.rbtime = rbtime;
		this.mid = mid;
		this.aid = aid;
		this.pid = pid;
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public int getRbno() {
		return rbno;
	}

	public void setRbno(int rbno) {
		this.rbno = rbno;
	}

	public String getRbtitle() {
		return rbtitle;
	}

	public void setRbtitle(String rbtitle) {
		this.rbtitle = rbtitle;
	}

	public String getRbcontent() {
		return rbcontent;
	}

	public void setRbcontent(String rbcontent) {
		this.rbcontent = rbcontent;
	}

	public int getRbhit() {
		return rbhit;
	}

	public void setRbhit(int rbhit) {
		this.rbhit = rbhit;
	}

	public String getRbfile() {
		return rbfile;
	}

	public void setRbfile(String rbfile) {
		this.rbfile = rbfile;
	}

	public int getRbgroup() {
		return rbgroup;
	}

	public void setRbgroup(int rbgroup) {
		this.rbgroup = rbgroup;
	}

	public int getRbref() {
		return rbref;
	}

	public void setRbref(int rbref) {
		this.rbref = rbref;
	}

	public int getRbstep() {
		return rbstep;
	}

	public void setRbstep(int rbstep) {
		this.rbstep = rbstep;
	}

	public int getRblevel() {
		return rblevel;
	}

	public void setRblevel(int rblevel) {
		this.rblevel = rblevel;
	}

	public Date getRbtime() {
		return rbtime;
	}

	public void setRbtime(Date rbtime) {
		this.rbtime = rbtime;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
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

	@Override
	public String toString() {
		return "Rboarder [rbno=" + rbno + ", rbtitle=" + rbtitle + ", rbcontent=" + rbcontent + ", rbhit=" + rbhit
				+ ", rbfile=" + rbfile + ", rbgroup=" + rbgroup + ", rbref=" + rbref + ", rbstep=" + rbstep
				+ ", rblevel=" + rblevel + ", rbtime=" + rbtime + ", mid=" + mid + ", aid=" + aid + ", pid=" + pid
				+ ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}

}
