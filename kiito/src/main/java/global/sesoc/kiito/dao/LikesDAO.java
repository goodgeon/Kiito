package global.sesoc.kiito.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.kiito.vo.Likes;

@Repository
public class LikesDAO {

	@Autowired
	private SqlSession session;

	public Likes getLikes(int feed_seq, int customer_seq) {
		
		HashMap <String, Integer> map = new HashMap<>();
		map.put("feed_seq",feed_seq);
		map.put("customer_seq",customer_seq);
		
		LikesMapper gm = session.getMapper(LikesMapper.class);
		Likes a = gm.getLikes(map);

		return a;

	
	}

	public void insertL(int feed_seq, int customer_seq) {
		
		HashMap <String, Integer> map = new HashMap<>();
		map.put("feed_seq",feed_seq);
		map.put("customer_seq",customer_seq);
		
		LikesMapper gm = session.getMapper(LikesMapper.class);
		 gm.insertL(map);
		
	}

	public void deleteL(int feed_seq, int customer_seq) {
		HashMap <String, Integer> map = new HashMap<>();
		map.put("feed_seq",feed_seq);
		map.put("customer_seq",customer_seq);
		
		LikesMapper gm = session.getMapper(LikesMapper.class);
		 gm.deleteL(map);
		
	}

	

	
}
