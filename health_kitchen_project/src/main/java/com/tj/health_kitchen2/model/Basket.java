package com.tj.health_kitchen2.model;

//��ٱ���
public class Basket {
	private int bno; // ��ٱ��Ϲ�ȣ
	private String mid; // ȸ�����̵�
	private String pid; // ��ǰ��ȣ
	private int bcount; // ����
	private int btotal;// ����+����
	private int startRow;
	private int endRow;
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
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
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
		return "Basket [bno=" + bno + ", mid=" + mid + ", pid=" + pid + ", bcount=" + bcount + ", btotal=" + btotal
				+ ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}
	
	

}
