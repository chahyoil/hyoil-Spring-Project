package com.tj.health_kitchen2.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.tj.health_kitchen2.dao.MemberDao;
import com.tj.health_kitchen2.model.Member;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao memberDao;
	private JavaMailSender mailSender;
	@Override
	public int member_IdConfirm(String mid) {
		return memberDao.member_Idconfirm(mid);
	}
	@Override
	public int member_Join(Member member) {
		
		return memberDao.member_Join(member);
	}
	@Override
	public int member_Login(String mid, String mpw) {
		return memberDao.member_Login(mid,mpw);
	}
	
	@Override
	public int member_Total() {
		return memberDao.member_Total();
	}
	@Override
	   public List<Member> Admin_UserListService() {
	      // TODO Auto-generated method stub
	      return memberDao.Admin_UserListService();
	   }
	@Override
	   public Member memberSelectOne(String mid) {
	      // TODO Auto-generated method stub
	      return memberDao.memberSelectOne(mid);
	   }
	
	
}
