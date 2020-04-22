package global.sesoc.kiito.controller;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import global.sesoc.kiito.util.FileService;
import global.sesoc.kiito.dao.CustomerDAO;
import global.sesoc.kiito.dao.FeedDAO;
import global.sesoc.kiito.dao.HashtagDAO;
import global.sesoc.kiito.dao.ImageFileDAO;
import global.sesoc.kiito.dao.PfileDAO;
import global.sesoc.kiito.vo.Customer;
import global.sesoc.kiito.vo.Feed;
import global.sesoc.kiito.vo.Follow;
import global.sesoc.kiito.vo.Hashtag;
import global.sesoc.kiito.vo.ImageFile;
import global.sesoc.kiito.vo.Pfile;

@Controller
@RequestMapping("customer")
public class CustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

	@Autowired	
	private CustomerDAO dao;
	
	@Autowired
	private HashtagDAO hashtagdao;
	@Autowired
	private ImageFileDAO imageFileDao;
	
	@Autowired	
	private FeedDAO dao1;
	
	@Autowired	
	private PfileDAO dao2;
	
	final String uploadPath = "/boardfile";	
	
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Customer customer, HttpSession session) {
		String email = customer.getEmail();
		String pw = customer.getPw();
		
		/*
		 * System.out.println("email : " + email); System.out.println("pw : " + pw);
		 */
		
		Customer c = dao.getCustomerByMail(email);
		
		//System.out.println("c.getPw() : " + c.getPw());

		if(c != null && c.getPw().equals(pw)) {
			session.setAttribute("customer", c);
			//System.out.println("로그인정보 : " + c.toString());
			//System.out.println(c.getFollow().size());
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
		cus.setProfileImg("resources/login/images/profileImg_null2.png");
		dao.insertC(cus);
	}

	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET) //로그아웃
	public String logout(HttpSession hh) {
		
		hh.removeAttribute("customer");

		return "redirect:/";		
	}
	
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(HttpSession hh,Model model) {
		
		ArrayList<Feed> ff = dao1.feedList();
		
		
		model.addAttribute("feed",ff);
		
		ArrayList<Hashtag> hashtagList = hashtagdao.getList();
		//System.out.println(hashtagList);
		model.addAttribute("hashtag",hashtagList);
		
		ArrayList<ImageFile> imageList = imageFileDao.getList();
		model.addAttribute("imageFile", imageList);
		
		
		return "customer/profile";}
	
	@RequestMapping(value = "/followers", method = RequestMethod.GET)
	public String follwers(HttpSession hh,Model model) {
		

		
		
		return "customer/followers";}
	
	
	@RequestMapping(value = "/changef", method = RequestMethod.POST)
	public String changef(Pfile p,HttpSession session,MultipartFile upload) {
		
		
		 Customer login_customer = (Customer) session.getAttribute("customer");
		 p.setCustomer_seq(login_customer.getCustomer_seq());
		 
		 
			if(!upload.isEmpty()) {
				String savedFile = FileService.saveFile(upload, uploadPath);
				System.out.println(savedFile);
				p.setOriginalFilename(upload.getOriginalFilename());
				p.setSavedFilename(savedFile);
		}
			
			dao2.insertp(p);
			String s = "C:\\boardfile\\";
			String ex = p.getSavedFilename();
			String sex = s+ex;
			login_customer.setProfileImg(sex);
			System.out.println(login_customer);
			
			dao.updateP(login_customer);			

			session.removeAttribute("customer");
			session.setAttribute("customer", login_customer);
	
		
		
		return "customer/profile";
	}
	
	@ResponseBody
	@RequestMapping(value = "/follow", method = RequestMethod.POST)
	public String follow(int follower_seq, int following_seq) {
		Follow follow = new Follow();
		follow.setCustomer_seq(follower_seq);
		follow.setFollowing_seq(following_seq);
		
		dao.insertFollow(follow);
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value = "/cancleFollow", method = RequestMethod.POST)
	public void cancleFollow(int customer_seq, int following_seq) {
		Follow follow = new Follow();
		follow.setCustomer_seq(customer_seq);
		follow.setFollowing_seq(following_seq);
		
		dao.deleteFollow(follow);
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkFollowing", method = RequestMethod.POST)
	public int checkFollowing(int customer_seq, int following_seq) {
		int result;
		Follow follow = new Follow();
		follow.setCustomer_seq(customer_seq);
		follow.setFollowing_seq(following_seq);
		
		result = dao.checkFollowing(follow);
		
		
		return result;
	}
	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat() {
		return "customer/chat";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getCustomer_seq", method = RequestMethod.GET)
	public int getCustomer_seq(HttpSession session) {
		Customer customer = (Customer) session.getAttribute("customer");
		return customer.getCustomer_seq();
	}

}
	

