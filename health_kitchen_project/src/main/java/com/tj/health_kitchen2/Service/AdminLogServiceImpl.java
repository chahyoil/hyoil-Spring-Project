package com.tj.health_kitchen2.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tj.health_kitchen2.dao.AdminLogDao;

@Service
public class AdminLogServiceImpl implements AdminLogService {
	
	@Autowired
	private AdminLogDao adminLogDao;
	@Override
	public int admin_Login(String aid, String apw) {
		return adminLogDao.admin_Login(aid,apw);
	}
}
