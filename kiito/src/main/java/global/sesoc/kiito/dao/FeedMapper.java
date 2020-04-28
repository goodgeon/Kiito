package global.sesoc.kiito.dao;

import java.util.ArrayList;

import global.sesoc.kiito.vo.Customer;
import global.sesoc.kiito.vo.Feed;
import global.sesoc.kiito.vo.Hashtag;

public interface FeedMapper {

	int insertFeed(Feed feed);

	ArrayList<Feed> feedList();

	void updateL(int feed_seq);

	void downLike(int feed_seq);

	Feed getFeed(int feed_seq);

	int countF(int customer_seq);

	ArrayList<Feed> feedList1(int customer_seq);

	ArrayList<Feed> search(String search);

	ArrayList<Customer> getEntryList();

	ArrayList<Feed> followFeedList(int customer_seq);





}
