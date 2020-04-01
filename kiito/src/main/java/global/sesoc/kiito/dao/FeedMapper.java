package global.sesoc.kiito.dao;

import java.util.ArrayList;

import global.sesoc.kiito.vo.Feed;
import global.sesoc.kiito.vo.Hashtag;

public interface FeedMapper {

	int insertFeed(Feed feed);

	ArrayList<Feed> feedList();

	void updateL(int feed_seq);

	void downLike(int feed_seq);



}
