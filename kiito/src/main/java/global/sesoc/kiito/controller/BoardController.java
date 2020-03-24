package global.sesoc.kiito.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.kiito.dao.BoardDAO;

@Controller

public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired	
	private BoardDAO dao;
	
	final String uploadPath = "/boardfile";			//파일이 저장될 위치.
	
	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write() {return "board/write";}

}
