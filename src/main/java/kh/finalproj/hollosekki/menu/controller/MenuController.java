package kh.finalproj.hollosekki.menu.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproj.hollosekki.common.Pagination;
import kh.finalproj.hollosekki.common.ReviewPagination;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Likes;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Product;
import kh.finalproj.hollosekki.common.model.vo.QNA;
import kh.finalproj.hollosekki.common.model.vo.Review;
import kh.finalproj.hollosekki.enroll.model.service.EnrollService;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.service.MarketService;
import kh.finalproj.hollosekki.market.model.vo.Orders;
import kh.finalproj.hollosekki.market.model.vo.QA;
import kh.finalproj.hollosekki.menu.model.exception.MenuException;
import kh.finalproj.hollosekki.menu.model.service.MenuService;
import kh.finalproj.hollosekki.menu.model.vo.MenuList;
import kh.finalproj.hollosekki.recipe.model.service.RecipeService;

@SessionAttributes("cart")
@Controller
public class MenuController {
	@Autowired
	private MenuService mService;
	
	@Autowired
	private MarketService mkService;
	
	@Autowired
	private RecipeService rService;
	
	@Autowired
	private EnrollService eService;
	
	@RequestMapping("menuList.mn")
	public String menuList(Model model, @RequestParam(value="page", required=false) Integer page,
						   HttpSession session) {
		int currentPage=1;
		if(page != null) {
			currentPage = page;
		}
		
		Users u = (Users)session.getAttribute("loginUser");
		
		if(u != null) {
			int cart = eService.cartCount(u.getUsersNo());
			model.addAttribute("cart", cart);
		}
		
		int listCount = mService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
		ArrayList<Menu> mList = new ArrayList<>();
		ArrayList<Image> iList = new ArrayList<>();
		
		
		ArrayList<Menu> menuScore = mService.menuScore();
		model.addAttribute("menuScore", menuScore);
		ArrayList<Users> users = eService.AllUsersList();
		model.addAttribute("uList", users);
		ArrayList<Likes> likeList = mService.likeList();
		model.addAttribute("lList", likeList);
		ArrayList<Likes> loginUserLikeList = mService.loginUserLikeList(u);
		model.addAttribute("loginUserLikeList", loginUserLikeList);
		
		mList = mService.selectMenuList(pi);
		iList = mService.selectMenuImage();
		
		if(!mList.isEmpty()) {
			model.addAttribute("mList", mList);
			model.addAttribute("iList", iList);
			model.addAttribute("pi", pi);
			
			return "menuList";
		}  else {
			String str = "등록된 식단이 없습니다.";
			
			model.addAttribute("mList", mList);
			model.addAttribute("str", str);
			model.addAttribute("pi", pi);
			
			return "menuList";
		}
	}
	
	@RequestMapping("searchMenu.mn")
	public String searchMenu(Model model, @RequestParam(value="page", required=false) Integer page,
						   @RequestParam(value="word", required=false) String word, HttpSession session) {
		
		int currentPage=1;
		if(page != null) {
			currentPage = page;
		}
		
		Users u = (Users)session.getAttribute("loginUser");
		
		if(u != null) {
			int cart = eService.cartCount(u.getUsersNo());
			model.addAttribute("cart", cart);
		}
		
		int listCount = mService.getSearchListCount(word);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
		
		ArrayList<Menu> searchList = new ArrayList<>();
		ArrayList<Image> iList = new ArrayList<>();
		
		searchList = mService.searchMenu(pi, word);
		iList = mService.selectMenuImage();
		
		ArrayList<Menu> menuScore = mService.menuScore();
		model.addAttribute("menuScore", menuScore);
		ArrayList<Users> users = eService.AllUsersList();
		model.addAttribute("uList", users);
		ArrayList<Likes> likeList = mService.likeList();
		model.addAttribute("lList", likeList);
		ArrayList<Likes> loginUserLikeList = mService.loginUserLikeList(u);
		model.addAttribute("loginUserLikeList", loginUserLikeList);
		
		String category = "word";
		String value = word;
		
		if(searchList.isEmpty()) {
			String str = "검색된 식단이 없습니다.";
			model.addAttribute("str", str);
			model.addAttribute("pi", pi);
			model.addAttribute("mList", searchList);
			model.addAttribute("iList", iList);
			
			return "menuList";
		} else {
			model.addAttribute("cate", category);
			model.addAttribute("value", value);
			model.addAttribute("mList", searchList);
			model.addAttribute("iList", iList);
			model.addAttribute("pi", pi);
			
			return "menuList";
		}
	}
	
	@RequestMapping("menuDetail.mn")
	public ModelAndView menuDetail(@RequestParam("mNo") int mNo, @RequestParam(value="page", required=false) Integer page,
								   HttpSession session, ModelAndView mv, Model model,
								   @RequestParam(value = "repage", required = false) Integer repage,
								   @RequestParam(value = "myrepage", required = false) Integer myrepage) {
		
		Users loginUser = (Users)session.getAttribute("loginUser");
		String loginId = null;
		String nickName = null;
		Review my = new Review();
		int userNo = 0;
		int myReview = 0;
		if(loginUser != null) {
			userNo = ((Users)session.getAttribute("loginUser")).getUsersNo();
			loginId = loginUser.getUsersId();
			nickName = loginUser.getNickName();
			
			my.setReviewWriter(nickName);
			my.setProductNo(mNo);
			
			myReview = mService.myReview(my);
		}
		boolean yn = false;
		
		int reviewCount = mService.getReviewCount(mNo);
		if(repage == null) {
			repage = 1;
		}
		if(myrepage == null) {
			myrepage = 1;
		}
		
		PageInfo rpi = ReviewPagination.getPageInfo(repage, reviewCount, 5);
		PageInfo mpi = ReviewPagination.getPageInfo(myrepage, myReview, 5); // 내 리뷰
		
		int qnaCount = mService.getQnaCount(mNo);
		PageInfo qpi = ReviewPagination.getPageInfo(1, qnaCount, 5);
		
		int usersNo = mService.selectUsersNo(mNo);
		int productNo = mNo;
		
		if(loginUser != null) {
			int result = mkService.selectLike(loginUser.getUsersNo(), productNo);
			int result2 = mService.selectBookmark(loginUser.getUsersNo(), productNo);
			model.addAttribute("bookmark", result2);
		      if(result >= 1) {
		    	  model.addAttribute("like", result);
		      }
		}
		
		Image menuProfile = mService.selectProfile(usersNo);
		
		Menu menu = mService.menuDetail(mNo);
		Image thum = mService.menuDetailThum(mNo);
		ArrayList<MenuList> mlList = mService.menuDetailMenu(mNo);
		ArrayList<Image> miList = mService.menuDetailImage();
		ArrayList<Product> pList = mService.healtherInfo(usersNo);
		ArrayList<Review> rList = mService.selectReviewList(rpi, mNo);
		
		HashMap<String, Object> myMap = new HashMap<String, Object>();
		myMap.put("reviewWriter", nickName);
		myMap.put("productNo", mNo);
		
		ArrayList<Review> mrList = mService.selectMyReviewList(mpi, myMap);
		System.out.println(menu);
		System.out.println(mrList);
		
		ArrayList<QA> qList = mService.selectQnaList(qpi, mNo);
		
		// 주문정보 조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usersNo", userNo);
		map.put("productNo", mNo);
		
		ArrayList<Orders> oList = mService.selectMyOrders(map);
		ArrayList<HashMap<String, Object>> notReview = mService.notReview(map); // 주문번호 있는데 리뷰 작성안한
		
		if(menu != null || myReview == 0) {
			mv.addObject("menu", menu);
			mv.addObject("thum", thum);
			mv.addObject("mlList", mlList);
			mv.addObject("miList", miList);
			mv.addObject("pList", pList);
			mv.addObject("rList", rList);
			mv.addObject("mrList", mrList);
			mv.addObject("oList", oList);
			mv.addObject("myReview", myReview);
			mv.addObject("reviewCount", reviewCount);
			mv.addObject("rpi", rpi);
			mv.addObject("mpi", mpi);
			mv.addObject("page", page);
			mv.addObject("repage", repage);
			mv.addObject("myrepage", myrepage);
			mv.addObject("notReview", notReview);
			mv.addObject("notReviewCount", notReview.size());
			mv.addObject("qnaCount", qnaCount);
			mv.addObject("qList", qList);
			mv.addObject("menuProfile", menuProfile);
			mv.setViewName("menuDetail");
			
			return mv;
		} else {
			throw new MenuException("식단 상세조회를 실패하였습니다.");
		}
	}
	
	// 카테고리 검색
	@RequestMapping("menuCategory.mn")
	public String menuCategory(HttpServletRequest request, Model model, HttpSession session,
										@RequestParam(value="page", required=false) Integer currentPage,							
										@RequestParam("cate") int cate){
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		Users u = (Users)session.getAttribute("loginUser");
		
		if(u != null) {
			int cart = eService.cartCount(u.getUsersNo());
			model.addAttribute("cart", cart);
		}
		
		int listCount = mService.getCateListCount(cate);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
		
		ArrayList<Menu> mList = mService.menuCategory(pi, cate);
		ArrayList<Image> iList = mService.selectMenuImage();
		
		String category = "cate";
		int value = cate;
		
		ArrayList<Menu> menuScore = mService.menuScore();
		model.addAttribute("menuScore", menuScore);
		ArrayList<Users> users = eService.AllUsersList();
		model.addAttribute("uList", users);
		ArrayList<Likes> likeList = mService.likeList();
		model.addAttribute("lList", likeList);
		ArrayList<Likes> loginUserLikeList = mService.loginUserLikeList(u);
		model.addAttribute("loginUserLikeList", loginUserLikeList);
		
		if(mList.isEmpty()) {
			String str = "해당 카테고리 레시피가 없습니다.";
			model.addAttribute("str", str);
			model.addAttribute("pi", pi);
			model.addAttribute("mList", mList);
			model.addAttribute("iList", iList);
			
			return "menuList";
		} else {
			model.addAttribute("mList", mList);
			model.addAttribute("iList", iList);
			model.addAttribute("cate", category);
			model.addAttribute("value", value);
			model.addAttribute("pi", pi);
			
			return "menuList";
		}
	}
	
	@RequestMapping("insertBookmark.mn")
	@ResponseBody
	public String insertBookmark(int usersNo, int divisionNo) {
		System.out.println(usersNo);
		System.out.println(divisionNo);
		int result = mService.insertBookmark(usersNo, divisionNo);
		System.out.println(result);
		if(result > 0) {
			   return "success";
		   } else {
			   return "fail";
		   }
	}
	
	@RequestMapping("deleteBookmark.mn")
	@ResponseBody
	public String deleteBookmark(int usersNo, int divisionNo) {
		System.out.println("usersNo : "+usersNo);
		System.out.println("division : "+divisionNo);
		int result = mService.deleteBookmark(usersNo, divisionNo);
		
		if(result > 0) {
			   return "success";
		} else {
			   return "fail";
		}
	}
	
	@RequestMapping("writeReview.mn")
	public String writeReview(@ModelAttribute Review r) {
		System.out.println(r.getOrderNo());
		int result = mService.insertReview(r);
		
		if(result > 0) {
			return "redirect:menuDetail.mn?mNo=" + r.getProductNo();
		} else {
			throw new MenuException("식단 후기 등록 실패");
		}
	}
	
	@RequestMapping("updateReview.mn")
	public String updateReview(@ModelAttribute Review r) {
		int result = mService.updateReview(r);
		
		if(result > 0) {
			return "redirect:menuDetail.mn?mNo=" + r.getProductNo();
		} else {
			throw new MenuException("식단 후기 등록 실패");
		}
	}
	
	@RequestMapping("deleteReview.mn")
	public String updateReview(@RequestParam("reviewNo") int reviewNo, @RequestParam("mNo") int mNo) {
		int result = rService.deleteReview(reviewNo);
		
		if(result > 0) {
			return "redirect:menuDetail.mn?mNo=" + mNo;
		} else {
			throw new MenuException("식단 후기 등록 실패");
		}
	}
	
	@RequestMapping("insertQna.mn")
	public String insertQna(@ModelAttribute QA qna) {
		
		int result = mService.insertQna(qna);
		
		if(result > 0) {
			return "redirect:menuDetail.mn?mNo=" + qna.getProductNo();
		} else {
			throw new MenuException("식단 문의 등록 실패");
		}
	}
	
	
}
