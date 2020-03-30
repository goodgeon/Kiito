package global.sesoc.kiito.controller;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.social.MissingAuthorizationException;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.social.facebook.api.UserOperations;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.google.connect.GoogleOAuth2Template;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

import global.sesoc.kiito.dao.CustomerDAO;
import global.sesoc.kiito.socialLogin.AuthInfo;
import global.sesoc.kiito.vo.Customer;


@Controller
public class SocialLoginController {
	
	@Inject
    private AuthInfo authInfo;
    
    @Autowired
    private GoogleOAuth2Template googleOAuth2Template;
    
    @Autowired
    private OAuth2Parameters googleOAuth2Parameters;
    
    @Autowired
    private FacebookConnectionFactory connectionFactory;
    
    @Autowired
    private OAuth2Parameters oAuth2Parameters;
	
	private static final Logger logger = LoggerFactory.getLogger(SocialLoginController.class);
	
	@Autowired	
	private CustomerDAO dao;
	
	
	@RequestMapping(value = "/google/googleSignInCallback")
    public String doSessionAssignActionPage(HttpServletRequest request, HttpSession session) throws Exception {
 
        String code = request.getParameter("code");
        System.out.println(code);
        
        //RestTemplate을 사용하여 Access Token 및 profile을 요청한다.
        RestTemplate restTemplate = new RestTemplate();
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("code", code);
        parameters.add("client_id", authInfo.getClientId());
        parameters.add("client_secret", authInfo.getClientSecret());
        parameters.add("redirect_uri", googleOAuth2Parameters.getRedirectUri());
        parameters.add("grant_type", "authorization_code");
 
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String, String>>(parameters, headers);
        ResponseEntity<Map> responseEntity = restTemplate.exchange("https://www.googleapis.com/oauth2/v4/token", HttpMethod.POST, requestEntity, Map.class);
        Map<String, Object> responseMap = responseEntity.getBody();
 
        // id_token 라는 키에 사용자가 정보가 존재한다.
        // 받아온 결과는 JWT (Json Web Token) 형식으로 받아온다. 콤마 단위로 끊어서 첫 번째는 현 토큰에 대한 메타 정보, 두 번째는 우리가 필요한 내용이 존재한다.
        // 세번째 부분에는 위변조를 방지하기 위한 특정 알고리즘으로 암호화되어 사이닝에 사용한다.
        //Base 64로 인코딩 되어 있으므로 디코딩한다.
 
        String[] tokens = ((String)responseMap.get("id_token")).split("\\.");
        Base64 base64 = new Base64(true);
        String body = new String(base64.decode(tokens[1]));
        
        System.out.println(tokens.length);
        System.out.println(new String(Base64.decodeBase64(tokens[0]), "utf-8"));
        System.out.println(new String(Base64.decodeBase64(tokens[1]), "utf-8"));
 
        //Jackson을 사용한 JSON을 자바 Map 형식으로 변환
        ObjectMapper mapper = new ObjectMapper();
        Map<String, String> result = mapper.readValue(body, Map.class);
        System.out.println("======================================");
        System.out.println(result.get("email"));
        System.out.println(result.get("sub"));
        System.out.println(result.get("name"));
        System.out.println(result);
        
        
        //result.get("email")이 DB에 있으면 세션에 저장하고 홈화면
        Customer customer = new Customer();
        customer.setEmail(result.get("email"));
        customer.setPw("aweoigjiowaegioawegjoiawejgioawejiogawejiogawejiogaweijog");
        customer.setName(result.get("name"));
        customer.setProfileImg(result.get("picture"));
        customer.setCustomer_type(1);
        
        Customer login_customer = new Customer();

        if(dao.getGoogleCustomer(customer.getEmail()) != null) {
        	login_customer = (Customer) dao.getGoogleCustomer(customer.getEmail());
        	session.setAttribute("customer", login_customer);
        	return "redirect:/home";
        }
        
        //없으면 DB에 insert하고 세션에 저장하고 홈화면
        System.out.println("가입 : " + customer.toString());
        dao.insertC(customer);
        login_customer = (Customer) dao.getGoogleCustomer(customer.getEmail());
        session.setAttribute("customer", login_customer);
        
        return "redirect:/home";
    }
	
	@RequestMapping(value = "/facebook/facebookSignInCallback", method = { RequestMethod.GET, RequestMethod.POST })
    public String facebookSignInCallback(@RequestParam String code,HttpSession session) throws Exception {
 
        try {
             String redirectUri = oAuth2Parameters.getRedirectUri();
            System.out.println("Redirect URI : " + redirectUri);
            System.out.println("Code : " + code);
 
            OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
            AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, redirectUri, null);
            String accessToken = accessGrant.getAccessToken();
            System.out.println("AccessToken: " + accessToken);
            Long expireTime = accessGrant.getExpireTime();
        
            
            if (expireTime != null && expireTime < System.currentTimeMillis()) {
                accessToken = accessGrant.getRefreshToken();
                logger.info("accessToken is expired. refresh token = {}", accessToken);
            };
            
        
            Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
            Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
            UserOperations userOperations = facebook.userOperations();
            
            try
 
            {            
                String [] fields = { "id", "email","name"};
                User userProfile = facebook.fetchObject("me", User.class, fields);
                System.out.println("유저 프로필사진 : " +"http://graph.facebook.com/"+userProfile.getId()+"/picture?type=large");
                System.out.println("유저이메일 : " + userProfile.getEmail());
                System.out.println("유저 id : " + userProfile.getId());
                System.out.println("유저 name : " + userProfile.getName());
                
                Customer customer = new Customer();
                customer.setEmail(userProfile.getEmail());
                customer.setPw("aweoigjiowaegioawegjoiawejgioawejiogawejiogawejiogaweijog");
                customer.setName(userProfile.getName());
                customer.setProfileImg("http://graph.facebook.com/"+userProfile.getId()+"/picture?type=large");
                customer.setCustomer_type(2);
                
                if(dao.getFacebookCustomer(customer.getEmail()) != null) {
                	session.setAttribute("customer", customer);
                	return "redirect:/home";
                }
                
                dao.insertC(customer);
                session.setAttribute("customer", customer);
                
            } catch (MissingAuthorizationException e) {
                e.printStackTrace();
            }
 
        
        } catch (Exception e) {
 
            e.printStackTrace();
 
        }
        return "redirect:/home";
 
    }

}
