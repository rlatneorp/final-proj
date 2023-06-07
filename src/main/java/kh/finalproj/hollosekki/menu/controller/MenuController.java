package kh.finalproj.hollosekki.menu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MenuController {
	
	@RequestMapping("menuList.mn")
	public String menuList() {
		return "menuList";
	}
	
	@RequestMapping("menuDetail.mn")
	public String menuDetail() {
		return "menuDetail";
	}
	
	@RequestMapping("menuDetail_mk2.mn")
	public String menuDetail_mk2() {
		return "menuDetail_mk2";
	}
}
