package global.sesoc.kiito.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HashtagDAO {
	
	@Autowired
	private SqlSession session;


}
