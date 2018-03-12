package com.tj.health_kitchen2.model;

//������
public class Admin {
	private String aid;
	private String apw;



	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getApw() {
		return apw;
	}

	public void setApw(String apw) {
		this.apw = apw;
	}

	@Override
	public String toString() {
		return "Admin [aid=" + aid + ", apw=" + apw + "]";
	}
}
