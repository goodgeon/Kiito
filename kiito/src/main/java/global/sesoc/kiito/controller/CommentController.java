package global.sesoc.kiito.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.kiito.dao.CommentsDAO;
import global.sesoc.kiito.vo.Comments;

@Controller
@RequestMapping("comment")
public class CommentController {
	
	@Autowired
	CommentsDAO dao;
	
	@ResponseBody
	@RequestMapping(value = "/insertComment", method = RequestMethod.POST)
	public void insertComment(int feed_seq, int customer_seq, String text) {
		System.out.println("feed_seq : " + feed_seq);
		System.out.println("customer_seq : " + customer_seq);
		Comments comments = new Comments();
		comments.setFeed_seq(feed_seq);
		comments.setCustomer_seq(customer_seq);
		comments.setText(text);
		
		dao.insertComment(comments);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/getCommentList", method = RequestMethod.GET)
	public ArrayList<Comments> getCommentList(int feed_seq){
		ArrayList<Comments> list = null;
		
		list = dao.getCommentList(feed_seq);
		
		return list;
	}
	

}
