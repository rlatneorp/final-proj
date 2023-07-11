package kh.finalproj.hollosekki.market.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import kh.finalproj.hollosekki.enroll.model.vo.Users;

public class CheckBasketInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		 String requestURI = request.getRequestURI();
		 HttpSession session = null;
		 
		 
		    if (requestURI.endsWith("/basket.ma")) {
		        session = request.getSession();
		        Users loginUser = ((Users)session.getAttribute("loginUser"));

		        if (loginUser == null) {
		            String loginPageUrl = request.getContextPath() + "/login.en"; // 로그인 페이지 URL로 변경
		            String alertMessage = "로그인 후에 이용해주세요."; // 알림 메시지
		            String redirectScript = "<script>alert('" + alertMessage + "'); window.location.href='" + loginPageUrl + "';</script>";
		            response.getWriter().write(redirectScript);
		            return false; // 핸들러 실행 중지
		        }
		    }

		    return true; // 핸들러 실행 계속
		
		
		
//		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
