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
import org.springframework.web.bind.annotation.RequestBody;
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
import global.sesoc.kiito.vo.Chat;
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
		cus.setProfileImg("profileImg_null2.png");
		dao.insertC(cus);
	}

	
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET) //로그아웃
	public String logout(HttpSession hh) {
		
		hh.removeAttribute("customer");

		return "redirect:/";		
	}
	
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(HttpSession session,Model model,String profileImg) {
		
		System.out.println("프로필 이미지   : " + profileImg);
		
		Customer ccc = dao.getC1(profileImg);
		ccc.setFollow(dao.getFollowList(ccc.getCustomer_seq()));
		ccc.setFollower(dao.getFollowerList(ccc.getCustomer_seq()));
		model.addAttribute("ccc",ccc);
		
		// Customer login_customer = (Customer) session.getAttribute("customer");
		 int customer_seq = ccc.getCustomer_seq();
		 System.out.println("커스터머 시퀀스   : " + customer_seq);
		 ArrayList<Feed> ff1 = dao1.feedList1(customer_seq);
		 
		
		model.addAttribute("feed",ff1);
		
		ArrayList<Hashtag> hashtagList = hashtagdao.getList();
		//System.out.println(hashtagList);
		model.addAttribute("hashtag",hashtagList);
		
		ArrayList<ImageFile> imageList = imageFileDao.getList();
		model.addAttribute("imageFile", imageList);
		
		int cf = dao1.countF(customer_seq);
		model.addAttribute("countf",cf);
		
		ArrayList<ImageFile> bestP = imageFileDao.getBp();
		model.addAttribute("bestp",bestP);
		
		return "customer/profile";}
	
	@RequestMapping(value = "/followers", method = RequestMethod.GET)
	public String follwers(HttpSession session,Model model, int type) {
		Customer customer = (Customer) session.getAttribute("customer");
		ArrayList<Customer> followingList = null;
		ArrayList<Customer> followerList = null;
		
		customer.setFollow(dao.getFollowList(customer.getCustomer_seq()));
		customer.setFollower(dao.getFollowerList(customer.getCustomer_seq()));
		
			if(type == 1) {
				followerList = customer.getFollower();
				model.addAttribute("followerList", followerList);
			}else if(type == 2) {
				followingList = customer.getFollow();
				
				model.addAttribute("followingList", followingList);
			}
			return "customer/followers";
		
		}
	
	/* 사진수정 */
	@ResponseBody
	@RequestMapping(value = "/changef", method = RequestMethod.POST)
	public String changef(HttpSession session,MultipartFile upload) {
		
		 
		 Pfile p = new Pfile();
		 Customer login_customer = (Customer) session.getAttribute("customer");
		 p.setCustomer_seq(login_customer.getCustomer_seq());
		 
		 
			if(!upload.isEmpty()) {
				String savedFile = FileService.saveFile(upload, uploadPath);
				System.out.println(savedFile);
				p.setOriginalFilename(upload.getOriginalFilename());
				p.setSavedFilename(savedFile);
		}
			
			dao2.insertp(p);
			//String s = "C:\\boardfile\\";
			String ex = p.getSavedFilename();
			//String sex = s+ex;
			login_customer.setProfileImg(ex);
			System.out.println(login_customer);
			
			dao.updateP(login_customer);			

			session.removeAttribute("customer");
			session.setAttribute("customer", login_customer);
	
		String a = login_customer.getProfileImg();
		
		return a;
	}
	
	/* 프로필수정 */
	@ResponseBody
	@RequestMapping(value = "/editP", method = RequestMethod.POST)
	public String editP(String nick,String pw,HttpSession session) {
		
		
		 Customer login_customer = (Customer) session.getAttribute("customer");
		 Customer c = new Customer();
		 c.setNick(nick);  c.setPw(pw); c.setCustomer_seq(login_customer.getCustomer_seq());
		 c.setEmail(login_customer.getEmail()); c.setName(login_customer.getName()); c.setProfileImg(login_customer.getProfileImg());
		 
		 dao.updateC(c);
		 	session.removeAttribute("customer");
			session.setAttribute("customer", c);
	
		 String a ="ok";
		// p.setCustomer_seq(login_customer.getCustomer_seq());

		
		return a;
	}
	
	/* 탈퇴 */
	@ResponseBody
	@RequestMapping(value = "/deru", method = RequestMethod.POST)
	public String deru(String pw,HttpSession session) {
		
		 Customer login_customer = (Customer) session.getAttribute("customer");
		 int customer_seq = login_customer.getCustomer_seq();
		 String o = "ok"; String n="no";
		 
		 if(login_customer.getPw().equals(pw)) {
			 dao.deru(customer_seq);
			 session.removeAttribute("customer");
			 return o;}
		 else
			 return n;
		 
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
	

	@ResponseBody
	@RequestMapping(value = "/getFollowList", method = RequestMethod.GET)
	public ArrayList<Customer> getFollowList(HttpSession session) {
		ArrayList<Customer> list = null;
		
		Customer customer = (Customer) session.getAttribute("customer");
		int customer_seq = customer.getCustomer_seq();
		
		list = dao.getFollowList(customer_seq);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getFollowingList", method = RequestMethod.GET)
	public ArrayList<Integer> getFollowingList(HttpSession session) {
		ArrayList<Integer> list = null;
		
		Customer customer = (Customer) session.getAttribute("customer");
		int customer_seq = customer.getCustomer_seq();
		
		list = dao.getFollowingList(customer_seq);
		System.out.println(list);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getChatList", method = RequestMethod.GET)
	public ArrayList<Chat> getChatList(int customer_seq, HttpSession session){
		ArrayList<Chat> list = null;
		list = dao.getChatList(customer_seq);
		
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertChat", method = RequestMethod.POST)
	public void insertChat(int customer1_seq, int customer2_seq) {
		Chat chat = new Chat();
		chat.setCustomer1_seq(customer1_seq);
		chat.setCustomer2_seq(customer2_seq);
		
		dao.insertChat(chat);
	}
	
	@ResponseBody
	@RequestMapping(value = "/getCustomer", method = RequestMethod.GET)
	public Customer getCustomer(int customer_seq) {
		Customer customer = new Customer();
		customer = dao.getCustomer(customer_seq);
		
		return customer;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getFollowingCustomer", method = RequestMethod.GET)
	public Customer getFollowingCustomer(int customer_seq){
		Customer customer = dao.getCustomer(customer_seq);
		
		return customer;
	}
	
	@ResponseBody
	@RequestMapping(value = "getChat_seq", method = RequestMethod.GET)
	public Integer getChat_seq(int customer1_seq, int customer2_seq){
		Integer chat_seq;
		chat_seq = dao.getChat_seq(customer1_seq, customer2_seq);
		
		return chat_seq;
	}
	
}
	

