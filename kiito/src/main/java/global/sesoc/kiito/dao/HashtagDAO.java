package global.sesoc.kiito.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import global.sesoc.kiito.vo.Hashtag;

@Repository
public class HashtagDAO {
	
	@Autowired
	private SqlSession session;

	public void insertH(Hashtag hash) {
		
		HashtagMapper mapper = session.getMapper(HashtagMapper.class);
		mapper.insertH(hash);
		
	}


}
