package com.tj.health_kitchen2.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tj.health_kitchen2.model.Rboarder;

@Repository
public class RBoarderDaoImpl implements RBoarderDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int cntRboad() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("cntRboad");
	}
	@Override
	public List<Rboarder> member_ReviewList(Rboarder rboarder) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member_ReviewList",rboarder);
	}
	@Override
	public int member_ReviewtHit(int rbno) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("member_ReviewUpdateHit", rbno);
	}


	@Override
	public Rboarder member_ReviewContentView(int rbno) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member_ReviewContentView", rbno);
	}

	@Override
	public int member_ReviewDelete(int rbno) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("member_ReviewDelete", rbno);
	}

	@Override
	public int member_ReviewWrite(Rboarder rboarder) {
		// TODO Auto-generated method stub
		System.out.println("이거 값 어떻게 들어오니??"+rboarder);
		return sqlSessionTemplate.insert("member_ReviewWrite", rboarder);
	}

	@Override
	public int member_ReviewModify(Rboarder rboarder) {
		// TODO Auto-generated method stub
		System.out.println("Dao���ư�");
		return sqlSessionTemplate.update("member_ReviewModify", rboarder);
	}

	@Override
	public int member_ReviewReply(Rboarder rboarder) {
		// TODO Auto-generated method stub
		System.out.println("Dao���� �亯���ư�");
		return sqlSessionTemplate.insert("member_ReviewReply", rboarder);
	}

	

	
	

	

}
