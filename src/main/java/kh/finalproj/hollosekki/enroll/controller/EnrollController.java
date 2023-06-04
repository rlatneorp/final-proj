package kh.finalproj.hollosekki.enroll.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EnrollController {

		@RequestMapping("join.en")
		public String join() {
			
			return "join";
		}
		
		@RequestMapping("login.en")
		public String login() {
			
			return "login";
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
