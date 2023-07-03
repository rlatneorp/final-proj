package kh.finalproj.hollosekki.menu.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproj.hollosekki.common.Pagination;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Product;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.service.MarketService;
import kh.finalproj.hollosekki.menu.model.exception.MenuException;
import kh.finalproj.hollosekki.menu.model.service.MenuService;
import kh.finalproj.hollosekki.menu.model.vo.MenuList;

@Controller
public class MenuController {
	@Autowired
	private MenuService mService;
	
	@Autowired
	private MarketService mkService;
	
	@RequestMapping("menuList.mn")
	public String menuList(Model model, @RequestParam(value="page", required=false) Integer page,
						   @RequestParam(value="input", required=false) String word) {
		int currentPage=1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = mService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Menu> mList = new ArrayList<>();
		ArrayList<Menu> searchList = new ArrayList<>();
		ArrayList<Image> iList = new ArrayList<>();
		ArrayList<Image> searchImage = new ArrayList<>();
		
		
		if(word == null) {
			mList = mService.selectMenuList(pi);
			iList = mService.selectMenuImage();
		} else if(word != null) {
			searchList = mService.searchMenu(word);
			iList = mService.selectMenuImage();
		}
		
		System.out.println(mList);
		System.out.println(iList);
		
		if(word ==null) {
			model.addAttribute("mList", mList);
			model.addAttribute("iList", iList);
			model.addAttribute("pi", pi);
			
			return "menuList";
		} else if(word != null) {
			model.addAttribute("mList", searchList);
			model.addAttribute("iList", iList);
			model.addAttribute("pi", pi);
			
			return "menuList";
		} else {
			throw new MenuException("식단 조회를 실패하였습니다.");
		}
	}
	
	@RequestMapping("menuDetail.mn")
	public ModelAndView menuDetail(@RequestParam("mNo") int mNo, @RequestParam(value="page", required=false) Integer page,
							 HttpSession session, ModelAndView mv, Model model) {
		
		Users loginUser = (Users)session.getAttribute("loginUser");
		String loginId = null;
		if(loginUser != null) {
			loginId = loginUser.getUsersId();
		}
		boolean yn = false;
		
		int usersNo = mService.selectUsersNo(mNo);
		int productNo = mNo;
		int result = mkService.selectLike(loginUser.getUsersNo(), productNo);
	      if(result >= 1) {
	    	  model.addAttribute("like", result);
	      }
		
		Menu menu = mService.menuDetail(mNo);
		Image thum = mService.menuDetailThum(mNo);
		ArrayList<MenuList> mlList = mService.menuDetailMenu(mNo);
		ArrayList<Image> miList = mService.menuDetailImage();
		ArrayList<Product> pList = mService.healtherInfo(usersNo);
		System.out.println(menu);
		if(menu != null) {
			mv.addObject("menu", menu);
			mv.addObject("thum", thum);
			mv.addObject("mlList", mlList);
			mv.addObject("miList", miList);
			mv.addObject("pList", pList);
			mv.setViewName("menuDetail");
			
			return mv;
		} else {
			throw new MenuException("식단 상세조회를 실패하였습니다.");
		}
	}
	
	// 카테고리 검색
	@RequestMapping(value="menuCategory.mn", produces="application/json; charset=UTF-8")
	@ResponseBody
	public ArrayList<Menu> menuCategory(HttpServletRequest request, Model model, @RequestParam("cate") int cate){
		
		ArrayList<Menu> mList = mService.menuCategory(cate);
		
		return mList;
	}
}
