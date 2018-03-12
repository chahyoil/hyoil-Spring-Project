package com.tj.health_kitchen2.model;

public class Page {
	private int startRow;
	private int endRow;
	@Override
	public String toString() {
		return "Page [startRow=" + startRow + ", endRow=" + endRow + "]";
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
