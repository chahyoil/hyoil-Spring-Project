package com.tj.health_kitchen2.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.health_kitchen2.model.QnaBoard;
@Repository
public class QnaBoardDaoImpl implements QnaBoardDao{

	@Autowired
	private SqlSessionTemplate sqlSessiontemplate;
	
	@Override
	public int total() {
		// TODO Auto-generated method stub
		return sqlSessiontemplate.selectOne("QnaBoardTotal");
	}
	
	@Override
	public List<QnaBoard> getQnaBoardList(QnaBoard qnaBoard) {
		// TODO Auto-generated method stub
		return sqlSessiontemplate.selectList("QnaBoardList", qnaBoard);
	}

	@Override
	public int member_QnAContentHit(int qbno) {
		// TODO Auto-generated method stub
		return sqlSessiontemplate.update("QnaBoardUpdateHit", qbno);
	}
	
	@Override
	public QnaBoard getQnaBoardDetail(int qbno) {
		// TODO Auto-generated method stub
		return sqlSessiontemplate.selectOne("QnaBoardDetail", qbno);
	}

	@Override
	public int getQnaBoardDelete(int qbno) {
		// TODO Auto-generated method stub
		return sqlSessiontemplate.delete("QnaBoardDelete", qbno);
	}

	@Override
	public int QnaBoardWrite(QnaBoard qnaBoard) {
		// TODO Auto-generated method stub
		return sqlSessiontemplate.insert("QnaBoardWrite", qnaBoard);
	}

	@Override
	public int QnaBoardUpdate(QnaBoard qnaBoard) {
		// TODO Auto-generated method stub
		return sqlSessiontemplate.update("QnaBoardUpdate", qnaBoard);
	}

	@Override
	public int QnaBoardReply(QnaBoard qnaBoard) {
		// TODO Auto-generated method stub
		return sqlSessiontemplate.insert("QnaBoardReply", qnaBoard);
	}

	@Override
	public int replyAstep(QnaBoard qnaBoard) {
		// TODO Auto-generated method stub
		return sqlSessiontemplate.update("QnaBoardReplyAstep", qnaBoard);
	}



}
