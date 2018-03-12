package com.tj.health_kitchen2.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.health_kitchen2.model.CurrentProduct;

@Repository
public class CurrentProductDaoImpl implements CurrentProductDao{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int currentProductInsert(CurrentProduct current) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("CurrentProductInsert", current);
	}

	@Override
	public int CurrentProductTotal(String mid) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("CurrentProductTotal",mid);
	}

	@Override
	public List<CurrentProduct> CurrentProductList(CurrentProduct currentProduct) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("CurrentProductList", currentProduct);
	}
	
	@Override
	public int CurrentProductTotal() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("CurrentProductTotal");
	}

}
