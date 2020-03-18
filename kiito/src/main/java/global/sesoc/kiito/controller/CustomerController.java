package global.sesoc.kiito.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.kiito.dao.CustomerDAO;
import global.sesoc.kiito.vo.Customer;

@Controller
@RequestMapping("customer")
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Autowired	
	private CustomerDAO dao;
	
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Customer customer, HttpSession session) {
		String email = customer.getEmail();
		String pw = customer.getPw();

		Customer c = dao.getCustomer(email);

		if(c != null) {
			System.out.println("db : " + c.getPw());
			System.out.println("customer : " + pw);
		}
		
		if(c != null && c.getPw().equals(pw)) {
			session.setAttribute("customer", customer);
			return "success";
		}
		
		return "fail";
	}
	
	
}
