package global.sesoc.kiito.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import global.sesoc.kiito.dao.FeedDAO;
import global.sesoc.kiito.dao.HashtagDAO;
import global.sesoc.kiito.dao.ImageFileDAO;
import global.sesoc.kiito.dao.LikesDAO;
import global.sesoc.kiito.dao.VideoFileDAO;
import global.sesoc.kiito.vo.Feed;
import global.sesoc.kiito.vo.Hashtag;
import global.sesoc.kiito.vo.ImageFile;
import global.sesoc.kiito.vo.Likes;
import global.sesoc.kiito.vo.VideoFile;
import global.sesoc.kiito.util.FileService;
import global.sesoc.kiito.util.SmsService;

@Controller
@RequestMapping("feed")
public class FeedController {

	private static final Logger logger = LoggerFactory.getLogger(FeedController.class);

	@Autowired
	private FeedDAO dao;
	@Autowired
	private HashtagDAO dao2;
	@Autowired
	private ImageFileDAO imgDao;
	@Autowired
	private VideoFileDAO videoDao;

	@Autowired
	private LikesDAO dao3;
	private int feed_seq;
	private int customer_seq;

	final String uploadPath = "/boardfile"; // 파일이 저장될 위치.

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String write() {
		return "board/write";
	}

	@RequestMapping(value = "/insertFeed", method = RequestMethod.POST)
	public String insertFeed(Feed feed, HttpSession session, MultipartHttpServletRequest mtfRequest, String[] arr) {

		/*
		 * if(!upload.isEmpty()) { String savedFile = FileService.saveFile(mf,
		 * uploadPath); feed.setOriginalfile(mf.getOriginalFilename());
		 * feed.setSavedfile(savedFile); }
		 */

		dao.insertFeed(feed);
		feed_seq = feed.getFeed_seq();

		customer_seq = feed.getCustomer_seq();

		if (arr != null) {
			hashtag(arr);
		}
		
		List<MultipartFile> imgfileList = mtfRequest.getFiles("imagefile");
		List<MultipartFile> videofileList = mtfRequest.getFiles("videofile");
		
		
		

		System.out.println("이미지파일리스트크기 : " + imgfileList.size());
		System.out.println("비디오파일리스트크기 : " + videofileList.size());
		String src = mtfRequest.getParameter("src");
		System.out.println("src value : " + src);

		String path = uploadPath;

		if (imgfileList != null && imgfileList.size() > 0 && imgfileList.get(0).getOriginalFilename() != "")  {
			System.out.println(imgfileList.get(0).getOriginalFilename());
			
			int index;
			String filetype;
			
			for (MultipartFile mf : imgfileList) {
				// String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				// long fileSize = mf.getSize(); // 파일 사이즈
				index = mf.getOriginalFilename().lastIndexOf('.');
				filetype = mf.getOriginalFilename().substring(index+1);
				
				if(!filetype.toLowerCase().equals("jpg") &&!filetype.toLowerCase().equals("jpeg") && !filetype.toLowerCase().equals("png") && !filetype.toLowerCase().equals("gif")) {
					System.out.println("이미지아님");
					continue;
				}

				ImageFile imageFile = new ImageFile();
				String savedFile = FileService.saveFile(mf, uploadPath);
				
				System.out.println("feed_seq : " + feed_seq);

				imageFile.setFeed_seq(feed_seq);
				imageFile.setOriginalFilename(mf.getOriginalFilename());
				imageFile.setSavedFilename(savedFile);

				imgDao.insertImage(imageFile);

				// feed.setOriginalfile(mf.getOriginalFilename());
				// feed.setSavedfile(savedFile);
			}
		}
		
		if (videofileList != null && videofileList.size() > 0 && videofileList.get(0).getOriginalFilename() != "")  {
			System.out.println(videofileList.get(0).getOriginalFilename());
			
			int index;
			String filetype;
			
			for (MultipartFile mf : videofileList) {
				// String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				// long fileSize = mf.getSize(); // 파일 사이즈
				index = mf.getOriginalFilename().lastIndexOf('.');
				filetype = mf.getOriginalFilename().substring(index+1);
				
				if(!filetype.toLowerCase().equals("mp4") && !filetype.toLowerCase().equals("mkv") && !filetype.toLowerCase().equals("mpg") && !filetype.toLowerCase().equals("mov") && !filetype.toLowerCase().equals("flv")) {
					System.out.println("동영상아님");
					continue;
				}

				VideoFile videoFile = new VideoFile();
				String savedFile = FileService.saveFile(mf, uploadPath);
				
				System.out.println("feed_seq : " + feed_seq);

				videoFile.setFeed_seq(feed_seq);
				videoFile.setOriginalFilename(mf.getOriginalFilename());
				videoFile.setSavedFilename(savedFile);

				videoDao.insertVideo(videoFile);

				// feed.setOriginalfile(mf.getOriginalFilename());
				// feed.setSavedfile(savedFile);
			}
		}

		

		return "redirect:/home";
	}

	@RequestMapping(value = "/hashtag", method = RequestMethod.POST)

	// @ResponseBody
	public void hashtag(String[] arr) {
		Hashtag hash = new Hashtag();

		hash.setFeed_seq(feed_seq);

		for (int i = 0; i < arr.length; i++) {
			hash.setContents(arr[i]);
			// System.out.println(hash.toString());
			dao2.insertH(hash);
		}

		// return "aa";
	}

	@ResponseBody
	@RequestMapping(value = "/likes", method = RequestMethod.POST)
	public int likes(int feed_seq, int customer_seq, Model model) {

		Likes likes = dao3.getLikes(feed_seq, customer_seq);
		Feed feed = null;

		if (likes != null) {
			System.out.println("감소됬나");
			dao3.deleteL(feed_seq, customer_seq);
			dao.downLike(feed_seq);
			feed = dao.getFeed(feed_seq);
			model.addAttribute("likes", feed.getLikes());
			return feed.getLikes();
		} else {
			System.out.println("좋아ㅇ");
			dao3.insertL(feed_seq, customer_seq);
			dao.updateL(feed_seq);
			feed = dao.getFeed(feed_seq);
			System.out.println("feed getlikes " + feed.getLikes());
			model.addAttribute("likes", feed.getLikes());

			return feed.getLikes();
		}

	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value = "/uploadImgFile", method = RequestMethod.POST) public
	 * void uploadImgFile(MultipartHttpServletRequest mtfRequest) {
	 * List<MultipartFile> fileList = mtfRequest.getFiles("files");
	 * 
	 * 
	 * 
	 * System.out.println("파일리스트크기 : " + fileList.size()); String src =
	 * mtfRequest.getParameter("src"); System.out.println("src value : " + src);
	 * 
	 * String path = uploadPath;
	 * 
	 * if (fileList != null && fileList.size() > 0 &&
	 * fileList.get(0).getOriginalFilename() != "") {
	 * System.out.println(fileList.get(0).getOriginalFilename());
	 * 
	 * int index; String filetype;
	 * 
	 * for (MultipartFile mf : fileList) { // String originFileName =
	 * mf.getOriginalFilename(); // 원본 파일 명 // long fileSize = mf.getSize(); // 파일
	 * 사이즈 index = mf.getOriginalFilename().lastIndexOf('.'); filetype =
	 * mf.getOriginalFilename().substring(index+1);
	 * 
	 * if(!filetype.equals("jpg") &&!filetype.equals("jpeg") &&
	 * !filetype.equals("png") && !filetype.equals("gif")) {
	 * System.out.println("이미지"); continue; }
	 * 
	 * ImageFile imageFile = new ImageFile(); String savedFile =
	 * FileService.saveFile(mf, uploadPath);
	 * 
	 * System.out.println("feed_seq : " + feed_seq);
	 * 
	 * imageFile.setFeed_seq(feed_seq);
	 * imageFile.setOriginalFilename(mf.getOriginalFilename());
	 * imageFile.setSavedFilename(savedFile);
	 * 
	 * imgDao.insertImage(imageFile);
	 * 
	 * // feed.setOriginalfile(mf.getOriginalFilename()); //
	 * feed.setSavedfile(savedFile); } } }
	 */
	
	@RequestMapping(value = "explore", method = RequestMethod.GET)
	public String explore() {
		return "board/explore";
	}
	
	@ResponseBody
	@RequestMapping(value = "sendSms", method = RequestMethod.POST)
	public String sendSms(String phoneNumber, String checkin, int congestion, String contents) {
		SmsService smsService = new SmsService();
		smsService.sendSMS(phoneNumber, checkin, congestion, contents);
		
		return phoneNumber;
	}

}
