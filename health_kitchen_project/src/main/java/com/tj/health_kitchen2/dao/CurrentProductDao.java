package com.tj.health_kitchen2.dao;

import java.util.List;

import com.tj.health_kitchen2.model.CurrentProduct;

public interface CurrentProductDao {
	public int currentProductInsert(CurrentProduct current);
	public int CurrentProductTotal(String mid);
	public int CurrentProductTotal();
	public List<CurrentProduct> CurrentProductList(CurrentProduct currentProduct);
}
