package com.tj.health_kitchen2.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.health_kitchen2.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public int member_Idconfirm(String mid) {
		
		return sqlSessionTemplate.selectOne("member_Idconfirm",mid);
	}

	@Override
	public int member_Join(Member member) {
		
		return sqlSessionTemplate.insert("member_Join",member);
	}

	@Override
	public int member_Login(String mid, String mpw) {
		String mpw_temp = sqlSessionTemplate.selectOne("member_Login",mid);
		System.out.println(11+mid+22+mpw+33+mpw_temp);
		if(mpw.equals(mpw_temp)) {
			return 1;
		}
		return 0;
	}
	
	@Override
	   public Member memberSelectOne(String mid) {
	      return sqlSessionTemplate.selectOne("memberSelectOne",mid);
	   }

	@Override
	public int member_Total() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member_Total");
	}
	
	@Override
	   public List<Member> Admin_UserListService() {
	      // TODO Auto-generated method stub
	      return sqlSessionTemplate.selectList("Admin_UserList");
	   }

}
