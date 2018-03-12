package com.tj.health_kitchen2.Service;

import java.util.List;

import com.tj.health_kitchen2.model.CurrentProduct;

public interface CurrentProductService {
	public int currentProductInsert(String pid,String mid);
	public int total(String mid);
	public int total();
	public List<CurrentProduct> CurrentProductList(CurrentProduct currentProduct);
}
