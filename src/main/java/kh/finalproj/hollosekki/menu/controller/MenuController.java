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
								   @RequestParam(value = "myrepage", required = false) Integer myrepage,
								   @RequestParam(value = "qnapage", required = false) Integer qnapage) {
		
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
		
		String menuName = mService.selectMenuId(mNo);
		
		boolean yn = false;
		if(!menuName.equals(nickName)) {
			yn = true;
		}
		int qnaCount = mService.getQnaCount(mNo);
		int reviewCount = mService.getReviewCount(mNo);
		if(qnapage == null) {
			qnapage = 1;
		}
		
		if(repage == null) {
			repage = 1;
		}
		if(myrepage == null) {
			myrepage = 1;
		}
		
		PageInfo qpi = ReviewPagination.getPageInfo(qnapage, qnaCount, 5);
		PageInfo rpi = ReviewPagination.getPageInfo(repage, reviewCount, 5);
		PageInfo mpi = ReviewPagination.getPageInfo(myrepage, myReview, 5); // 내 리뷰
		
		
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
		
		Menu menu = mService.menuDetail(yn, mNo);
		Image thum = mService.menuDetailThum(mNo);
		ArrayList<MenuList> mlList = mService.menuDetailMenu(mNo);
		
		ArrayList<String> nutrient = new ArrayList<>();
		ArrayList<Double> totalNu = new ArrayList<>();
		Double kcal = (double)0;
		Double carbo = (double)0;
		Double protein = (double)0;
		Double fat = (double)0;
		Double transfat = (double)0;
		Double saturfat = (double)0;
		Double na = (double)0;
		Double sugar = (double)0;
		Double cole = (double)0;
		for(int i = 0; i < mlList.size(); i++) {
//			System.out.println(mlList.get(i).getFoodContent().split("@", 0)[3]);
			nutrient.add(mlList.get(i).getFoodContent().split("@", 0)[3]);
//			for(int j = 0; j < 9; j++) {
//				System.out.println(nutrient.get(i).split(",", 0)[j]);
				kcal += Double.parseDouble(nutrient.get(i).split(",", 0)[0]);
				carbo += Double.parseDouble(nutrient.get(i).split(",", 0)[1]);
				protein += Double.parseDouble(nutrient.get(i).split(",", 0)[2]);
				fat += Double.parseDouble(nutrient.get(i).split(",", 0)[3]);
				transfat += Double.parseDouble(nutrient.get(i).split(",", 0)[4]);
				saturfat += Double.parseDouble(nutrient.get(i).split(",", 0)[5]);
				na += Double.parseDouble(nutrient.get(i).split(",", 0)[6]);
				sugar += Double.parseDouble(nutrient.get(i).split(",", 0)[7]);
				cole += Double.parseDouble(nutrient.get(i).split(",", 0)[8]);
//			}
		}
		totalNu.add(kcal);
		totalNu.add(carbo);
		totalNu.add(protein);
		totalNu.add(fat);
		totalNu.add(transfat);
		totalNu.add(saturfat);
		totalNu.add(na);
		totalNu.add(sugar);
		totalNu.add(cole);
		
		Double kcal1 = (double)0;
		Double carbo1 = (double)0;
		Double protein1 = (double)0;
		Double fat1 = (double)0;
		Double transfat1 = (double)0;
		Double saturfat1= (double)0;
		Double na1 = (double)0;
		Double sugar1 = (double)0;
		Double cole1 = (double)0;
		ArrayList<String> nutrient1 = new ArrayList<>();
		ArrayList<Double> totalNu1 = new ArrayList<>();
		for(int i = 0; i < 4; i ++) {
			nutrient1.add(mlList.get(i).getFoodContent().split("@", 0)[3]);
		}
		for(int j = 0; j < 4; j++) {
			kcal1 += Double.parseDouble(nutrient1.get(j).split(",", 0)[0]);
			carbo1 += Double.parseDouble(nutrient1.get(j).split(",", 0)[1]);
			protein1 += Double.parseDouble(nutrient1.get(j).split(",", 0)[2]);
			fat1 += Double.parseDouble(nutrient1.get(j).split(",", 0)[3]);
			transfat1 += Double.parseDouble(nutrient1.get(j).split(",", 0)[4]);
			saturfat1+= Double.parseDouble(nutrient1.get(j).split(",", 0)[5]);
			na1 += Double.parseDouble(nutrient1.get(j).split(",", 0)[6]);
			sugar1 += Double.parseDouble(nutrient1.get(j).split(",", 0)[7]);
			cole1 += Double.parseDouble(nutrient1.get(j).split(",", 0)[8]);
		}
		totalNu1.add(kcal1);
		totalNu1.add(carbo1);
		totalNu1.add(protein1);
		totalNu1.add(fat1);
		totalNu1.add(transfat1);
		totalNu1.add(saturfat1);
		totalNu1.add(na1);
		totalNu1.add(sugar1);
		totalNu1.add(cole1);
		
		Double kcal2 = (double)0;
		Double carbo2 = (double)0;
		Double protein2 =(double)0;
		Double fat2 = (double)0;
		Double transfat2 =(double)0;
		Double saturfat2= (double)0;
		Double na2 = (double)0;
		Double sugar2 = (double)0;
		Double cole2 = (double)0;
		ArrayList<String> nutrient2 = new ArrayList<>();
		ArrayList<Double> totalNu2 = new ArrayList<>();
		for(int i = 4; i < 8; i ++) {
			nutrient2.add(mlList.get(i).getFoodContent().split("@", 0)[3]);
		}
		for(int j = 0; j < 4; j++) {
			kcal2 += Double.parseDouble(nutrient2.get(j).split(",", 0)[0]);
			carbo2 += Double.parseDouble(nutrient2.get(j).split(",", 0)[1]);
			protein2 += Double.parseDouble(nutrient2.get(j).split(",", 0)[2]);
			fat2 += Double.parseDouble(nutrient2.get(j).split(",", 0)[3]);
			transfat2 += Double.parseDouble(nutrient2.get(j).split(",", 0)[4]);
			saturfat2 += Double.parseDouble(nutrient2.get(j).split(",", 0)[5]);
			na2 += Double.parseDouble(nutrient2.get(j).split(",", 0)[6]);
			sugar2 += Double.parseDouble(nutrient2.get(j).split(",", 0)[7]);
			cole2 += Double.parseDouble(nutrient2.get(j).split(",", 0)[8]);
		}
		totalNu2.add(kcal2);
		totalNu2.add(carbo2);
		totalNu2.add(protein2);
		totalNu2.add(fat2);
		totalNu2.add(transfat2);
		totalNu2.add(saturfat2);
		totalNu2.add(na2);
		totalNu2.add(sugar2);
		totalNu2.add(cole2);
		
		Double kcal3 = (double)0;
		Double carbo3 = (double)0;
		Double protein3 = (double)0;
		Double fat3 = (double)0;
		Double transfat3 = (double)0;
		Double saturfat3= (double)0;
		Double na3 = (double)0;
		Double sugar3 = (double)0;
		Double cole3 = (double)0;
		ArrayList<String> nutrient3 = new ArrayList<>();
		ArrayList<Double> totalNu3 = new ArrayList<>();
		for(int i = 8; i < 12; i ++) {
			nutrient3.add(mlList.get(i).getFoodContent().split("@", 0)[3]);
		}
		for(int j = 0; j < 4; j++) {
			kcal3 += Double.parseDouble(nutrient3.get(j).split(",", 0)[0]);
			carbo3 += Double.parseDouble(nutrient3.get(j).split(",", 0)[1]);
			protein3 += Double.parseDouble(nutrient3.get(j).split(",", 0)[2]);
			fat3 += Double.parseDouble(nutrient3.get(j).split(",", 0)[3]);
			transfat3 += Double.parseDouble(nutrient3.get(j).split(",", 0)[4]);
			saturfat3+= Double.parseDouble(nutrient3.get(j).split(",", 0)[5]);
			na3 += Double.parseDouble(nutrient3.get(j).split(",", 0)[6]);
			sugar3 += Double.parseDouble(nutrient3.get(j).split(",", 0)[7]);
			cole3 += Double.parseDouble(nutrient3.get(j).split(",", 0)[8]);
		}
		totalNu3.add(kcal3);
		totalNu3.add(carbo3);
		totalNu3.add(protein3);
		totalNu3.add(fat3);
		totalNu3.add(transfat3);
		totalNu3.add(saturfat3);
		totalNu3.add(na3);
		totalNu3.add(sugar3);
		totalNu3.add(cole3);
		
		Double kcal4 = (double)0;
		Double carbo4 = (double)0;
		Double protein4 = (double)0;
		Double fat4 = (double)0;
		Double transfat4 = (double)0;
		Double saturfat4= (double)0;
		Double na4 = (double)0;
		Double sugar4 = (double)0;
		Double cole4 = (double)0;
		ArrayList<String> nutrient4 = new ArrayList<>();
		ArrayList<Double> totalNu4 = new ArrayList<>();
		for(int i = 12; i < 16; i ++) {
			nutrient4.add(mlList.get(i).getFoodContent().split("@", 0)[3]);
		}
		for(int j = 0; j < 4; j++) {
			kcal4 += Double.parseDouble(nutrient4.get(j).split(",", 0)[0]);
			carbo4 += Double.parseDouble(nutrient4.get(j).split(",", 0)[1]);
			protein4 += Double.parseDouble(nutrient4.get(j).split(",", 0)[2]);
			fat4 += Double.parseDouble(nutrient4.get(j).split(",", 0)[3]);
			transfat4 += Double.parseDouble(nutrient4.get(j).split(",", 0)[4]);
			saturfat4+= Double.parseDouble(nutrient4.get(j).split(",", 0)[5]);
			na4 += Double.parseDouble(nutrient4.get(j).split(",", 0)[6]);
			sugar4 += Double.parseDouble(nutrient4.get(j).split(",", 0)[7]);
			cole4 += Double.parseDouble(nutrient4.get(j).split(",", 0)[8]);
		}
		totalNu4.add(kcal4);
		totalNu4.add(carbo4);
		totalNu4.add(protein4);
		totalNu4.add(fat4);
		totalNu4.add(transfat4);
		totalNu4.add(saturfat4);
		totalNu4.add(na4);
		totalNu4.add(sugar4);
		totalNu4.add(cole4);
		
		Double kcal5 = (double)0;
		Double carbo5 = (double)0;
		Double protein5 = (double)0;
		Double fat5 = (double)0;
		Double transfat5 = (double)0;
		Double saturfat5= (double)0;
		Double na5 = (double)0;
		Double sugar5 = (double)0;
		Double cole5 = (double)0;
		ArrayList<String> nutrient5 = new ArrayList<>();
		ArrayList<Double> totalNu5 = new ArrayList<>();
		for(int i = 16; i < 20; i ++) {
			nutrient5.add(mlList.get(i).getFoodContent().split("@", 0)[3]);
		}
		for(int j = 0; j < 4; j++) {
			kcal5 += Double.parseDouble(nutrient5.get(j).split(",", 0)[0]);
			carbo5 += Double.parseDouble(nutrient5.get(j).split(",", 0)[1]);
			protein5 += Double.parseDouble(nutrient5.get(j).split(",", 0)[2]);
			fat5 += Double.parseDouble(nutrient5.get(j).split(",", 0)[3]);
			transfat5 += Double.parseDouble(nutrient5.get(j).split(",", 0)[4]);
			saturfat5 += Double.parseDouble(nutrient5.get(j).split(",", 0)[5]);
			na5 += Double.parseDouble(nutrient5.get(j).split(",", 0)[6]);
			sugar5 += Double.parseDouble(nutrient5.get(j).split(",", 0)[7]);
			cole5 += Double.parseDouble(nutrient5.get(j).split(",", 0)[8]);
		}
		totalNu5.add(kcal5);
		totalNu5.add(carbo5);
		totalNu5.add(protein5);
		totalNu5.add(fat5);
		totalNu5.add(transfat5);
		totalNu5.add(saturfat5);
		totalNu5.add(na5);
		totalNu5.add(sugar5);
		totalNu5.add(cole5);
		
		Double kcal6 = (double)0;
		Double carbo6 = (double)0;
		Double protein6 =(double)0;
		Double fat6 = (double)0;
		Double transfat6 = (double)0;
		Double saturfat6= (double)0;
		Double na6 = (double)0;
		Double sugar6 = (double)0;
		Double cole6 = (double)0;
		ArrayList<String> nutrient6 = new ArrayList<>();
		ArrayList<Double> totalNu6 = new ArrayList<>();
		for(int i = 20; i < 24; i ++) {
			nutrient6.add(mlList.get(i).getFoodContent().split("@", 0)[3]);
		}
		for(int j = 0; j < 4; j++) {
			kcal6 += Double.parseDouble(nutrient6.get(j).split(",", 0)[0]);
			carbo6 += Double.parseDouble(nutrient6.get(j).split(",", 0)[1]);
			protein6 += Double.parseDouble(nutrient6.get(j).split(",", 0)[2]);
			fat6 += Double.parseDouble(nutrient6.get(j).split(",", 0)[3]);
			transfat6 += Double.parseDouble(nutrient6.get(j).split(",", 0)[4]);
			saturfat6+= Double.parseDouble(nutrient6.get(j).split(",", 0)[5]);
			na6 += Double.parseDouble(nutrient6.get(j).split(",", 0)[6]);
			sugar6 += Double.parseDouble(nutrient6.get(j).split(",", 0)[7]);
			cole6 += Double.parseDouble(nutrient6.get(j).split(",", 0)[8]);
		}
		totalNu6.add(kcal6);
		totalNu6.add(carbo6);
		totalNu6.add(protein6);
		totalNu6.add(fat6);
		totalNu6.add(transfat6);
		totalNu6.add(saturfat6);
		totalNu6.add(na6);
		totalNu6.add(sugar6);
		totalNu6.add(cole6);
		
		Double kcal7 = (double)0;
		Double carbo7 = (double)0;
		Double protein7 = (double)0;
		Double fat7 = (double)0;
		Double transfat7 = (double)0;
		Double saturfat7= (double)0;
		Double na7 = (double)0;
		Double sugar7 = (double)0;
		Double cole7 =(double)0;
		ArrayList<String> nutrient7 = new ArrayList<>();
		ArrayList<Double> totalNu7 = new ArrayList<>();
		for(int i = 24; i < 28; i ++) {
			nutrient7.add(mlList.get(i).getFoodContent().split("@", 0)[3]);
		}
		for(int j = 0; j < 4; j++) {
			kcal7 += Double.parseDouble(nutrient7.get(j).split(",", 0)[0]);
			carbo7 += Double.parseDouble(nutrient7.get(j).split(",", 0)[1]);
			protein7 += Double.parseDouble(nutrient7.get(j).split(",", 0)[2]);
			fat7 += Double.parseDouble(nutrient7.get(j).split(",", 0)[3]);
			transfat7 += Double.parseDouble(nutrient7.get(j).split(",", 0)[4]);
			saturfat7 += Double.parseDouble(nutrient7.get(j).split(",", 0)[5]);
			na7 += Double.parseDouble(nutrient7.get(j).split(",", 0)[6]);
			sugar7 += Double.parseDouble(nutrient7.get(j).split(",", 0)[7]);
			cole7 += Double.parseDouble(nutrient7.get(j).split(",", 0)[8]);
		}
		totalNu7.add(kcal7);
		totalNu7.add(carbo7);
		totalNu7.add(protein7);
		totalNu7.add(fat7);
		totalNu7.add(transfat7);
		totalNu7.add(saturfat7);
		totalNu7.add(na7);
		totalNu7.add(sugar7);
		totalNu7.add(cole7);
		
		ArrayList<Image> miList = mService.menuDetailImage();
		ArrayList<Product> pList = mService.healtherInfo(usersNo);
		ArrayList<Review> rList = mService.selectReviewList(rpi, mNo);
		
		HashMap<String, Object> myMap = new HashMap<String, Object>();
		myMap.put("reviewWriter", nickName);
		myMap.put("productNo", mNo);
		
		ArrayList<Review> mrList = mService.selectMyReviewList(mpi, myMap);
		
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
			mv.addObject("qpi", qpi);
			mv.addObject("menuProfile", menuProfile);
			mv.addObject("totalNu", totalNu);
			mv.addObject("totalNu1", totalNu1);
			mv.addObject("totalNu2", totalNu2);
			mv.addObject("totalNu3", totalNu3);
			mv.addObject("totalNu4", totalNu4);
			mv.addObject("totalNu5", totalNu5);
			mv.addObject("totalNu6", totalNu6);
			mv.addObject("totalNu7", totalNu7);
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
	public String writeReview(@ModelAttribute Review r, HttpSession session) {
		int usersNo = ((Users)session.getAttribute("loginUser")).getUsersNo();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("r", r);
		map.put("usersNo", usersNo);
		
		int result = mService.insertReview(map);
		
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
