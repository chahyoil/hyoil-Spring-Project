package com.tj.health_kitchen2.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.health_kitchen2.dao.CurrentProductDao;
import com.tj.health_kitchen2.model.CurrentProduct;

@Service
public class CurrentProductServiceImpl implements CurrentProductService{

	@Autowired
	private CurrentProductDao currentProductDao;
	
	@Override
	public int currentProductInsert(String pid,String mid) {
		CurrentProduct current = new CurrentProduct();
		current.setMid(mid);
		current.setPid(pid);
		return currentProductDao.currentProductInsert(current);
	}

	@Override
	public List<CurrentProduct> CurrentProductList(CurrentProduct currentProduct) {
		// TODO Auto-generated method stub
		return currentProductDao.CurrentProductList(currentProduct);
	}
	
	@Override
	public int total(String mid) {
		// TODO Auto-generated method stub
		return currentProductDao.CurrentProductTotal(mid);
	}

	@Override
	public int total() {
		// TODO Auto-generated method stub
		return currentProductDao.CurrentProductTotal();
	}

}
