package global.sesoc.kiito;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.google.connect.GoogleOAuth2Template;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.kiito.dao.CustomerDAO;
import global.sesoc.kiito.dao.FeedDAO;
import global.sesoc.kiito.dao.HashtagDAO;
import global.sesoc.kiito.vo.Customer;
import global.sesoc.kiito.vo.Feed;
import global.sesoc.kiito.vo.Hashtag;


@Controller
public class HomeController {
	
	@Autowired	
	private FeedDAO dao;
	
	@Autowired	
	private CustomerDAO customerDao;
	
	@Autowired
	private HashtagDAO hashtagdao;
	
	
	@Autowired
    private GoogleOAuth2Template googleOAuth2Template;
    
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;
    
    @Autowired
    private FacebookConnectionFactory connectionFactory;
    @Autowired
    private OAuth2Parameters oAuth2Parameters;

	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String login(Model model) {
		String url = googleOAuth2Template.buildAuthenticateUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
        System.out.println("/googleLogin, url : " + url);
        model.addAttribute("google_url", url);
        
        OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
        String facebook_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
    
        model.addAttribute("facebook_url", facebook_url);
        System.out.println("/facebook" + facebook_url);
		
		return "customer/login";
	}
	
	@RequestMapping(value = "home", method = RequestMethod.GET)
	public String home(Model model) {
		
		ArrayList<Feed> ff = dao.feedList();
		
		for(int i=0; i<ff.size(); i++) {
			System.out.println(ff.get(i).getCustomer_seq());
			Customer customer = customerDao.getCustomer(ff.get(i).getCustomer_seq());
			ff.get(i).setNick(customer.getNick());
			ff.get(i).setProfileImg(customer.getProfileImg());
		}
		
		model.addAttribute("feed",ff);
		
		ArrayList<Hashtag> hashtagList = hashtagdao.getList();
		System.out.println(hashtagList);
		model.addAttribute("hashtag",hashtagList);
		
		return "home";
	}
	
}
