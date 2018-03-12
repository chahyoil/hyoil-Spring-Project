package com.tj.health_kitchen2.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class AdminLogDaoImpl implements AdminLogDao{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int admin_Login(String aid, String apw)  {
		String apw_temp = sqlSessionTemplate.selectOne("admin_Login",aid);
		if(apw.equals(apw_temp)) {
			return 1;
		}
		return 0;
	}
}
