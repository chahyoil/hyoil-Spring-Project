package com.tj.health_kitchen2.model;

import java.sql.Date;

public class NBoard {
	private int nbno;
	private String aid;
	private String nbtitle;
	private String nbcontent;
	private int nbhit;
	private String nbfile;
	private int nbref;
	private int nbstep;
	private int nblevel;
	private Date nbtime;
	private int startRow;
	private int endRow;
	
	public int getNbno() {
		return nbno;
	}
	public void setNbno(int nbno) {
		this.nbno = nbno;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getNbtitle() {
		return nbtitle;
	}
	public void setNbtitle(String nbtitle) {
		this.nbtitle = nbtitle;
	}
	public String getNbcontent() {
		return nbcontent;
	}
	public void setNbcontent(String nbcontent) {
		this.nbcontent = nbcontent;
	}
	public int getNbhit() {
		return nbhit;
	}
	public void setNbhit(int nbhit) {
		this.nbhit = nbhit;
	}
	public String getNbfile() {
		return nbfile;
	}
	public void setNbfile(String nbfile) {
		this.nbfile = nbfile;
	}
	public int getNbref() {
		return nbref;
	}
	public void setNbref(int nbref) {
		this.nbref = nbref;
	}
	public int getNbstep() {
		return nbstep;
	}
	public void setNbstep(int nbstep) {
		this.nbstep = nbstep;
	}
	public int getNblevel() {
		return nblevel;
	}
	public void setNblevel(int nblevel) {
		this.nblevel = nblevel;
	}
	public Date getNbtime() {
		return nbtime;
	}
	public void setNbtime(Date nbtime) {
		this.nbtime = nbtime;
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
		return "NBoard [nbno=" + nbno + ", aid=" + aid + ", nbtitle=" + nbtitle + ", nbcontent=" + nbcontent
				+ ", nbhit=" + nbhit + ", nbfile=" + nbfile + ", nbref=" + nbref + ", nbstep=" + nbstep + ", nblevel="
				+ nblevel + ", nbtime=" + nbtime + ", startRow=" + startRow + ", endRow=" + endRow + "]";
	}	
	
}//NBoard
