package global.sesoc.kiito.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.kiito.dao.FeedDAO;
import global.sesoc.kiito.dao.HashtagDAO;
import global.sesoc.kiito.vo.Feed;

@Controller
@RequestMapping("feed")
public class FeedController {
	
	private static final Logger logger = LoggerFactory.getLogger(FeedController.class);
	
	@Autowired	
	private FeedDAO dao;
	private HashtagDAO dao2;
	private int feed_seq;
	
	final String uploadPath = "/boardfile";			//파일이 저장될 위치.
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write() {return "board/write";}
	
	@RequestMapping(value = "/insertFeed", method = RequestMethod.POST)
	public String insertFeed(Feed feed) {
		dao.insertFeed(feed);
		feed_seq = feed.getFeed_seq();
		return "redirect:/home";
	}
	
	@RequestMapping(value = "/hashtag", method = RequestMethod.POST)
	@ResponseBody
	public String hashtag(String[] arr) {
		System.out.println("글번호 : " + feed_seq);
		/*
		 * String aa ="suc"; for(int i=0; i<arr.length; i++) { dao2.insertH(arr[i]);
		 * }
		 */
		
		return "aa";
	}

}
