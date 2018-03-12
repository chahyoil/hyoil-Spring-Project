package com.tj.health_kitchen2.Service;

import java.util.List;

import com.tj.health_kitchen2.model.Member;

public interface MemberService {
	
	public int member_IdConfirm(String mid);
	
	public int member_Join(Member member);
	
	public int member_Login(String mid, String mpw);

	public int member_Total();
	
	public List<Member> Admin_UserListService();
	
	 public Member memberSelectOne(String mid);
	
}
