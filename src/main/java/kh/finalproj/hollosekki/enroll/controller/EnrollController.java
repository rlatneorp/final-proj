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
}
