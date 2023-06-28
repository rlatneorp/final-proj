package kh.finalproj.hollosekki.menu.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.finalproj.hollosekki.common.Pagination;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.menu.exception.MenuException;
import kh.finalproj.hollosekki.menu.service.MenuService;

@Controller
public class MenuController {
	@Autowired
	private MenuService mService;
	
	@RequestMapping("menuList.mn")
	public String menuList(Model model, @RequestParam(value="page", required=false) Integer page,
						   @RequestParam(value="input", required=false) String word) {
		int currentPage=1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Menu> mList = mService.selectMenuList(pi);
		ArrayList<Image> iList = mService.selectMenuImage();
		
		if(mList != null) {
			model.addAttribute("mList", mList);
			model.addAttribute("iList", iList);
			
			return "menuList";
		} else {
			throw new MenuException("식단 조회를 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("menuDetail.mn")
	public String menuDetail() {
		return "menuDetail";
	}
}
