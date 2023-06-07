package kh.finalproj.hollosekki.enroll.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
				
				System.out.println(userPwd);
				
				return "redirect:login.en";
			} else {
				return "�쉶�썝媛��엯�떎�뙣...�럹�씠吏� 留뚮뱶�굹? �븘�떂 exception?";
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
