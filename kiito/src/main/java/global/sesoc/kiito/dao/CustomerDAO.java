package global.sesoc.kiito.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.kiito.vo.Chat;
import global.sesoc.kiito.vo.Customer;
import global.sesoc.kiito.vo.Follow;

@Repository
public class CustomerDAO {
	
	@Autowired
	private SqlSession session;

	public Customer getCustomer(int customer_seq) {			//고객불러오기
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		Customer customer = mapper.getCustomer(customer_seq);
		return customer;
	}
	
	

	public void insertC(Customer cus) {			//고객회원가입
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		mapper.insertC(cus);
	
	}



	public Object getGoogleCustomer(String email) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		Customer customer = mapper.getGoogleCustomer(email);
		return customer;
	}



	public Object getFacebookCustomer(String email) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		Customer customer = mapper.getFacebookCustomer(email);
		return customer;
	}



	public Customer getCustomerByMail(String email) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		Customer customer = mapper.getCustomerByMail(email);
		return customer;
	}



	public void insertFollow(Follow follow) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		mapper.insertFollow(follow);
		
	}



	public void deleteFollow(Follow follow) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		mapper.deleteFollow(follow);
		
	}



	public int checkFollowing(Follow follow) {
		int result=-1;
		
		Follow f = null;
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		f = mapper.checkFollowing(follow);
		
		if(f == null)result = 1;
		else if(f != null) result = 0;
		
		return result;
	}



	public void updateP(Customer login_customer) {
		
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		mapper.updateP(login_customer);
		
	}

	public ArrayList<Customer> getFollowList(int customer_seq) {
		ArrayList<Customer> list = null;
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		
		list = mapper.getFollowList(customer_seq);
		
		return list;
	}



	/* 프로필 수정 */
	public void updateC(Customer c) {
		
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		mapper.updateC(c);
		
		
		
	}


	



	/* 탈퇴 */
	public void deru(int customer_seq) {
		
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		mapper.deru(customer_seq);
		
	}



	public ArrayList<Chat> getChatList(int customer_seq) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		ArrayList<Chat> list = null;
		
		list = mapper.getChatList(customer_seq);

		return list;
	}



	public void insertChat(Chat chat) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		mapper.insertChat(chat);
		
	}



	public ArrayList<Integer> getFollowingList(int customer_seq) {
		ArrayList<Integer> list = null;
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		
		list = mapper.getFollowingList(customer_seq);
		
		return list;
	}



	public Integer getChat_seq(int customer1_seq, int customer2_seq) {
		Integer chat_seq = null;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("customer1_seq", customer1_seq);
		map.put("customer2_seq", customer2_seq);
		
		
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		chat_seq = mapper.getChat_seq(map);
		
		
		return chat_seq;
	}

}
