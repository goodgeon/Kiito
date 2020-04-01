package global.sesoc.kiito.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import global.sesoc.kiito.dao.FeedDAO;
import global.sesoc.kiito.dao.HashtagDAO;
import global.sesoc.kiito.vo.Feed;
import global.sesoc.kiito.vo.Hashtag;
import global.sesoc.kiito.util.FileService;

@Controller
@RequestMapping("feed")
public class FeedController {
	
	private static final Logger logger = LoggerFactory.getLogger(FeedController.class);
	
	@Autowired	
	private FeedDAO dao;
	@Autowired	
	private HashtagDAO dao2;
	private int feed_seq;
	private int customer_seq;
	
	final String uploadPath = "/boardfile";			//파일이 저장될 위치.
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write() {return "board/write";}
	
	@RequestMapping(value = "/insertFeed", method = RequestMethod.POST)
	public String insertFeed(Feed feed,HttpSession session, MultipartFile upload, String[] arr) {
		
		
		if(!upload.isEmpty()) {
			String savedFile = FileService.saveFile(upload, uploadPath);
			feed.setOriginalfile(upload.getOriginalFilename());
			feed.setSavedfile(savedFile);
		}
		
		
		dao.insertFeed(feed);
		feed_seq = feed.getFeed_seq();

		customer_seq = feed.getCustomer_seq();
		
		hashtag(arr);

		return "redirect:/home";
	}
	
	@RequestMapping(value = "/hashtag", method = RequestMethod.POST)

	//@ResponseBody
	public void hashtag(String[] arr) {
		Hashtag hash = new Hashtag();

		hash.setFeed_seq(feed_seq);
		
		for(int i=0;i<arr.length;i++) {
			hash.setContents(arr[i]);
			System.out.println(hash.toString());
			dao2.insertH(hash);
		}
		
		//return "aa";
	}
	
	
	

}
