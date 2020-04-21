package global.sesoc.kiito.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import global.sesoc.kiito.vo.Pfile;

@Repository
public class PfileDAO {
	
	@Autowired
	private SqlSession session;

	public void insertp(Pfile p) {
		PfileMapper g = session.getMapper(PfileMapper.class);
		g.insertp(p);
		
	}

}
