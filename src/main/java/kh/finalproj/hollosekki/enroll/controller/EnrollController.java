package kh.finalproj.hollosekki.enroll.controller;

import java.io.PrintWriter;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		@Autowired
		private JavaMailSender mailSender;

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
		
//		@RequestMapping("insertUser.en")
//		@ResponseBody
//		public void insertUser(@ModelAttribute Users u, PrintWriter out) {
//			
//			String userPwd = bcrypt.encode(u.getUsersPw());
//			u.setUsersPw(userPwd);
//			
//			System.out.println(u);
//			
//			int count = eService.insertUser(u);
//			String result = count > 0 ? "yse" : "no";
//			System.out.println("result : "+ result);
//			
//			out.print(result);
//		}
		
		@RequestMapping("login.en")
		public String login() {
			return "login";
		}
		
		@RequestMapping("loginCheck.en")
		public String loginCheck(@ModelAttribute Users u, Model model) {
			
			Users loginUser = eService.login(u);
//			System.out.println(loginUser);
			
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
		public String findIdResult(@RequestParam("name") String name, @RequestParam("email") String email, Model model) {
			
			Users result = eService.findIdResult(name, email);
			
//			if(result != null) {
//				String usersId = result.getUsersId();
				
				model.addAttribute("usersInfo", result);
				
				return "findIdResult";
//			} else {
//				return "findIdResultFalse";
//			}
		}
		
		@RequestMapping("findPwd.en")
		public String findPwd() {
			return "findPwd";
		}
		
		@ResponseBody
		@RequestMapping("findPwdCheck.en")
		public String findPwdcheck(@RequestParam("id") String id, @RequestParam("email") String email, Model model) {
			
			int result = eService.findPwdCheck(id, email);
			
			if(result > 0) { // 아이디랑 메일주소 일치할때만 메일 발송
				model.addAttribute("id", id);
				Random random = new Random();
				int checkNum = random.nextInt(888888) + 111111;
				
				String setFrom = "hollosekki@gmail.com";
				String toMail = email;
				String title = "본인인증 이메일 입니다.";
		        String content = 
		                "홀로세끼를 방문해주셔서 감사합니다." +
		                "<br><br>" + 
		                "인증 번호는 " + checkNum + " 입니다." + 
		                "<br>" + 
		                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		       
		        try {
		        	MimeMessage message = mailSender.createMimeMessage();
					MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
					helper.setFrom(setFrom);
		            helper.setTo(toMail);
		            helper.setSubject(title);
		            helper.setText(content,true);
		            mailSender.send(message);
				} catch (MessagingException e) {
					e.printStackTrace();
				}
		        
		        return Integer.toString(checkNum);
			} else {
				return "0";
			}
			
		}
		
		@RequestMapping("updatePwd.en")
		public String updatePwd(@RequestParam("id") String id, Model model) {
			model.addAttribute("id", id);
			
			return "updatePwd";
		}
		
		@RequestMapping("updatePwdResult.en")
		public String updatePwdResult(@RequestParam("id") String id, @RequestParam("pwd") String pwd) {
			
			String usersPwd = bcrypt.encode(pwd);
//			System.out.println(id);
//			System.out.println(pwd);
//			System.out.println(usersPwd);
			
			int result = eService.updatePwdResult(id, usersPwd);
			
			if(result > 0) {
				return "updatePwdFinish";
			} else {
				return "";
			}
			
		}
		
		
}
