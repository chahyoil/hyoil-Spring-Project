package com.tj.health_kitchen2.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.health_kitchen2.model.NBoard;

@Repository
public class NBoardDaoImpl implements NBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessiontemplate;

	@Override
	public List<NBoard> getNBoardList(NBoard nBoard) {
		// TODO Auto-generated method stub
		return sqlSessiontemplate.selectList("NBoardList", nBoard);
	}

	@Override
	public int admin_NoticeContentHit(int nbno) {
		// TODO Auto-generated method stub
		return sqlSessiontemplate.update("NBoardUpdateHit", nbno);
	}

	@Override
	public NBoard getNBoardDetail(int nbno) {
		// TODO Auto-generated method stub
		return sqlSessiontemplate.selectOne("NBoardDetail", nbno);
	}

	@Override
	public int getNBoardDelete(int nbno) {
		// TODO Auto-generated method stub
		return sqlSessiontemplate.delete("NBoardDelete", nbno);
	}

	@Override
	public int NBoardWrite(NBoard nBoard) {
		// TODO Auto-generated method stub
		return sqlSessiontemplate.insert("NBoardWrite", nBoard);
	}

	@Override
	public int NBoardUpdate(NBoard nBoard) {
		// TODO Auto-generated method stub
		return sqlSessiontemplate.update("NBoardUpdate", nBoard);
	}

	@Override
	public int total() {
		// TODO Auto-generated method stub
		return sqlSessiontemplate.selectOne("NBoardTotal");
	}

}
