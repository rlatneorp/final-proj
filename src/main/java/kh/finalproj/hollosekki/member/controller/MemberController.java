package kh.finalproj.hollosekki.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@RequestMapping("myPage_Main.me")
	public String myPage_Main() {
		return "myPage_Main";
	}
	
	@RequestMapping("myPage_Profile.me")
	public String myPage_Profile() {
		return "myPage_profile";
	}
	
	@RequestMapping("myPage_Intro.me")
	public String myPage_Intro() {
		return "myPage_Intro";
	}
	
	@RequestMapping("myPage_Follow.me")
	public String myPage_Follow() {
		return "myPage_Follow";
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
}
