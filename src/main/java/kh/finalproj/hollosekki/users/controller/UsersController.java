package kh.finalproj.hollosekki.users.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kh.finalproj.hollosekki.enroll.model.service.EnrollService;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.users.model.service.UsersService;

@SessionAttributes("loginUser")
@Controller
public class UsersController {
	
	@Autowired
	private EnrollService eService;
	
//	@Autowired
//	private UsersService uService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@RequestMapping("myPage_Main.me")
	public String myPage_Main(Model model, Users u) {
		Users loginUser = eService.login(u);
		model.addAttribute("loginUser", loginUser);
		return "myPage_Main";
	}
	
	@RequestMapping("myPage_Profile.me")
	public String myPage_Profile() {
		return "myPage_Profile";
	}
	
	@RequestMapping("myPage_Intro.me")
	public String myPage_Intro() {
		return "myPage_Intro";
	}
	
	@RequestMapping("myPage_MyRecipe.me")
	public String myPage_MyRecipe() {
		return "myPage_MyRecipe";
	}
	
	@RequestMapping("myPage_MyBookMark.me")
	public String myPage_MyBookMark() {
		return "myPage_MyBookMark";
	}
	
	@RequestMapping("myPage_MyFavorite.me")
	public String myPage_MyFavorite() {
		return "myPage_MyFavorite";
	}
	
	@RequestMapping("myPage_MyOrder.me")
	public String myPage_MyOrder() {
		return "myPage_MyOrder";
	}
	
	@RequestMapping("myPage_MyOrderDetail.me")
	public String myPage_MyOrderDetail() {
		return "myPage_MyOrderDetail";
	}
	
	@RequestMapping("myPage_MyAddress.me")
	public String myPage_MyAddress() {
		return "myPage_MyAddress";
	}
	
	@RequestMapping("myPage_InsertAddress.me")
	public String myPage_InsertAddress() {
		return "myPage_InsertAddress";
	}
	
	@RequestMapping("myPage_UpdateAddress.me")
	public String myPage_UpdateAddress() {
		return "myPage_UpdateAddress";
	}
	
	@RequestMapping("myPage_Point.me")
	public String myPage_Point() {
		return "myPage_Point";
	}
	
	@RequestMapping("myPage_UpdateInfo.me")
	public String myPage_UpdateInfo() {
		return "myPage_checkPwd";
	}
	
	// 회원정보 수정 전 비밀번호 확인
	@RequestMapping("myPage_checkPwd.me")
	@ResponseBody
	public String myPage_checkPwd(@RequestParam("usersPwd") String usersPwd, Model model) {
		System.out.println(usersPwd);
		String pwd = ((Users)model.getAttribute("loginUser")).getUsersPw();
		
		if(bcrypt.matches(usersPwd, pwd)) {
			return "yes";
		} else {
			return "no";
		}
	}
	
	@RequestMapping("myPage_editInfo.me")
	public String myPage_editInfo() {
		return "myPage_editInfo";
	}
}
