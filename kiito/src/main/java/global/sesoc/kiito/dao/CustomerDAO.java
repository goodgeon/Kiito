package global.sesoc.kiito.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.kiito.vo.Customer;

@Repository
public class CustomerDAO {
	
	@Autowired
	private SqlSession session;

	public Customer getCustomer(String email) {			//고객불러오기
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		Customer customer = mapper.getCustomer(email);
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

}
