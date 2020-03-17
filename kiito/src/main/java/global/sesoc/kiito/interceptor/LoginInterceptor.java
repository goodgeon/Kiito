package global.sesoc.kiito.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	/*
	 * @Override public boolean preHandle(HttpServletRequest request,
	 * HttpServletResponse response, Object handler) throws Exception {
	 * 
	 * logger.debug("LoginInterceptor 실행");
	 * 
	 * // 세션의 로그인 정보 읽기 HttpSession session = request.getSession(); String logId =
	 * (String) session.getAttribute("logId");
	 * 
	 * // 로그인되지 않은 경우 로그인 페이지로 이동 if (logId == null) { // request.getContextPath()로
	 * 루트 경로를 구하여 절대 경로로 처리 response.sendRedirect(request.getContextPath() + "/");
	 * return false; } // 로그인 된 경우 요청한 경로로 진행 return super.preHandle(request,
	 * response, handler); }
	 */
}
