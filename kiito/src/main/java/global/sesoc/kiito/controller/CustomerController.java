package global.sesoc.kiito.controller;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import global.sesoc.kiito.dao.CustomerDAO;

@Controller
@RequestMapping("customer")
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Autowired	
	private CustomerDAO dao;
	
	@RequestMapping(value = "/agree", method = RequestMethod.GET)
	public String agree() {return "customer/agree";}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {return "customer/join";}
	
	@RequestMapping(value = "/email", method = RequestMethod.GET)
	public String email() {return "customer/email";}
	

}
