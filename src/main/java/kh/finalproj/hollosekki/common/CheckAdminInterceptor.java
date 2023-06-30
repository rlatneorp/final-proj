package kh.finalproj.hollosekki.common;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import kh.finalproj.hollosekki.enroll.model.vo.Users;

public class CheckAdminInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
//		*.ad 파일용 Interceptor
		HttpSession session = request.getSession();
		
		Users loginUser = (Users)session.getAttribute("loginUser");
		if(loginUser == null || loginUser.getIsAdmin().equals("N")){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>alert('접근권한이 없습니다. 관리자 로그인을 진행해주세요.');</script>");
			out.println("<script>location.href='login.en'</script>");
			
			return false;
		}else {
			return HandlerInterceptor.super.preHandle(request, response, handler);
		}
		
	}
}
