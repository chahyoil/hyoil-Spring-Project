package com.tj.health_kitchen2.dao;

import java.util.List;

import com.tj.health_kitchen2.model.Rboarder;

public interface RBoarderDao {
	public List<Rboarder> member_ReviewList(Rboarder rboarder);

	public int member_ReviewtHit(int rbno);

	public Rboarder member_ReviewContentView(int rbno);

	public int member_ReviewDelete(int rbno);

	public int member_ReviewWrite(Rboarder rboarder);

	public int member_ReviewModify(Rboarder rboarder);

	public int member_ReviewReply(Rboarder rboarder);

	public int cntRboad();


}
