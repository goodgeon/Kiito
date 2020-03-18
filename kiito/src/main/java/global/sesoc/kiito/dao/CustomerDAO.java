package global.sesoc.kiito.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.kiito.vo.Customer;

@Repository
public class CustomerDAO {
	
	@Autowired
	private SqlSession session;

	public Customer getCustomer(String email) {
		CustomerMapper mapper = session.getMapper(CustomerMapper.class);
		
		Customer customer = mapper.getCustomer(email);
		
		
		return customer;
	}

}
