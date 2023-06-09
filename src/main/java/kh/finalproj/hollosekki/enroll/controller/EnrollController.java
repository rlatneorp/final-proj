package kh.finalproj.hollosekki.enroll.controller;

import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kh.finalproj.hollosekki.enroll.model.service.EnrollService;
import kh.finalproj.hollosekki.enroll.model.vo.Users;


@SessionAttributes("loginUser")
@Controller
public class EnrollController {
		

		@Autowired
		private BCryptPasswordEncoder bcrypt;
		
		@Autowired
		private EnrollService eService;

		@RequestMapping("join.en")
		public String join() {
			return "join";
		}
		
		@RequestMapping("insertUser.en")
		public String insertUser(@ModelAttribute Users u) {
			
			String userPwd = bcrypt.encode(u.getUsersPw());
			u.setUsersPw(userPwd);
			
			int result = eService.insertUser(u);
			if(result > 0) {
				return "redirect:login.en";
			} else {
				return "회원가입실패...페이지 만드나? 아님 exception?";
			}
		}
		
		@RequestMapping("login.en")
		public String login() {
			return "login";
		}
		

		@RequestMapping("loginCheck.en")
		public String loginCheck(@ModelAttribute Users u, Model model) {
			
			Users loginUser = eService.login(u);
			if(bcrypt.matches(u.getUsersPw(), loginUser.getUsersPw())) {
				model.addAttribute("loginUser", loginUser);
				return "redirect:home.do";
			} else {
				return "loginfalse";
			}
		}
		
		@RequestMapping("checkId.en")
		public void checkId(@RequestParam("id") String id, PrintWriter out) {
			
			int count = (int)eService.checkId(id);
			
			String result = count == 0 ? "yes" : "no";
			out.print(result);
		}
		
		@RequestMapping("checkNickName.en")
		public void checkNickName(@RequestParam("nickName") String nickName, PrintWriter out) {
			
			int count = (int)eService.checkNickName(nickName);
			String result = count == 0 ? "yes" : "no";
			out.print(result);
		}
		
		@RequestMapping("checkEmail.en")
		public void checkEmail(@RequestParam("email") String email, PrintWriter out) {
			
			int count = (int)eService.checkEmail(email);
			String result = count == 0 ? "yes" : "no";
			out.print(result);
		}
		
		@RequestMapping("logout.en")
		public String logout(SessionStatus status) {
			status.setComplete();
			return "redirect:home.do";
		}
		
		@RequestMapping("findId.en")
		public String findId(){
			
			return "findId";
		}
		
		@RequestMapping("findIdResult.en")
		public String findIdResult() {
			
			return "findIdResult";
		}
		
		@RequestMapping("findPwd.en")
		public String findPwd() {
			
			return "findPwd";
		}
		
		@RequestMapping("findPwdCheck.en")
		public String findPwdcheck() {
			
			return "findPwd2";
		}
		
		@RequestMapping("updatePwd.en")
		public String updatePwd() {
			
			return "updatePwd";
		}
		
		
}
