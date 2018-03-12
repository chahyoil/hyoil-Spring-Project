package com.tj.health_kitchen2.dao;

import java.util.List;

import com.tj.health_kitchen2.model.Member;

public interface MemberDao {
	public int member_Idconfirm(String mid);
	public int member_Join(Member member);
	public int member_Login(String mid, String mpw);
	public int member_Total();
	public List<Member> Admin_UserListService();
	public Member memberSelectOne(String mid);
	//public Member member_SnsLogin(String snsId);
}
