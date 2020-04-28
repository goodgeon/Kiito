package global.sesoc.kiito.dao;

import java.util.ArrayList;
import java.util.HashMap;

import global.sesoc.kiito.vo.Chat;
import global.sesoc.kiito.vo.Customer;
import global.sesoc.kiito.vo.Follow;

public interface CustomerMapper {

	Customer getCustomer(int customer_seq);

	void insertC(Customer cus);

	Customer getGoogleCustomer(String email);

	Customer getFacebookCustomer(String email);

	Customer getCustomerByMail(String email);

	void insertFollow(Follow follow);

	void deleteFollow(Follow follow);

	Follow checkFollowing(Follow follow);

	void updateP(Customer login_customer);

	ArrayList<Customer> getFollowList(int customer_seq);

	void updateC(Customer c);

	void deru(int customer_seq);

	ArrayList<Chat> getChatList(int customer_seq);

	void insertChat(Chat chat);

	ArrayList<Integer> getFollowingList(int customer_seq);

	Integer getChat_seq(HashMap<String, Object> map);

	Customer getC1(String profileImg);


}
