package kh.finalproj.hollosekki.users.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
public class UsersController {
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
	
	@RequestMapping("myPage_checkPwd.me")
	public String myPage_checkPwd() {
		return "myPage_checkPwd";
	}
	
	@RequestMapping("myPage_editInfo.me")
	public String myPage_editInfo() {
		return "myPage_editInfo";
	}
}
