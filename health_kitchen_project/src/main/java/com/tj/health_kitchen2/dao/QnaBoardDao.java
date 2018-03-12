package com.tj.health_kitchen2.dao;

import java.util.List;

import com.tj.health_kitchen2.model.QnaBoard;

public interface QnaBoardDao {
	public List<QnaBoard> getQnaBoardList(QnaBoard qnaBoard);
	public int member_QnAContentHit(int qbno);
	public QnaBoard getQnaBoardDetail(int qbno);
	public int getQnaBoardDelete(int qbno);
	public int QnaBoardWrite(QnaBoard qnaBoard);
	public int QnaBoardUpdate(QnaBoard qnaBoard);
	public int total();
	
	public int QnaBoardReply(QnaBoard qnaBoard);
	public int replyAstep(QnaBoard qnaBoard);
}
