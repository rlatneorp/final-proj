package kh.finalproj.hollosekki.users;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import kh.finalproj.hollosekki.enroll.model.vo.Users;

public class CheckLoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws IOException {
        HttpSession session = request.getSession();
        Users loginUser = (Users) session.getAttribute("loginUser");
        
        if (loginUser == null) {
            String message = URLEncoder.encode("로그인 후 이용해주세요.", "UTF-8");
            response.sendRedirect("login.en?message=" + message);
            return false;
        } else {
            return true;
        }
    }
}
