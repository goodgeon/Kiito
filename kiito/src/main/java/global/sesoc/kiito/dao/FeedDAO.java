package global.sesoc.kiito.dao;

import java.util.ArrayList;

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

	public ArrayList<Feed> feedList() {
		
		FeedMapper mapper = session.getMapper(FeedMapper.class);
		ArrayList<Feed> r = mapper.feedList();
		return r;
	}



	

}
