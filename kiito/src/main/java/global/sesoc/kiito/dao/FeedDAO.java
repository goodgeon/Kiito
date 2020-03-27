package global.sesoc.kiito.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.kiito.vo.Feed;

@Repository
public class FeedDAO {
	
	@Autowired
	private SqlSession session;

	public void insertFeed(Feed feed) {
		FeedMapper mapper = session.getMapper(FeedMapper.class);
		mapper.insertFeed(feed);
		
	}

}
