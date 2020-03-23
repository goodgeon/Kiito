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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import global.sesoc.kiito.dao.CustomerDAO;

@Controller
@RequestMapping("customer")
public class EmailController {
	
	private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	
	@Autowired	
	private CustomerDAO dao;
	
	

	@Inject    //서비스를 호출하기 위해서 의존성을 주입
    JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
    // memberservice; //서비스를 호출하기 위해 의존성을 주입
    
    // mailSending 코드
	@ResponseBody
    @RequestMapping( value = "/auth.do" , method=RequestMethod.POST )
    public int mailSending(HttpServletRequest request, String e_mail, HttpServletResponse response_email,Model m) throws IOException {

        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "kyamidung@gamil.com";
        String tomail = request.getParameter("e_mail"); // 받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다."; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 인증번호는 " +dice+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
        
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message,
                    true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
      //  ModelAndView mv = new ModelAndView();    //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을 지정한다.
      //  mv.setViewName("customer/join");     //뷰의이름
      //  mv.addObject("dice", dice);
        m.addAttribute("dice", dice);
        
       //System.out.println("mv : "+mv);
        System.out.println("dice : "+dice);

        response_email.setContentType("text/html; charset=UTF-8");
//        PrintWriter out_email = response_email.getWriter();
//        out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
//        out_email.flush();
        
        
        return dice;
        
    }

//이메일 인증 페이지 맵핑 메소드
@RequestMapping("/customer/email.do")
public String email() {
    return "customer/email";
}


//이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
//내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
//틀리면 다시 원래 페이지로 돌아오는 메소드
@ResponseBody
@RequestMapping(value = "/join_injeung.do", method = RequestMethod.POST)
public String join_injeung(String email_injeung,String dice, HttpServletResponse response_equals) throws IOException {

    
    String a ="good"; String b = "bad";
    System.out.println("마지막 : email_injeung : "+email_injeung);
    System.out.println("마지막 : dice : "+dice);
    
   
    if (email_injeung.equals(dice)) { 
        System.out.println("일치 합니다.");
        return a;
    }else if (email_injeung != dice) {
        System.out.println("일치 하지 않습니다.");
        return b;
    }    
    return a;
}
}