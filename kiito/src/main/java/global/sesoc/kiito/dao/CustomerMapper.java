package global.sesoc.kiito.dao;

import global.sesoc.kiito.vo.Customer;

public interface CustomerMapper {

	Customer getCustomer(int customer_seq);

	void insertC(Customer cus);

	Customer getGoogleCustomer(String email);

	Customer getFacebookCustomer(String email);

	Customer getCustomerByMail(String email);



}
