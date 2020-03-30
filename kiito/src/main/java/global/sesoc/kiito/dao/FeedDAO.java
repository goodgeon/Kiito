package global.sesoc.kiito.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.kiito.vo.Feed;
import global.sesoc.kiito.vo.Hashtag;

@Repository
public class FeedDAO {
	
	@Autowired
	private SqlSession session;

	public int insertFeed(Feed feed) {
		FeedMapper mapper = session.getMapper(FeedMapper.class);
		//mapper.insertFeed(feed);
		return session.insert("insertFeed",feed);
	}

	public void insertHash(Hashtag hash) {
		FeedMapper mapper = session.getMapper(FeedMapper.class);
		mapper.insertHash(hash);
				
	}

	

}
