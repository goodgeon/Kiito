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

	public void updateL(int feed_seq) {			//좋아요 올리기
		FeedMapper mapper = session.getMapper(FeedMapper.class);
		mapper.updateL(feed_seq);
		
	}

	public void downLike(int feed_seq) {		//좋아요 내리기
		FeedMapper mapper = session.getMapper(FeedMapper.class);
		mapper.downLike(feed_seq);
		
	}

	public Feed getFeed(int feed_seq) {
		
		FeedMapper mapper = session.getMapper(FeedMapper.class);
		Feed feed = mapper.getFeed(feed_seq);
		return feed;
	}

	public int countF(int customer_seq) {
		
		FeedMapper mapper = session.getMapper(FeedMapper.class);
		int cf = mapper.countF(customer_seq);
		return cf;
		
	}

	public ArrayList<Feed> feedList1(int customer_seq) {
		
		FeedMapper mapper = session.getMapper(FeedMapper.class);
		ArrayList<Feed> r = mapper.feedList1(customer_seq);
		return r;
	}

	public ArrayList<Feed> search(String search) {
		FeedMapper mapper = session.getMapper(FeedMapper.class);
		ArrayList<Feed> list = mapper.search(search);
		
		return list;
	}





	

}
