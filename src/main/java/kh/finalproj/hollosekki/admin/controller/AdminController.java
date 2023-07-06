package kh.finalproj.hollosekki.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import kh.finalproj.hollosekki.admin.exception.AdminException;
import kh.finalproj.hollosekki.admin.model.service.AdminService;
import kh.finalproj.hollosekki.admin.model.vo.AdminBasic;
import kh.finalproj.hollosekki.admin.model.vo.AdminMain;
import kh.finalproj.hollosekki.admin.model.vo.Sales;
import kh.finalproj.hollosekki.board.model.vo.Board;
import kh.finalproj.hollosekki.common.Pagination;
import kh.finalproj.hollosekki.common.model.vo.FAQ;
import kh.finalproj.hollosekki.common.model.vo.Food;
import kh.finalproj.hollosekki.common.model.vo.Healther;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.Options;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Point;
import kh.finalproj.hollosekki.common.model.vo.Product;
import kh.finalproj.hollosekki.common.model.vo.QNA;
import kh.finalproj.hollosekki.common.model.vo.Review;
import kh.finalproj.hollosekki.common.model.vo.Tool;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.vo.Orders;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	
//	DeleteSelects-일괄삭제
	@PostMapping("adminDeleteSelects.ad")
	public String adminDeleteSelects(@RequestParam("selectDelete") ArrayList<Integer> selDeletes,
//									 @RequestParam("selectDelete") String[] selDeletes,
									 @RequestParam("type") Integer type,
									 @RequestParam("url") String url,
								 	 HttpServletRequest request,
								 	 Model model) {
		System.out.println("selDeletes"+selDeletes);
		System.out.println("type:"+type);
		System.out.println("url:"+url);
		
//		삭제하러 들어오기 전, 기존에 다른DB에서 해당 데이터를 사용중이라면, 삭제 불가!!하도록 변경해야함
		
//		 	type	-->
//		 	1 : 식품 			product				image
//		 	2 : 식단 			product				image 	menuList
//		 	3 : 식재료		(product)			image
//		 	4 : 주방도구		product				image
//				5 : 상품  		
//		 	6 : 레시피	 	review				image
//		 	7 : 리뷰(Review)						image
//		 	8 : 게시판(Board) review				image
//		 	9 : FAQ		
//		 	10 : QNA
//			11 : menuList
//		
//		1. type == 3 	1) ingredient_no에 맞는 product_no 리스트 불러오기
//						2) product_no이 0이 아니라면 type과 함께 image 리스트 불러오기
//☆☆☆ type == 4	옵션 지워야함!! ☆☆☆
//		   type == 1~4	3) product_no, type으로 image 리스트 불러오기
//			o	a.이미지 (일괄)삭제
//				b.각각(food, menu, ingredient, tool) 삭제
//				c.product 삭제
//		
//		2. type == 6,8	1) review 리스트 불러오기
//						2) review 이미지 리스트 불러오기
//						3) 게시글의 image 리스트 불러오기
//☆☆☆ type == 6	recipe_order 지워야함!! ☆☆☆
//☆☆☆ type == 6	recipe_element 지워야함!! ☆☆☆
//			o	a.이미지 삭제
//				b.리뷰 삭제
//				c.각각(레시피/게시판)삭제
//		
//		3. type == 7 	1) review 이미지 리스트 불러오기
//			o	a.이미지 삭제
//				b.리뷰 삭제
//		
//		4. type == 9,10	1) -
//				a.각각(FAQ/QNA) 삭제
		
		ArrayList<Image> imgList = new ArrayList<Image>();
		ArrayList<Integer> delList1 = new ArrayList<Integer>();
		ArrayList<Integer> delList2 = new ArrayList<Integer>();
		ArrayList<Integer> delList3 = new ArrayList<Integer>();
		Integer imgType1 = 0;
		Integer imgType2 = 0;
		Integer type1 = type;
		Integer type2 = 0;
		Integer type3 = 0;
		int resultImg = 0;
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		
		delList1 = selDeletes;
//		상품일때(식품/식단/식재료/주방) type == 1~4;
		if(type >= 1 && type <= 4) {
//			식재료일때
			if(type == 3) {
				imgType1 = 3;
				ArrayList<Ingredient> igdList = new ArrayList<Ingredient>();
				ArrayList<Integer> pNoList = new ArrayList<Integer>();
				
				for(Integer i:selDeletes) {
					Ingredient ingredient = aService.selectIngredient(i);
//					product 등록이 되어있다면, product_no 담기
					if(ingredient.getProductNo() != 0) {
						delList2.add(ingredient.getProductNo());
						type2 = 5;
					}
				}
			}else {
				delList2 = selDeletes;
				type2 = 5;
			}
			if(type == 2) {
				imgType1 = 2;
				for(Integer i:selDeletes) {
					ArrayList<Integer> fNoList = aService.selectFoodProductNo(i);
					delList3.addAll(fNoList);
					type3 = 11;
				}
				
			}
			
//		레시피일때 type == 6
		}else if(type == 6){
			imgType1 = 6;
			imgType2 = 7;
			for(Integer i:selDeletes) {
				AdminBasic ab = new AdminBasic();
				ab.setKind(0);
				ab.setNumber(i);
				ab.setDuplication("Y");
				ArrayList<Review> rvList = aService.selectReviewList(null, ab);
				for(Review rv:rvList) {
					delList2.add(rv.getReviewNo());
					type2 = 7;
				}
			}
		}else if(type == 8) {
			imgType2 = 7;
			for(Integer i:selDeletes) {
				AdminBasic ab = new AdminBasic();
				ab.setKind(-1);
				ab.setNumber(i);
				ab.setDuplication("Y");
				ArrayList<Review> rvList = aService.selectReviewList(null, ab);
				for(Review rv:rvList) {
					delList2.add(rv.getReviewNo());
					type2 = 7;
				}
			}
		}
				
//		1,2,3,4,6,7,8 에 해당하는 image테이블의 type 설정
		switch(imgType1) {
		case 1: imgType1 = 3; break;
		case 2: imgType1 = 4; break;
		case 3: imgType1 = 5; break;
		case 4: imgType1 = 6; break;
		case 6: imgType1 = 2; break;
		case 7: imgType1 = 7; break;
		case 0: break;
		}
		
		switch(imgType2) {
		case 1: imgType2 = 3; break;
		case 2: imgType2 = 4; break;
		case 3: imgType2 = 5; break;
		case 4: imgType2 = 6; break;
		case 6: imgType2 = 2; break;
		case 7: imgType2 = 7; break;
		case 0: break;
		}
			
		if(delList1 != null && imgType1 != 0) {
			for(Integer no:delList1) {
				imgList.addAll(selectAllImageList(no, imgType1, -1));
			}
		}
		if(delList2 != null && imgType2 != 0) {
			for(Integer no:delList2) {
				imgList.addAll(selectAllImageList(no, imgType2, -1));
			}
		}
					
//		데이터 서버 이미지 삭제
		for(Image img:imgList) {
			deleteFile(img.getImageRenameName(), request);
//			DB서버 이미지 삭제
			resultImg += aService.deleteImage(img);
		}
		
		if(type1 != 0) {
			HashMap<String, Object> map1 = new HashMap<String, Object>();
			map1.put("selDeletes", delList1);
			map1.put("type", type1);
			System.out.println("delList1:"+delList1);
			System.out.println("type1:"+type1);
			result1 = aService.deleteSelects(map1);
		}
		if(type2 != 0) {
			HashMap<String, Object> map2 = new HashMap<String, Object>();
			map2.put("selDeletes", delList2);
			map2.put("type", type2);
			System.out.println("delList2:"+delList2);
			System.out.println("type2:"+type2);
			result2 = aService.deleteSelects(map2);
		}
		if(type3 != 0) {
			HashMap<String, Object> map3 = new HashMap<String, Object>();
			map3.put("selDeletes", delList3);
			map3.put("type", type3);
			System.out.println("delList3:"+delList3);
			System.out.println("type3:"+type3);
			result2 = aService.deleteSelects(map3);
		}
		
		System.out.println(resultImg);
		System.out.println(result1);
		System.out.println(result2);
		System.out.println(result3);
		if(result1 + result2 + result3 + resultImg > 0) {
			model = adminBasic(model, request, null);
			return "redirect:"+url;
		}else {
			throw new AdminException("삭제 실패 (type : "+type);
		}
	}
	
	
//	Main-메인화면
	@GetMapping("adminMain.ad")
	public String adminMain(Model model) {
		
//		매출정보
		AdminBasic ab = new AdminBasic();
		ab.setType(1);
		ab.setKind(1);
//		int totalSalesCount = aService.getRecipeCount(ab);
		ArrayList<AdminMain> salesList = aService.selectAdminMainList(ab);
		ArrayList<Sales> sMonthList = aService.selectSalesList(null, ab);
		
		int minus = 0;
		for(int i = 0; i < salesList.size(); i++) {
			AdminMain daySales = salesList.get(i);
			for(int j = 0; j < sMonthList.size(); j++) {
				if(i > 0 && !daySales.getDay().substring(0,5).equals(salesList.get(i-1).getDay().substring(0,5))) {
					minus = 0;
				}
				if(daySales.getDay().substring(0,5).equals(sMonthList.get(j).getDateKind())) {
					daySales.setOrderMonthSales(sMonthList.get(j).getSales() - minus);
					minus += daySales.getOrderDaySales(); 
					break;
				}
			}
		}
		
//		레시피정보
		ab.setType(2);
		int totalRecipeCount = aService.getRecipeCount(ab);
		ArrayList<AdminMain> recipeList = aService.selectAdminMainList(ab);
		minus = 0;
		for(AdminMain am : recipeList) {
			am.setRecipeTotalCount(totalRecipeCount-minus);
			minus += am.getRecipeDayCount();
		}
		
//		회원정보
		ab.setType(3);
		int totalUsersCount = aService.getUsersCount(ab);
		ArrayList<AdminMain> usersList = aService.selectAdminMainList(ab);
		minus = 0;
		for(AdminMain am : usersList) {
			am.setEnrollTotalCount(totalUsersCount-minus);
			minus += am.getEnrollDayCount();
		}
		
//		(식단)구독정보
		ab = new AdminBasic();
		ab.setType(2);
		int totalMenuCount = aService.getOrdersCount(ab);
		ab.setType(4);
		ArrayList<AdminMain> menuList = aService.selectAdminMainList(ab);
		minus = 0;
		for(AdminMain am : menuList) {
			am.setMenuTotalCount(totalMenuCount-minus);
			minus += am.getMenuDayCount();
		}
		
		System.out.println(salesList);
		System.out.println(recipeList);
		System.out.println(usersList);
		System.out.println(menuList);
		
		if(salesList != null && recipeList != null && usersList != null && menuList != null) {
			model.addAttribute("salesList", salesList);
			model.addAttribute("recipeList", recipeList);
			model.addAttribute("usersList", usersList);
			model.addAttribute("menuList", menuList);
			return "adminMain";
		}else {
			throw new AdminException("관리자 메인화면 조회에 실패하였습니다.");
		}
	}
	
	
//	Sales-매출 관리
	@GetMapping("adminSalesManage.ad")
	public String adminSalesManage(HttpServletRequest request,
								   Model model) {
		AdminBasic ab = (AdminBasic) request.getAttribute("ab");
		int listCount = aService.getSalesCount(ab);
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Sales> sList = aService.selectSalesList(pi, ab);
		if(sList != null) {
			model = adminBasic(model, request, pi);
			model.addAttribute("sList", sList);
			return "adminSalesManage";
		}else {
			throw new AdminException("매출 조회를 실패하였습니다.");
		}
		
	}
	
	
//	Order-주문 관리
	@GetMapping("adminOrdersManage.ad")
	public String adminOrdersManage(HttpServletRequest request,
								   Model model) {
		AdminBasic ab = (AdminBasic) request.getAttribute("ab");
		int listCount = aService.getOrdersCount(ab);
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Orders> odList = aService.selectOrdersList(pi, ab);
		Sales sales = aService.selectSalesList(null, ab).get(0);
		if(odList != null) {
			model = adminBasic(model, request, pi);
			model.addAttribute("odList", odList);
			model.addAttribute("sales", sales);
			return "adminOrdersManage";
		}else {
			throw new AdminException("주문 목록 조회에 실패하였습니다.");
		}
	}
	@GetMapping("adminSelectOrders.ad")
	public void adminSelectOrders(@RequestParam("orderNo")int orderNo,
									HttpServletResponse response) {
		AdminBasic ab = new AdminBasic();
		ab.setNumber(orderNo);
		Orders order = aService.selectOrders(ab);
		if(order != null) {
			response.setContentType("application/json; charset=UTF-8");
			GsonBuilder gb = new GsonBuilder();
			Gson gson = gb.create();
			
			try {
				gson.toJson(order, response.getWriter());
			} catch (JsonIOException | IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	
//	Users-회원 관리
	@GetMapping("adminUsersManage.ad")
	public String adminUsersManage(HttpServletRequest request,
								   Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		
		int listCount = aService.getUsersCount(ab);
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Users> uList = aService.selectUsersList(pi, ab);

		if(uList != null) {
			model = adminBasic(model, request, pi);
			model.addAttribute("uList", uList);
			return "adminUsersManage";
		}else {
			throw new AdminException("식재료 조회를 실패하였습니다.");
		}
	}
	@GetMapping("adminUsersDetail.ad")
	public String adminUsersDetail(@RequestParam("usersNo") int uNo,
								   @RequestParam(value="uri", required=false) String uri,
							 	   Model model) {
		Users u = aService.selectUsers(uNo);
		ArrayList<Image> img = selectAllImageList(uNo, 1, 0);

		HashMap<String, Integer> uMap = new HashMap<String, Integer>();
		uMap.put("usersNo", uNo);
		uMap.put("bookmarkType", 0);
		uMap.put("likeType", 0);
		ArrayList<Integer> uInfo = aService.selectUsersInfo(uMap);
		u.setFollowing(uInfo.get(0));
		u.setFollower(uInfo.get(1));
		u.setEnrollRecipe(uInfo.get(2));
		u.setBookmarkCount(uInfo.get(3));
		u.setLikeCount(uInfo.get(4));
		
		if(u != null) {
			model.addAttribute("u", u);
			model.addAttribute("img", img);
			model.addAttribute("uri", uri);
			return "adminUsersDetail";
		}else {
			throw new AdminException("회원 상세조회에 실패하였습니다.");
		}
	}
	@PostMapping("adminUsersUpdate.ad")
	public String adminUsersUpdate(HttpServletRequest request,
								   Model model,
								   @ModelAttribute Users u,
								   @ModelAttribute Point p,
								   @RequestParam(value="uri", required=false) String uri) {
		AdminBasic ab = (AdminBasic) request.getAttribute("ab");
		if(u.getPhone() != null) {
			u.setPhone(u.getPhone().replace(",", ""));
		}
		
		p.setPointType(2);
		p.setPointChange(p.getPoint() - p.getPointBefore());
		
		int resultU = aService.updateUsers(u, p);
		if(resultU == 2) {
			model = adminBasic(model, request, null);
			if(uri.equals("")) {
				return "redirect:adminUsersManage.ad";
			}else {
				return "redirect:"+uri;
			}
		}else {
			throw new AdminException("usersUpdate에 실패하였습니다.");
		}
	}
	
	
//	Point-포인트 관리
	@GetMapping("adminPointManage.ad")
	public String adminPointManage(HttpServletRequest request,
								   HttpSession session,
							 	   Model model) {
		AdminBasic ab = (AdminBasic) request.getAttribute("ab");
		String uri = request.getServletPath();
		
		int listCount = aService.getPointCount(ab);
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Point> pointList = aService.selectPointList(pi, ab);
		
		if(pointList != null) {
			model = adminBasic(model, request, pi);
			model.addAttribute("pointList", pointList);
			model.addAttribute("uri", uri);
			return "adminPointManage";
		}else {
			throw new AdminException("포인트관리 페이지 로드에 실패하였습니다.");
		}
	}
	
	
//	Menu-식단 관리
	@GetMapping("adminMenuManage.ad")
	public String adminMenuManage(HttpServletRequest request,
							 	  Model model,
							 	  HttpSession session) {
		int uNo = ((Users)session.getAttribute("loginUser")).getUsersNo();
		Healther h = aService.selectHealther(uNo); 
		AdminBasic ab = (AdminBasic) request.getAttribute("ab");
		
		int listCount = aService.getMenuCount(ab);
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Menu> mList = aService.selectMenuList(pi, ab);
		for(int i = 0; i < mList.size(); i++) {
			Menu m = mList.get(i);
			m = (Menu)selectProduct(m);
		}
		if(mList != null) {
			model = adminBasic(model, request, null);
			model.addAttribute("h", h);
			model.addAttribute("mList", mList);
			return "adminMenuManage";
		}else {
			throw new AdminException("식단 조회를 실패하였습니다.");
		}
		
	}
	@GetMapping("adminMenuDetail.ad")
	public String adminMenuDetail(
								  @RequestParam("productNo") int pNo,
							 	  Model model) {
		Menu m = aService.selectMenu(pNo);
		
		PageInfo pi = new PageInfo();
		AdminBasic ab1 = new AdminBasic();
		AdminBasic ab2 = new AdminBasic();
		pi.setCurrentPage(1);
		pi.setBoardLimit(100000);
		ab1.setKind(1);  // 메인메뉴
		ab1.setType(m.getMenuType());  // 식재료/밀키트 타입
		ab2.setKind(2);  // 서브메뉴
		ab2.setType(m.getMenuType());  // 식재료/밀키트 타입
		ArrayList<Food> fList1 = aService.selectFoodList(pi, ab1); 
		ArrayList<Food> fList2 = aService.selectFoodList(pi, ab2); 
		
		ArrayList<Integer> fNoArr = aService.selectFoodProductNo(pNo);
		String str = "";
		for(int i = 0; i<fNoArr.size(); i++) {
			str += fNoArr.get(i);
			if(i < fNoArr.size()-1) {
				str += ",";
			}
		}
		m.setFoodProductNo(str);
		
		m = (Menu)selectProduct(m);
		Image img = selectAllImageList(pNo, 4, 0).get(0);
		
		if(m != null) {
			model.addAttribute("fList1", fList1);
			model.addAttribute("fList2", fList2);
			model.addAttribute("m", m);
			model.addAttribute("img", img);
			return "adminMenuDetail";
		}else {
			throw new AdminException("메뉴 조회를 실패하였습니다.");
		}
	}
	@PostMapping("adminMenuUpdate.ad")
	public String adminMenuUpdate(@ModelAttribute Menu m,
								  @RequestParam("imageFile") MultipartFile imageFile,
								  HttpServletRequest request,
							 	  Model model) {
		AdminBasic ab = (AdminBasic) request.getAttribute("ab");
		int resultM1 = 0;
		int resultM2 = 0;
		int resultM3 = 0;
		int resultPd = 0;
		int resultImg = 1;
		int resultImgDel = 1;
		
		m.setProductOption("N");
		resultM1 = aService.updateMenu(m);
		resultM2 = aService.deleteMenuList(m);
		resultM3 = aService.insertMenuList(m);
		resultPd = aService.updateProduct(m);
		
		if(resultM1 + resultM2 + resultM3 + resultPd == (1+28+28+1) && imageFile != null && !imageFile.isEmpty()) {
			Image img = selectAllImageList(m.getProductNo(), 4, 0).get(0);
			deleteFile(img.getImageRenameName(), request);
			
//			DB서버 이미지 삭제
			resultImgDel = aService.deleteImage(img);
			
//			이미지 저장
			Image image = new Image();
			if(imageFile != null && !imageFile.isEmpty()) {
				String[] returnArr = saveFile(imageFile, request);
				if(returnArr[1] != null) {
					image = setImage(m.getProductNo(), 4, imageFile.getOriginalFilename(), returnArr[1], returnArr[0], 0);
				}
			}
			resultImg = aService.insertImage(image);
		}

		if(resultM1 + resultM2 + resultM3  + resultPd + resultImg + resultImgDel == (1+28+28+1+1+1)) {
			model = adminBasic(model, request, null);
			return "redirect:adminMenuManage.ad";
		}else {
			throw new AdminException("메뉴 수정에 실패하였습니다.");
		}
		
	}
	@GetMapping("adminMenuWrite.ad")
	public String adminMenuWrite(Model model) {
		PageInfo pi = new PageInfo();
		AdminBasic ab1 = new AdminBasic();
		AdminBasic ab2 = new AdminBasic();
		pi.setCurrentPage(1);
		pi.setBoardLimit(100000);
		ab1.setKind(1);
		ArrayList<Food> fList1 = aService.selectFoodList(pi, ab1); 
		ab2.setKind(2);
		ArrayList<Food> fList2 = aService.selectFoodList(pi, ab2); 
		if(fList1 != null && fList2 != null) {
			model.addAttribute("fList1", fList1);
			model.addAttribute("fList2", fList2);
			return "adminMenuWrite";
		}else {
			throw new AdminException("식단 등록 페이지 접속에 실패하였습니다.");
		}
	}
	@PostMapping("adminMenuInsert.ad")
	public String adminMenuInsert(@ModelAttribute Menu m,
								  @RequestParam("foodProductNo") String[] fPNo,
								  @RequestParam("imageFile") MultipartFile imageFile,
								  Model model,
								  HttpServletRequest request,
								  HttpSession session) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		Users user = (Users)session.getAttribute("loginUser");
		m.setUsersNo(user.getUsersNo());
		
		int resultPd = -1;
		int resultM = 0;
		int resultMl = 1;
		int resultImg = 0;
		
		m.setProductType(2);
		m.setProductOption("N");
		resultPd = aService.insertProduct(m);
		if(resultPd != 0) {
			resultM = aService.insertMenu(m);
			resultMl = aService.insertMenuList(m);
		}
		
//		insertMenu가 실패하지 않은 경우(!= 0)
		if(resultM != 0) {
//			이미지 저장
			Image image = new Image();
			if(imageFile != null && !imageFile.isEmpty()) {
				String[] returnArr = saveFile(imageFile, request);
				if(returnArr[1] != null) {
					image = setImage(resultPd, 4, imageFile.getOriginalFilename(), returnArr[1], returnArr[0], 0);
				}
			}
			resultImg = aService.insertImage(image);
		}
		
		if(resultPd != 0 && resultM != 0 && resultMl != 0 && resultImg != 0) {
			model = adminBasic(model, request, null);
			return "redirect:adminMenuManage.ad";
		}else {
			throw new AdminException("메뉴 등록에 실패하였습니다.");
		}
	}
	@GetMapping("adminGetFoodList.ad")
	public void adminGetFoodList(@ModelAttribute AdminBasic ab,
								 HttpServletResponse response) {
		
		PageInfo pi = new PageInfo();
		pi.setCurrentPage(1);
		pi.setBoardLimit(100000);
		
		ArrayList<Food> fList = aService.selectFoodList(pi, ab);
		
//		product정보 입력 메소드
		for(Food f: fList) {
			f = (Food)selectProduct(f);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();
		
		try {
			gson.toJson(fList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
		
	}
	@GetMapping("adminFoodSelector.ad")
	public void adminFoodSelector(@RequestParam("no") Integer no,
								  @RequestParam(value="type", required=false) Integer type,
				  				  HttpServletResponse response) {
		Food food = null;
//		type 	1: productNo
//				2: foodNo
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("no", no);
		map.put("type", type);
		
		if(no != 0) {
			food = aService.selectFood(map);
			food = (Food)selectProduct(food);
		}
		
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();
		try {
			gson.toJson(food, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	@GetMapping("adminFoodImageSelector.ad")
	public void adminFoodImageSelector(@RequestParam("no") int no,
									   HttpServletResponse response) {
		Image img = null; 
		if(no != 0) {
			img = selectAllImageList(no, 3, 0).get(0);
		}
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();
		try {
			gson.toJson(img, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	
//	Ingredient-식재료 관리
	@GetMapping("adminIngredientManage.ad")
	public String adminIngredientManage(HttpServletRequest request,
									 	Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		
		int listCount = aService.getIngredientCount(ab);
		
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Ingredient> igdList = aService.selectIngredientList(pi, ab);
		
//		product에 등록된 Ingredient에 한해 product정보 입력 메소드 실행
		for(int i = 0; i < igdList.size(); i++) {
			Ingredient igd = igdList.get(i);
			if( igd.getProductNo() > 0) {
				igd = (Ingredient)selectProduct(igd);
			}else {
				igd.setProductStatus("N");
			}
		}
		if(igdList != null) {
			model = adminBasic(model, request, pi);
			model.addAttribute("igdList", igdList);
			return "adminIngredientManage";
		}else {
			throw new AdminException("식재료 조회를 실패하였습니다.");
		}
	}
	@GetMapping("adminIngredientDetail.ad")
	public String adminIngredientDetail(@RequestParam("ingredientNo") int igdNo,
									 	Model model) {
		Ingredient igd = aService.selectIngredient(igdNo);
		ArrayList<Image> img = selectAllImageList(igdNo, 5, 0);
		
		if(igd.getProductNo() != 0) {
			igd = (Ingredient)selectProduct(igd);
		}
		if(igd != null) {
			model.addAttribute("igd", igd);
			model.addAttribute("img", img);
			return "adminIngredientDetail";
		}else {
			throw new AdminException("식재료 상세보기를 실패하였습니다.");
		}
		
	}
	@PostMapping("adminIngredientUpdate.ad")
	public String adminIngredientUpdate(@ModelAttribute Ingredient igd,
									 	@RequestParam("imageChange") String imageChange,
									 	@RequestParam("imageFile") MultipartFile imageFile,
										HttpServletRequest request,
									 	Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		
		int resultPd = -1;		// 선택사항이면서, ProductNo이 1일 수 있으므로 -1
		int resultIgd = 0;		// 필수사항이므로 0
		int resultImgDel = 1;	// 선택사항이므로 1
		int resultImgSave = 1;	// 선택사항이므로 1
//		상품등록한 적이 있다면(productNo != 0) (status 무관)
		if(igd.getProductNo() != 0) {
			resultPd = aService.updateProduct(igd);
//		상품등록한 적이 없지만(productNo == 0) Status가 Y일때
//		(새로 상품등록)
		}else if(igd.getProductNo() == 0 && igd.getProductStatus().equals("Y")) {
			igd.setProductType(3);
			igd.setProductOption("N");
			resultPd = aService.insertProduct(igd);
			igd.setProductNo(resultPd);
		}
		
		resultIgd = aService.updateIngredient(igd);
			
		if(resultPd != 0 && resultIgd != 0 && imageChange.equals("Y")) {
			
//			데이터 서버 이미지 삭제
			Image img = selectAllImageList(igd.getIngredientNo(), 5, 0).get(0);
			deleteFile(img.getImageRenameName(), request);
			
//			DB서버 이미지 삭제
			resultImgDel = aService.deleteImage(img);
			
//			이미지 저장
			Image image = new Image();
			if(imageFile != null && !imageFile.isEmpty()) {
				String[] returnArr = saveFile(imageFile, request);
				if(returnArr[1] != null) {
					image = setImage(igd.getIngredientNo(), 5, imageFile.getOriginalFilename(), returnArr[1], returnArr[0], 0);
				}
			}
			resultImgSave = aService.insertImage(image);
			
		}
		if(resultPd != 0 && resultIgd != 0 && resultImgDel != 0 && resultImgSave != 0) {
			model = adminBasic(model, request, null);
			return "redirect:adminIngredientManage.ad";
		}else {
			throw new AdminException("식재료 수정에 실패하였습니다.");
		}
	}
	@GetMapping("adminIngredientUpdateIsAccept.ad")
	public void adminIngredientUpdateIsAccept(@ModelAttribute Ingredient igd,
											  HttpServletResponse response) {
		int result = aService.ingredientUpdateIsAccept(igd);
		String msg = "msg";
		if(result > 0) {
			msg = "success";
		}else {
			msg = "fail";
		}
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();
		try {
			gson.toJson(msg, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
		
	}
	@GetMapping("adminIngredientWrite.ad")
	public String adminIngredientWrite() {
		return "adminIngredientWrite";
	}
	@PostMapping("adminIngredientInsert.ad")
	public String adminIngredientInsert(@ModelAttribute Ingredient igd,
										@RequestParam("imageFile") MultipartFile imageFile, 
										HttpServletRequest request,
										HttpSession session,
										Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		
		Users user = (Users)session.getAttribute("loginUser");
		igd.setUsersNo(user.getUsersNo());
		
		int resultPd = -1;
		int resultIgd = 0;
		int resultImg = 0;
		
		if(igd.getProductStatus().equals("Y")) {
			igd.setProductType(3);
			igd.setProductOption("N");
			resultPd = aService.insertProduct(igd);
		}
//		insertProduct가 실패하지 않은 경우 (!= 0)
		if(resultPd != 0) {
			resultIgd = aService.insertIngredient(igd);
		}
//		insertIngredient가 실패하지 않은 경우(!= 0)
		if(resultIgd != 0) {
//			이미지 저장
			Image image = new Image();
			if(imageFile != null && !imageFile.isEmpty()) {
				String[] returnArr = saveFile(imageFile, request);
				if(returnArr[1] != null) {
					image = setImage(resultIgd, 5, imageFile.getOriginalFilename(), returnArr[1], returnArr[0], 0);
				}
			}
			resultImg = aService.insertImage(image);
		}
		
		if(resultPd != 0 && resultIgd != 0 && resultImg != 0) {
			model = adminBasic(model, request, null);
			return "redirect:adminIngredientManage.ad";
		}else {
			throw new AdminException("식재료 등록에 실패하였습니다.");
		}
	}
	
	
//	Food-식품 관리
	@GetMapping("adminFoodManage.ad")
	public String adminFoodManage(HttpServletRequest request,
								  Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		
		int listCount = aService.getFoodCount(ab);
		
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Food> fList = aService.selectFoodList(pi, ab);
//		product정보 입력 메소드
		for(Food f: fList) {
			f = (Food)selectProduct(f);
		}
		if(fList != null) {
			model = adminBasic(model, request, pi);
			model.addAttribute("fList", fList);
			return "adminFoodManage";
		}else{
			throw new AdminException("식품 조회를 실패하였습니다.");
		}
	}
	@GetMapping("adminFoodDetail.ad")
	public String adminFoodDetail(@RequestParam("productNo") Integer pNo,
								  Model model) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("no", pNo);
		map.put("type", 1);
		
		Food f = aService.selectFood(map);
		ArrayList<Image> imgList = selectAllImageList(pNo, 3, -1);
		
		Image thumbnail = null;
		for(int i = 0; i<imgList.size(); i++) {
			if(imgList.get(i).getImageLevel()==0) {
				thumbnail = imgList.get(i);
				imgList.remove(i);
				break;
			}
		}
		
		f = (Food)selectProduct(f);
		if(f != null) {
			model.addAttribute("f", f);
			model.addAttribute("thumbnail", thumbnail);
			model.addAttribute("imgList", imgList);
			return "adminFoodDetail";
		}else {
			throw new AdminException("식품 상세보기를 실패하였습니다.");
		}
	}
	@PostMapping("adminFoodUpdate.ad")
	public String adminFoodUpdate(HttpServletRequest request,
								  Model model,
								  @ModelAttribute Food f,
								  @RequestParam("imageNo") ArrayList<Integer> imageNos,
								  @RequestParam("imageFile") ArrayList<MultipartFile> imageFiles) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		f.setFoodContent(f.getFoodContent()+"@"+f.getFoodTarget()+"@"+f.getFoodTable()+"@"+f.getNutrient());

		ArrayList<Image> oldImageList = selectAllImageList(f.getProductNo(), 5, -1);
		ArrayList<Image> newImageList = new ArrayList<Image>();
		
		int countNos = 0;
		int countImages = 0;
		for(int i:imageNos) {
			if(i == 0) {
				countNos++;
			}
		}
		for(MultipartFile imageFile: imageFiles) {
			if(imageFile != null && !imageFile.isEmpty()) {
				countImages++;
			}
		}
		if(countNos == countImages);
		System.out.println(imageNos);
		System.out.println(imageFiles);
		System.out.println(countNos);
		System.out.println(countImages);
		return "";
		
//		int resultF = aService.updateFood(f);
//		int resultPd = aService.updateProduct(f);
//		
//		if(resultF+resultPd == 2) {
//			model = adminBasic(model, request, null);
//			return "redirect:adminFoodManage.ad";
//		}else {
//			throw new AdminException("식품 수정에 실패하였습니다.");
//		}
	}
	@GetMapping("adminFoodDeleteable.ad")
	public void adminFoodDeleteable(@RequestParam("pNo") int pNo,
				  				    HttpServletResponse response) {

		ArrayList<String> mList = aService.deleteableFood(pNo);
		
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();
		try {
			gson.toJson(mList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	@GetMapping("adminFoodWrite.ad")
	public String adminFoodWrite() {
		return "adminFoodWrite";
	}
	@PostMapping("adminFoodInsert.ad")
	public String adminFoodInsert(HttpServletRequest request,
								  HttpSession session,
								  Model model,
								  @ModelAttribute Food f,
								  @RequestParam("imageFile") ArrayList<MultipartFile> imageFiles) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		
		Users user = (Users)session.getAttribute("loginUser");
		f.setUsersNo(user.getUsersNo());
		
//		foodContent값 합치기
		f.setFoodContent(f.getFoodContent()+"@"+f.getFoodTarget()+"@"+f.getFoodTable()+"@"+f.getNutrient());

//		food 기본값 설정
		f.setProductType(1);
		f.setProductOption("N");
		f.setProductStatus("Y");
		
		int resultPd = 0;
		int resultF = 0;
		int resultImg = 0;
		
		resultPd = aService.insertProduct(f);
		f.setProductNo(resultPd);
		
		resultF = aService.insertFood(f);
		int nowFoodNo = resultPd;
		
		if(resultPd != 0 && resultF != 0) {
			
//			이미지 저장
			int i = 0;
			for(MultipartFile imageFile: imageFiles) {
				Image image = new Image();
				if(imageFile != null && !imageFile.isEmpty()) {
					System.out.println(imageFile);
					String[] returnArr = saveFile(imageFile, request);
					if(returnArr[1] != null) {
						image = setImage(nowFoodNo, 3, imageFile.getOriginalFilename(), returnArr[1], returnArr[0], 1);
						if(i==0) {
							image.setImageLevel(0);
						}
						resultImg += aService.insertImage(image);
						i++;
					}
				}
			}
			if(resultImg == i ) {
				model = adminBasic(model, request, null);
				return "redirect:adminFoodManage.ad";
			}
		}
		throw new AdminException("식품 등록에 실패하였습니다.");
	}
	@GetMapping("adminGetFoodListNotD.ad")
	public void adminGetFoodListNotD(@ModelAttribute AdminBasic ab,
								 	 HttpServletResponse response) {
		
		PageInfo pi = new PageInfo();
		pi.setCurrentPage(1);
		pi.setBoardLimit(100000);
		
		ArrayList<Food> fList = aService.selectFoodListNotD(pi, ab);
		
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();
		
		try {
			gson.toJson(fList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	
//	Tool-도구 관리
	@GetMapping("adminToolManage.ad")
	public String adminToolManage(HttpServletRequest request,
			  					  Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");

		int listCount = aService.getToolCount(ab);
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Tool> tList = aService.selectToolList(pi, ab);
//		product정보 입력 메소드
		for(Tool t: tList) {
			t = (Tool)selectProduct(t);
		}
		if(tList != null) {
			model = adminBasic(model, request, pi);
			model.addAttribute("tList", tList);
			return "adminToolManage";
		}else{
			throw new AdminException("상품 조회를 실패하였습니다.");
		}
		
	}
	@GetMapping("adminToolDetail.ad")
	public String adminToolDetail(@RequestParam("productNo") int toolNo,
								  Model model) {
		Tool t = aService.selectTool(toolNo);
		t = (Tool)selectProduct(t);
		ArrayList<Image> imgList = selectAllImageList(toolNo, 6, -1);

//		옵션이 없는 경우(opList == null)를 페이지에서 조건으로 사용함
		ArrayList<Options> opList = aService.selectOptions(toolNo);

		Image thumbnail = null;
		for(int i = 0; i<imgList.size(); i++) {
			if(imgList.get(i).getImageLevel()==0) {
				thumbnail = imgList.get(i);
				imgList.remove(i);
				break;
			}
		}
		
		if(t != null) {
			model.addAttribute("t", t);
			model.addAttribute("thumbnail", thumbnail);
			model.addAttribute("imgList", imgList);
			model.addAttribute("opList", opList);
			return "adminToolDetail";
		}else {
			throw new AdminException("식품 상세보기를 실패하였습니다.");
		}
	}
	@PostMapping("adminToolUpdate.ad")
	public String adminToolUpdate(HttpServletRequest request,
								  Model model,
								  @ModelAttribute Tool t,
								  @RequestParam("imageFile") ArrayList<MultipartFile> imageFiles) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		
		int resultPd = 0;
		int resultT = 0;
		int resultOpDel = 0;
		int resultOpIn = 0;
		int resultImgDel = 0;
		int resultImgIn = 0;
		int upImageCount = 0;
		System.out.println(t);
		resultPd = aService.updateProduct(t);
		
		resultT = aService.updateTool(t);
		
		if(t.getProductOption().equals("Y") && t.getOptionTotal() != null) {
			String[] delList = {t.getProductNo()+""};
			resultOpDel = aService.deletesOptions(delList);
			
			ArrayList<Options> oList = new ArrayList<Options>();
			for(String op:t.getOptionTotal()) {
				for(int i = 1; i<op.split("@").length; i++) {
					Options option = new Options();
					option.setProductNo(t.getProductNo());
					option.setOptionName(op.split("@")[0]);
					option.setOptionValue(op.split("@")[i]);
					oList.add(option);
				}
			}
			
			resultOpIn = aService.insertOptions(oList);
		}
			
		if(resultPd + resultT + resultOpDel + resultOpIn >= (1+1+0+1)) {
			
			for(int i = 0; i < imageFiles.size(); i++) {
				if(imageFiles.get(i) != null && !imageFiles.get(i).isEmpty()) {
					upImageCount++;
//					데이터 서버 이미지 삭제
					Image img = selectAllImageList(t.getProductNo(), 6, (i == 0 ? 0 : 1 )).get(0);
					
					int delImgLevel = img.getImageLevel();
					
					deleteFile(img.getImageRenameName(), request);
							
//					DB서버 이미지 삭제
					resultImgDel += aService.deleteImage(img);
					
//					이미지 저장
					Image image = new Image();
					String[] returnArr = saveFile(imageFiles.get(i), request);
					if(returnArr[1] != null) {
						image = setImage(t.getProductNo(), 6, imageFiles.get(i).getOriginalFilename(), returnArr[1], returnArr[0], delImgLevel);
					}
					
					resultImgIn += aService.insertImage(image);
			
				}
			}
			if((resultPd + resultT + resultOpDel + resultOpIn >= (1+1+0+1)) 
					&& resultImgDel == resultImgIn 
					&& resultImgIn == upImageCount) {
				model = adminBasic(model, request, null);
				return "redirect:adminToolManage.ad";
			}else {
				throw new AdminException("상품 수정에 실패하였습니다.");
			}
		}else {
			throw new AdminException("상품 수정에 실패하였습니다.");
		}
	}
	@GetMapping("adminToolWrite.ad")
	public String adminToolWrite() {
		return "adminToolWrite";
	}
	@PostMapping("adminToolInsert.ad")
	public String adminToolInsert(HttpServletRequest request,
								  HttpSession session,
								  Model model,
								  @ModelAttribute Tool t,
								  @RequestParam("imageFile") ArrayList<MultipartFile> imageFiles) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		
		Users user = (Users)session.getAttribute("loginUser");
		t.setUsersNo(user.getUsersNo());
		
		t.setProductType(4);
		
		int resultPd = 0;
		int resultT = 0;
		int resultOp = 0;
		int resultImg = 0;
		
		resultPd = aService.insertProduct(t);
		t.setProductNo(resultPd);
		
		resultT = aService.insertTool(t);
		int nowToolNo = resultPd;
		
		ArrayList<Options> oList = new ArrayList<Options>();
		for(String op:t.getOptionTotal()) {
			for(int i = 1; i<op.split("@").length; i++) {
				Options option = new Options();
				option.setProductNo(nowToolNo);
				option.setOptionName(op.split("@")[0]);
				option.setOptionValue(op.split("@")[i]);
				oList.add(option);
			}
		}
		resultOp = aService.insertOptions(oList);
		
		if(resultPd != 0 && resultT != 0 && resultOp == oList.size()) {
			
//			이미지 저장
			int i = 0;
			for(MultipartFile imageFile: imageFiles) {
				if(imageFile != null && !imageFile.isEmpty()) {
					String[] returnArr = saveFile(imageFile, request);
					if(returnArr[1] != null) {
						Image image = setImage(nowToolNo, 6, returnArr[0], imageFile.getOriginalFilename(), returnArr[1], 1);
						if(i==0) {
							image.setImageLevel(0);
						}
						resultImg += aService.insertImage(image);
						i++;
					}
				}
			}
			if(resultImg == i) {
				model = adminBasic(model, request, null);
				return "redirect:adminToolManage.ad";
			}
		}
		throw new AdminException("식품 등록에 실패하였습니다.");
	}
	

//	Recipe-레시피
	@GetMapping("adminRecipeManage.ad")
	public String adminRecipeManage(HttpServletRequest request,
									Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");

		int listCount = aService.getRecipeCount(ab);
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Recipe> rpList = aService.selectRecipeList(pi, ab);
		
		if(rpList != null) {
			model = adminBasic(model, request, pi);
			model.addAttribute("rpList", rpList);
			return "adminRecipeManage";
		}else {
			throw new AdminException("레시피 목록 조회에 실패하였습니다.");
		}
	}
	@GetMapping("adminRecipeDetail.ad")
	public String adminRecipeDetail(Model model,
									HttpSession session,
									@ModelAttribute Recipe r) {
		Users user = (Users)session.getAttribute("loginUser");
		
		model.addAttribute("rId", user.getUsersId());
		model.addAttribute("rNo", r.getFoodNo());
		return "redirect:recipeDetail.rc";
	}
	@GetMapping("adminRecipeWrite.ad")
	public String adminRecipeWrite() {
		return "redirect:recipeWrite.rc";
	}

	
//	Board-게시판
	@GetMapping("adminBoardManage.ad")
	public String adminBoardManage(HttpServletRequest request,
								   Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");

		int listCount = aService.getBoardCount(ab);
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Board> bList = aService.selectBoardList(pi, ab);
		
		if(bList != null) {
			model = adminBasic(model, request, pi);
			model.addAttribute("bList", bList);
			return "adminBoardManage";
		}else {
			throw new AdminException("게시글 목록 조회에 실패하였습니다.");
		}
	}
	@GetMapping("adminBoardDetail.ad")
	public String adminBoardDetail(@ModelAttribute Board board,
								   Model model) {
		AdminBasic ab = new AdminBasic();
		ab.setKind(-1);
		ab.setNumber(board.getBoardNo());
		ab.setDuplication("Y");
		Board b = aService.selectBoard(board.getBoardNo());
		ArrayList<Review> rList = aService.selectReviewList(null, ab);
		
		if(b != null) {
			model.addAttribute("b", b);
			model.addAttribute("rList", rList);
			return "adminBoardDetail";
		}else{
			throw new AdminException("게시글 상세보기에 실패하였습니다.");
		}
	}
	
	
//	Review-리뷰
	@GetMapping("adminReviewManage.ad")
	public String adminReviewManage(HttpServletRequest request,
									Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		int listCount = aService.getReviewCount(ab);
		
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Review> rList = aService.selectReviewList(pi, ab);
		
		if(rList != null) {
			model = adminBasic(model, request, pi);
			model.addAttribute("rList", rList);
			return "adminReviewManage";
		}else {
			throw new AdminException("게시글 목록 조회에 실패하였습니다.");
		}
	}
	@GetMapping("adminSelectReview.ad")
	public void adminSelectReview(@RequestParam("rNo") Integer rNo,
								  HttpServletResponse response) {
		
		Review r = aService.selectReview(rNo);
		
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();
		try {
			gson.toJson(r, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	@GetMapping("adminSelectReviewImage.ad")
	public void adminSelectReviewImage(@RequestParam("rNo") Integer rNo,
									   HttpServletResponse response) {
		
		ArrayList<Image> iList = selectAllImageList(rNo, 7, -1);
		
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();
		try {
			gson.toJson(iList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	
//	FAQ-자주묻는질문
	@GetMapping("adminFAQManage.ad")
	public String adminFAQManage(HttpServletRequest request,
								 Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		int listCount = aService.getFAQCount(ab);
		
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<FAQ> faqList = aService.selectFAQList(pi, ab);
		
		if(faqList != null) {
			model = adminBasic(model, request, pi);
			model.addAttribute("faqList", faqList);
			return "adminFAQManage";
		}else {
			throw new AdminException("자주묻는질문 목록 조회에 실패하였습니다.");
		}
	}
	@GetMapping("adminFAQDetail.ad")
	public String adminFAQDetail(@RequestParam("faqNo")Integer faqNo,
								 Model model) {
		
		FAQ faq = aService.selectFAQ(faqNo);
		
		if(faq != null) {
			model.addAttribute("faq", faq);
			return "adminFAQDetail";
		}else{
			throw new AdminException("FAQ 상세보기에 실패하였습니다.");
		}
	}
	@PostMapping("adminFAQUpdate.ad")
	public String adminFAQUpdate(@ModelAttribute FAQ faq,
								 HttpServletRequest request,
								 Model model) {
		
		int result = aService.updateFAQ(faq);
		
		if(result > 0) {
			model = adminBasic(model, request, null);
			return "redirect:adminFAQManage.ad";
		}else {
			throw new AdminException("FAQ 업데이트에 실패하였습니다.");
		}
		
		
	}
	@GetMapping("adminFAQWrite.ad")
	public String adminFAQWrite() {
		return "adminFAQWrite";
	}
	@PostMapping("adminFAQInsert.ad")
	public String adminFAQInsert(@ModelAttribute FAQ faq,
								 HttpServletRequest request,
								 Model model) {
		
		Users user = (Users)request.getSession().getAttribute("loginUser");
		faq.setUsersNo(user.getUsersNo());
		
		int result = aService.insertFAQ(faq);
		
		if(result > 0) {
			model = adminBasic(model, request, null);
			return "redirect:adminFAQManage.ad";
		}else {
			throw new AdminException("FAQ 게시글 등록에 실패하였습니다.");
		}
		
	}


//	QNA-1:1문의	
	@GetMapping("adminQNAManage.ad")
	public String adminQNAManage(HttpServletRequest request,
								 Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		int listCount = aService.getQNACount(ab);
		
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<QNA> qnaList = aService.selectQNAList(pi, ab);
		
		if(qnaList != null) {
			model = adminBasic(model, request, pi);
			model.addAttribute("qnaList", qnaList);
			return "adminQNAManage";
		}else {
			throw new AdminException("1:1문의 목록 조회에 실패하였습니다.");
		}
	}
	@GetMapping("adminQNADetail.ad")
	public String adminQNADetail(@RequestParam("qnaNo")Integer qnaNo,
								 Model model) {
		
		QNA qna = aService.selectQNA(qnaNo);
		
		if(qna != null) {
			model.addAttribute("qna", qna);
			return "adminQNADetail";
		}else{
			throw new AdminException("QNA 상세보기에 실패하였습니다.");
		}
	}
	@PostMapping("adminQNAUpdate.ad")
	public String adminQNAUpdate(@ModelAttribute QNA qna,
								 HttpServletRequest request,
								 Model model) {
		qna.setAdminNo(((Users)request.getSession().getAttribute("loginUser")).getUsersNo());
		int result = aService.updateQNA(qna);
		
		if(result > 0) {
			model = adminBasic(model, request, null);
			return "redirect:adminQNAManage.ad";
		}else {
			throw new AdminException("QNA 업데이트에 실패하였습니다.");
		}
		
	}

	
//	Healther-영양사
	@GetMapping("adminHealtherDetail.ad")
	public String adminHealtherDetail(HttpSession session,
									  Model model) {
		int uNo = ((Users)session.getAttribute("loginUser")).getUsersNo();
		Healther h = aService.selectHealther(uNo);
		
		ArrayList<Image> imgList = selectAllImageList(uNo, 8, -1);
		Image img = null;
		if(!imgList.isEmpty()) {
			img = imgList.get(0);
		}
		
		model.addAttribute("h", h);
		model.addAttribute("img", img);
		return "adminHealtherDetail";
	}
	@PostMapping("adminHealtherInsert.ad")
	public String adminHealtherInsert(@ModelAttribute Healther h,
									  @RequestParam("imageFile") MultipartFile imageFile,
									  HttpServletRequest request) {
		int resultImg = 0; 
		int result = aService.insertHealther(h);
		System.out.println(h);
		
		if(result > 0) {
//			이미지 저장
			Image image = new Image();
			if(imageFile != null && !imageFile.isEmpty()) {
				String[] returnArr = saveFile(imageFile, request);
				if(returnArr[1] != null) {
					image = setImage(h.getUsersNo(), 8, imageFile.getOriginalFilename(), returnArr[1], returnArr[0], 0);
				}
			}
			resultImg = aService.insertImage(image);
		}
		
		if(resultImg > 0) {
			return "redirect:adminMenuManage.ad";
		}else {
			throw new AdminException("영양사 정보 입력에 실패하였습니다.");
		}
	}
	@PostMapping("adminHealtherUpdate.ad")
	public String adminHealtherUpdate(@ModelAttribute Healther h,
									  @RequestParam("imageFile") MultipartFile imageFile,
									  HttpServletRequest request) {
		System.out.println(h);
		int result = aService.updateHealther(h);
		int resultImgDel = 1;
		int resultImg = 1;
//		이미지 변경저장
		if(h.getImageChange().equals("Y")) {
//			데이터 서버 이미지 삭제
			Image img = selectAllImageList(h.getUsersNo(), 8, 0).get(0);
			deleteFile(img.getImageRenameName(), request);
			
//			DB서버 이미지 삭제
			resultImgDel = aService.deleteImage(img);
			
			if(resultImgDel > 0) {
//				이미지 저장
				Image image = new Image();
				if(imageFile != null && !imageFile.isEmpty()) {
					String[] returnArr = saveFile(imageFile, request);
					if(returnArr[1] != null) {
						image = setImage(h.getUsersNo(), 8, imageFile.getOriginalFilename(), returnArr[1], returnArr[0], 0);
					}
				}
				resultImg = aService.insertImage(image);
			}
		}
		
		if(result > 0 && resultImgDel > 0 && resultImg > 0) {
			return "redirect:adminMenuManage.ad";
		}else {
			throw new AdminException("영양사 정보 수정에 실패하였습니다.");
		}
	}
	
	
//	공용
	public Model adminBasic(Model model, HttpServletRequest request, PageInfo pi) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		if(pi != null) {
			model.addAttribute("pi", pi);
		}
		model.addAttribute("page", ab.getPage());
		model.addAttribute("pageCount", ab.getPageCount());
		model.addAttribute("searchType", ab.getSearchType());
		model.addAttribute("searchText", ab.getSearchText());
		model.addAttribute("type", ab.getType());
		model.addAttribute("kind", ab.getKind());
		return model;
	}
	
	@GetMapping("adminUpdateStatus.ad")
	public void adminUpdateStatus(@RequestParam("dataNo") String dataNo,
								  @RequestParam("dataStatus") String dataStatus,
								  @RequestParam("dataType") String dataType,
								  HttpServletResponse response) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("dataNo", dataNo);
		map.put("dataStatus", dataStatus);
		map.put("dataType", dataType);
//		dataType = 
//		1	-> product	status 업데이트(food)
//		2	-> product	status 업데이트(menu)
//		3	-> product	status 업데이트(ingredient)
//		4	-> product	status 업데이트(tool)
//		5	-> users	status 업데이트
//		6	-> recipe	status 업데이트
//		7	-> review	status 업데이트
//		8	-> board	status 업데이트
//		9	-> faq		status 업데이트
//		10	-> qna		status 업데이트
		
		int result = aService.updateStatus(map);
		String msg = "msg";
		if(result > 0) {
			msg = "success";
		}else {
			msg = "fail";
		}
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();
		try {
			gson.toJson(msg, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	public String[] saveFile(MultipartFile file, HttpServletRequest request) {
//		파일 저장소 지정
		String root = request.getSession().getServletContext().getRealPath("resources");	// webapp-resources 폴더 의미
//								  ┌ String에서 역슬래쉬를 표현하기 위해 '\\' 라고 적음  
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
//		파일 이름 변경 형식 지정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum 
								+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
//		변경된 이름의 파일을 저장
		String renamePath = folder + "\\" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String[] returnArr = new String[2];
		returnArr[0] = savePath;
		returnArr[1] = renameFileName;
		
		return returnArr; 
	}

	private void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}
	}
	
	private Product selectProduct(Product p) {
		Product pd = aService.selectProduct(p.getProductNo());
		if(pd != null) {
			p.setProductType(pd.getProductType());
			p.setProductPrice(pd.getProductPrice());
			p.setProductOption(pd.getProductOption());
			p.setProductStock(pd.getProductStock());
			p.setProductCreateDate(pd.getProductCreateDate());
			p.setProductModifyDate(pd.getProductModifyDate());
			p.setProductSale(pd.getProductSale());
			p.setProductCount(pd.getProductCount());
			p.setProductStatus(pd.getProductStatus());
		}
		Product pd2 = aService.selectProductCount(p.getProductNo());
		if(pd2 != null) {
			p.setOrderCount(pd2.getOrderCount());
			p.setLikeCount(pd2.getLikeCount());
		}
		return p;
	}

	private ArrayList<Image> selectAllImageList(int imageDivideNo, int imageType, int imageLevel) {
//		모든 imageLevel	-> 	imageLevel = -1		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("imageDivideNo", imageDivideNo);
		map.put("imageType", imageType);
		map.put("imageLevel", imageLevel);
		ArrayList<Image> imageList = aService.selectAllImageList(map);
		return imageList;
	}
	
	private Image setImage(int imageDivideNo, int imageType, String imageOriginalName, String imageRenameName, String imagePath, int imageLevel) {
		Image image = new Image();
		image.setImageDivideNo(imageDivideNo);
		image.setImageType(imageType);
		image.setImageOriginalName(imageOriginalName);
		image.setImageRenameName(imageRenameName);
		image.setImagePath(imagePath);
		image.setImageLevel(imageLevel);
		return image;
	}
	
	
}
