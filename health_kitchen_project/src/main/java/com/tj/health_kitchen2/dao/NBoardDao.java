package com.tj.health_kitchen2.dao;

import java.util.List;

import com.tj.health_kitchen2.model.NBoard;


public interface NBoardDao {
	public List<NBoard> getNBoardList(NBoard nBoard);
	public int admin_NoticeContentHit(int nbno);
	public NBoard getNBoardDetail(int nbno);
	public int getNBoardDelete(int nbno);
	public int NBoardWrite(NBoard nBoard);
	public int NBoardUpdate(NBoard nBoard);
	public int total();
}
