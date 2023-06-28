package kh.finalproj.hollosekki.menu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.finalproj.hollosekki.menu.service.MenuService;

@Controller
public class MenuController {
	@Autowired
	private MenuService mService;
	
	@RequestMapping("menuList.mn")
	public String menuList() {
		return "menuList";
	}
	
	@RequestMapping("menuDetail.mn")
	public String menuDetail() {
		return "menuDetail";
	}
}
