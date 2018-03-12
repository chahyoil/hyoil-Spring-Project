package com.tj.health_kitchen2.model;

import java.util.Date;

public class Member {
	private String mid; // ȸ�����̵�
	private String mpw; // ȸ����й�ȣ
	private int mblock; // ȸ����
	private String mname; // ȸ���̸�
	private String mgender; // ����
	private String mtel; // ����ó
	private String memail;//�̸���
	private String mpostnum; // �����ȣ
	private String maddress; // �ּ�
	private Date mjoindate; // ���Գ�¥
	private int mtotal; // �����Ѱ���
	private int mlevelno;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public int getMblock() {
		return mblock;
	}
	public void setMblock(int mblock) {
		this.mblock = mblock;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMgender() {
		return mgender;
	}
	public void setMgender(String mgender) {
		this.mgender = mgender;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMpostnum() {
		return mpostnum;
	}
	public void setMpostnum(String mpostnum) {
		this.mpostnum = mpostnum;
	}
	public String getMaddress() {
		return maddress;
	}
	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}
	public Date getMjoindate() {
		return mjoindate;
	}
	public void setMjoindate(Date mjoindate) {
		this.mjoindate = mjoindate;
	}
	public int getMtotal() {
		return mtotal;
	}
	public void setMtotal(int mtotal) {
		this.mtotal = mtotal;
	}
	public int getMlevelno() {
		return mlevelno;
	}
	public void setMlevelno(int mlevelno) {
		this.mlevelno = mlevelno;
	} // ȸ����޹�ȣ

}
