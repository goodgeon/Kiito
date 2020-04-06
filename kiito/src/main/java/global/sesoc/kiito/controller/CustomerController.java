package global.sesoc.kiito.controller;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import global.sesoc.kiito.dao.CustomerDAO;
import global.sesoc.kiito.dao.FeedDAO;
import global.sesoc.kiito.vo.Customer;
import global.sesoc.kiito.vo.Feed;

@Controller
@RequestMapping("customer")
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Autowired	
	private CustomerDAO dao;
	
	@Autowired	
	private FeedDAO dao1;
	
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Customer customer, HttpSession session) {
		String email = customer.getEmail();
		String pw = customer.getPw();
		
		System.out.println("email : " + email);
		System.out.println("pw : " + pw);
		
		Customer c = dao.getCustomerByMail(email);
		
		System.out.println("c.getPw() : " + c.getPw());

		if(c != null && c.getPw().equals(pw)) {
			session.setAttribute("customer", c);
			System.out.println("로그인정보 : " + c.toString());
			return "success";
		}
		
		return "fail";
	}
	
	
	
	
	@RequestMapping(value = "/agree", method = RequestMethod.GET)
	public String agree() {return "customer/agree";}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {return "customer/join";}
	
	@RequestMapping(value = "/email", method = RequestMethod.GET)
	public String email() {return "customer/email";}
	
	@ResponseBody
	@RequestMapping(value = "/findE", method = RequestMethod.POST)
	public String findE(String email) {
	    System.out.println(email);
		Customer cu = dao.getCustomerByMail(email);

		String a = "nai";
		String bb = "aru";
		
		if(cu!=null && cu.getEmail().equals(email)) {
			return bb;
		}
		else
		return a;
		
	}
	
	
	@ResponseBody			//회원가입
	@RequestMapping(value = "/insertC", method = RequestMethod.POST)
	public void insertC(Customer cus) {
		System.out.println(cus);
		cus.setNick(cus.getName());
		cus.setCustomer_type(0);
		cus.setProfileImg("");
		dao.insertC(cus);
	}

	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET) //로그아웃
	public String logout(HttpSession hh) {
		
		hh.removeAttribute("customer");

		return "redirect:/";		
	}
	
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(HttpSession hh,Model model) {
		
		
		///Feed feed = dao1.getFeed1(hh.getAttribute("customer"));
		
		
		
		
		return "customer/profile";}

}
	

