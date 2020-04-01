package global.sesoc.kiito.dao;

import java.util.ArrayList;

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

	public ArrayList<Hashtag> getList() {
		ArrayList<Hashtag> list = null;
		HashtagMapper mapper = session.getMapper(HashtagMapper.class);
		list = mapper.getList();
		return list;
	}


}
