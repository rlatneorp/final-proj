package kh.finalproj.hollosekki.market.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import kh.finalproj.hollosekki.enroll.model.vo.Users;

public class CheckBasketInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Users loginUser = (Users)session.getAttribute("loginUser");
		if(loginUser == null){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
            out.println("setTimeout(function() {");
            out.println("    alert('로그인 후 이용해주세요.');");
            out.println("    location.href='login.en';");
            out.println("}, 1000);");
            out.println("</script>");
			
			return false;
		}else {
			return HandlerInterceptor.super.preHandle(request, response, handler);
		}
		
	}
}