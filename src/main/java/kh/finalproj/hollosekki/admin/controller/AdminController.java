package kh.finalproj.hollosekki.admin.controller;

import java.io.File;
import java.io.IOException;
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
import kh.finalproj.hollosekki.common.Pagination;
import kh.finalproj.hollosekki.common.model.vo.Food;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.Options;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Point;
import kh.finalproj.hollosekki.common.model.vo.Product;
import kh.finalproj.hollosekki.common.model.vo.Review;
import kh.finalproj.hollosekki.common.model.vo.Tool;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	@GetMapping("adminMain.ad")
	public String adminMain(Model model) {
//		ArrayList<AdminMain> amList = aService.adminMainWeek();
		return "adminMain";
	}
	
//	sales-留ㅼ텧 愿�由�
	@GetMapping("adminSalesManage.ad")
	public String adminSalesManage() {
		return "adminSalesManage";
	}
	@GetMapping("adminSalesDaily.ad")
	public String adminSalesDaily() {
		return "adminSalesDaily";
	}
	@GetMapping("adminSalesDetail.ad")
	public String adminSalesDetail() {
		return "adminSalesDetail";
	}
	
	
//	order-二쇰Ц 愿�由�
	@GetMapping("adminOrderManage.ad")
	public String adminOrderManage() {
		return "adminOrderManage";
	}
	@GetMapping("adminOrderDetail.ad")
	public String adminOrderDetail() {
		return "adminOrderDetail";
	}
	@PostMapping("adminOrderUpdate.ad")
	public String adminOrderUpdate() {
		return "redirect:adminOrderManage.ad";
	}
	
	
//	Users-�쉶�썝 愿�由�
	@GetMapping("adminUsersManage.ad")
	public String adminUsersManage(
//								   @ModelAttribute AdminBasic ab,
//								   HttpSession session,
//								   @RequestAttribute("ab") AdminBasic ab,
								   HttpServletRequest request,
								   Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		
		int listCount = aService.getUsersCount(ab);
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Users> uList = aService.selectUsersList(pi, ab);

		if(uList != null) {
			model.addAttribute("pi", pi);
//			model.addAttribute("ab", ab);
			model.addAttribute("uList", uList);
			return "adminUsersManage";
		}else {
			throw new AdminException("�떇�옱猷� 議고쉶瑜� �떎�뙣�븯���뒿�땲�떎.");
		}
	}
	@GetMapping("adminUsersDetail.ad")
	public String adminUsersDetail(
//			@ModelAttribute AdminBasic ab,
								   @RequestParam("usersNo") int uNo,
								   @RequestParam(value="uri", required=false) String uri,
							 	   Model model) {
		Users u = aService.selectUsers(uNo);
//		HashMap<String, Integer> map = new HashMap<String, Integer>();
//		map.put("imageDivideNo", uNo);
//		map.put("imageType", 1);
//		ArrayList<Image> img = aService.selectAllImageList(map);
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
//			model.addAttribute("ab", ab);
			model.addAttribute("u", u);
			model.addAttribute("img", img);
			model.addAttribute("uri", uri);
			return "adminUsersDetail";
		}else {
			throw new AdminException("�쉶�썝 �긽�꽭議고쉶�뿉 �떎�뙣�븯���뒿�땲�떎.");
		}
	}
	@PostMapping("adminUsersUpdate.ad")
	public String adminUsersUpdate(HttpServletRequest request,
								   Model model,
								   @ModelAttribute Users u,
								   @ModelAttribute Point p,
//								   @RequestParam(value="page", required=false) Integer page,
								   @RequestParam(value="uri", required=false) String uri) {
		AdminBasic ab = (AdminBasic) request.getAttribute("ab");
		if(u.getPhone() != null) {
			u.setPhone(u.getPhone().replace(",", ""));
		}
		
		p.setPointType(2);
		p.setPointChange(p.getPoint() - p.getPointBefore());
		
		int resultU = aService.updateUsers(u, p);
		if(resultU == 2) {
			model.addAttribute("page", ab.getPage());
			model.addAttribute("searchType", ab.getSearchType());
			model.addAttribute("searchText", ab.getSearchText());
			if(uri.equals("")) {
				return "redirect:adminUsersManage.ad";
			}else {
				return "redirect:"+uri;
			}
		}else {
			throw new AdminException("usersUpdate�뿉 �떎�뙣�븯���뒿�땲�떎.");
		}
	}
	
	
//	Point-�룷�씤�듃 愿�由�
	@GetMapping("adminPointManage.ad")
	public String adminPointManage(
//			@ModelAttribute AdminBasic ab,
								   HttpServletRequest request,
								   HttpSession session,
							 	   Model model) {
		AdminBasic ab = (AdminBasic) request.getAttribute("ab");
		String uri = request.getServletPath();
		
		int listCount = aService.getPointCount(ab);
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Point> pointList = aService.selectPointList(pi, ab);
		
		if(pointList != null) {
			model.addAttribute("pi", pi);
//			model.addAttribute("ab", ab);
			model.addAttribute("pointList", pointList);
			model.addAttribute("uri", uri);
			return "adminPointManage";
		}else {
			throw new AdminException("�룷�씤�듃愿�由� �럹�씠吏� 濡쒕뱶�뿉 �떎�뙣�븯���뒿�땲�떎.");
		}
	}
	
	
//	Menu-�떇�떒 愿�由�
	@GetMapping("adminMenuManage.ad")
	public String adminMenuManage(
//			@ModelAttribute AdminBasic ab,
								  HttpServletRequest request,
							 	  Model model) {
		AdminBasic ab = (AdminBasic) request.getAttribute("ab");
//		ab = adminBasic(ab, session);
		
		int listCount = aService.getMenuCount(ab);
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Menu> mList = aService.selectMenuList(pi, ab);
		for(int i = 0; i < mList.size(); i++) {
			Menu m = mList.get(i);
			m = (Menu)selectProduct(m);
		}
		if(mList != null) {
			model.addAttribute("pi", pi);
//			model.addAttribute("ab", ab);
			model.addAttribute("mList", mList);
			return "adminMenuManage";
		}else {
			throw new AdminException("�떇�떒 議고쉶瑜� �떎�뙣�븯���뒿�땲�떎.");
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
		ab1.setKind(1);  // 硫붿씤硫붾돱
		ab1.setType(m.getMenuType());  // �떇�옱猷�/諛��궎�듃 ���엯
		ab2.setKind(2);  // �꽌釉뚮찓�돱
		ab2.setType(m.getMenuType());  // �떇�옱猷�/諛��궎�듃 ���엯
		ArrayList<Food> fList1 = aService.selectFoodList(pi, ab1); 
		ArrayList<Food> fList2 = aService.selectFoodList(pi, ab2); 
		
//		ab.setKind(0);
		ArrayList<String> fNoArr = aService.selectFoodProductNo(pNo);
		String str = "";
		for(int i = 0; i<fNoArr.size(); i++) {
			str += fNoArr.get(i);
			if(i < fNoArr.size()-1) {
				str += ",";
			}
		}
		m.setFoodProductNo(str);
		
		m = (Menu)selectProduct(m);
		Image img = selectAllImageList(pNo, 4, 1).get(0);
		
		if(m != null) {
			model.addAttribute("fList1", fList1);
			model.addAttribute("fList2", fList2);
			model.addAttribute("m", m);
			model.addAttribute("img", img);
			return "adminMenuDetail";
		}else {
			throw new AdminException("硫붾돱 議고쉶瑜� �떎�뙣�븯���뒿�땲�떎.");
		}
	}
	@PostMapping("adminMenuUpdate.ad")
	public String adminMenuUpdate(
//			@ModelAttribute AdminBasic ab,
								  @ModelAttribute Menu m,
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
//			�뜲�씠�꽣 �꽌踰� �씠誘몄� �궘�젣
//			HashMap<String, Integer> map = new HashMap<String, Integer>();
//			map.put("imageDivideNo", m.getProductNo());
//			map.put("imageType", 4);
//			Image img = aService.selectAllImageList(map).get(0);
			Image img = selectAllImageList(m.getProductNo(), 4, 1).get(0);
			deleteFile(img.getImageRenameName(), request);
			
//			DB�꽌踰� �씠誘몄� �궘�젣
			resultImgDel = aService.deleteImage(img);
			
//			�씠誘몄� ���옣
			Image image = new Image();
			if(imageFile != null && !imageFile.isEmpty()) {
				String[] returnArr = saveFile(imageFile, request);
				if(returnArr[1] != null) {
//					image.setImageDivideNo(m.getProductNo());
//					image.setImageType(4);
//					image.setImagePath(returnArr[0]);
//					image.setImageOriginalName(imageFile.getOriginalFilename());
//					image.setImageRenameName(returnArr[1]);
//					image.setImageLevel(1);
					image = setImage(m.getProductNo(), 4, imageFile.getOriginalFilename(), returnArr[1], returnArr[0], 1);
				}
			}
			resultImg = aService.insertImage(image);
		}

		if(resultM1 + resultM2 + resultM3  + resultPd + resultImg + resultImgDel == (1+28+28+1+1+1)) {
//			model.addAttribute("ab", ab);
			model.addAttribute("page", ab.getPage());
			model.addAttribute("searchType", ab.getSearchType());
			model.addAttribute("searchText", ab.getSearchText());
			return "redirect:adminMenuManage.ad";
		}else {
			throw new AdminException("硫붾돱 �닔�젙�뿉 �떎�뙣�븯���뒿�땲�떎.");
		}
		
	}
	@PostMapping("adminMenuDeletes.ad")
	public String adminMenuDeletes(@RequestParam("selectDelete") String[] selDeletes,
								   HttpServletRequest request,
								   Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		int resultImg = 0;
		int resultM = 0;
		int resultPd = 0;
		
		ArrayList<Image> imgList = null;
		for(int i = 0; i < selDeletes.length; i++) {
//			�뜲�씠�꽣 �꽌踰� �씠誘몄� �궘�젣
//			HashMap<String, Integer> map = new HashMap<String, Integer>();
//			map.put("imageDivideNo", Integer.parseInt(selDeletes[i]));
//			map.put("imageType", 4);
//			imgList = aService.selectAllImageList(map);
			imgList = selectAllImageList(Integer.parseInt(selDeletes[i]), 4, 0);
			
			for(Image img:imgList) {
				deleteFile(img.getImageRenameName(), request);
//				DB�꽌踰� �씠誘몄� �궘�젣
				resultImg += aService.deleteImage(img);
			}
		}
		
//		resultM = aService.deletesMenu(selDeletes);
		resultPd = aService.deletesProduct(selDeletes);
		
		if(resultImg == imgList.size() && resultM == selDeletes.length && resultPd == selDeletes.length) {
			model.addAttribute("page", ab.getPage());
			model.addAttribute("searchType", ab.getSearchType());
			model.addAttribute("searchText", ab.getSearchText());
			return "redirect:adminFoodManage.ad";
		}else {
			throw new AdminException("�떇�옱猷� �궘�젣 �떎�뙣");
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
			throw new AdminException("�떇�떒 �벑濡� �럹�씠吏� �젒�냽�뿉 �떎�뙣�븯���뒿�땲�떎.");
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
		int resultMl = 0;
		int resultImg = 0;
		
		m.setProductType(2);
		m.setProductOption("N");
		resultPd = aService.insertProduct(m);
		if(resultPd != 0) {
			resultM = aService.insertMenu(m);
			resultMl = aService.insertMenuList(m);
		}
		
//		insertMenu媛� �떎�뙣�븯吏� �븡�� 寃쎌슦(!= 0)
		if(resultM != 0) {
//			�씠誘몄� ���옣
			Image image = new Image();
			if(imageFile != null && !imageFile.isEmpty()) {
				String[] returnArr = saveFile(imageFile, request);
				if(returnArr[1] != null) {
					image = setImage(resultPd, 4, imageFile.getOriginalFilename(), returnArr[1], returnArr[0], 1);
				}
			}
			resultImg = aService.insertImage(image);
		}
		
		if(resultPd != 0 && resultM != 0 && resultImg != 0) {
			model.addAttribute("page", ab.getPage());
			model.addAttribute("searchType", ab.getSearchType());
			model.addAttribute("searchText", ab.getSearchText());
			return "redirect:adminMenuManage.ad";
		}else {
			throw new AdminException("硫붾돱 �벑濡앹뿉 �떎�뙣�븯���뒿�땲�떎.");
		}
	}
	@GetMapping("adminGetFoodList.ad")
	public void adminGetFoodList(@ModelAttribute AdminBasic ab,
								 HttpServletResponse response) {
		
		PageInfo pi = new PageInfo();
		pi.setCurrentPage(1);
		pi.setBoardLimit(100000);
		
		ArrayList<Food> fList = aService.selectFoodList(pi, ab);
		
//		product�젙蹂� �엯�젰 硫붿냼�뱶
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
		
		System.out.println(map);
		System.out.println(food);
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
//			HashMap<String, Integer> map = new HashMap<String, Integer>();
//			map.put("imageDivideNo", pNo);
//			map.put("imageType", 3);
//			map.put("imageLevel", 1);
//			img = aService.selectAllImageList(map).get(0);
			img = selectAllImageList(no, 3, 1).get(0);
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
	
	
//	Ingredient-�떇�옱猷� 愿�由�
	@GetMapping("adminIngredientManage.ad")
	public String adminIngredientManage(
//			@ModelAttribute AdminBasic ab,
										HttpServletRequest request,
									 	Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		
		int listCount = aService.getIngredientCount(ab);
		
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Ingredient> igdList = aService.selectIngredientList(pi, ab);
		
//		product�뿉 �벑濡앸맂 Ingredient�뿉 �븳�빐 product�젙蹂� �엯�젰 硫붿냼�뱶 �떎�뻾
		for(int i = 0; i < igdList.size(); i++) {
			Ingredient igd = igdList.get(i);
			if( igd.getProductNo() > 0) {
				igd = (Ingredient)selectProduct(igd);
			}else {
				igd.setProductStatus("N");
			}
		}
		if(igdList != null) {
			model.addAttribute("pi", pi);
//			model.addAttribute("ab", ab);
			model.addAttribute("igdList", igdList);
			return "adminIngredientManage";
		}else {
			throw new AdminException("�떇�옱猷� 議고쉶瑜� �떎�뙣�븯���뒿�땲�떎.");
		}
	}
	@GetMapping("adminIngredientDetail.ad")
	public String adminIngredientDetail(
//			@ModelAttribute AdminBasic ab,
									 	@RequestParam("ingredientNo") int igdNo,
									 	Model model) {
		Ingredient igd = aService.selectIngredient(igdNo);
//		HashMap<String, Integer> map = new HashMap<String, Integer>();
//		map.put("imageDivideNo", igdNo);
//		map.put("imageType", 5);
//		ArrayList<Image> img = aService.selectAllImageList(map);
		ArrayList<Image> img = selectAllImageList(igdNo, 5, 0);
		
		if(igd.getProductNo() != 0) {
			igd = (Ingredient)selectProduct(igd);
		}
		if(igd != null) {
//			model.addAttribute("ab", ab);
			model.addAttribute("igd", igd);
			model.addAttribute("img", img);
			return "adminIngredientDetail";
		}else {
			throw new AdminException("�떇�옱猷� �긽�꽭蹂닿린瑜� �떎�뙣�븯���뒿�땲�떎.");
		}
		
	}
	@PostMapping("adminIngredientUpdate.ad")
	public String adminIngredientUpdate(
//			@ModelAttribute AdminBasic ab,
									 	@ModelAttribute Ingredient igd,
									 	@RequestParam("imageChange") String imageChange,
									 	@RequestParam("imageFile") MultipartFile imageFile,
										HttpServletRequest request,
									 	Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		
		int resultPd = -1;		// �꽑�깮�궗�빆�씠硫댁꽌, ProductNo�씠 1�씪 �닔 �엳�쑝誘�濡� -1
		int resultIgd = 0;		// �븘�닔�궗�빆�씠誘�濡� 0
		int resultImgDel = 1;	// �꽑�깮�궗�빆�씠誘�濡� 1
		int resultImgSave = 1;	// �꽑�깮�궗�빆�씠誘�濡� 1
//		�긽�뭹�벑濡앺븳 �쟻�씠 �엳�떎硫�(productNo != 0) (status 臾닿�)
		if(igd.getProductNo() != 0) {
			resultPd = aService.updateProduct(igd);
//		�긽�뭹�벑濡앺븳 �쟻�씠 �뾾吏�留�(productNo == 0) Status媛� Y�씪�븣
//		(�깉濡� �긽�뭹�벑濡�)
		}else if(igd.getProductNo() == 0 && igd.getProductStatus().equals("Y")) {
			igd.setProductType(3);
			igd.setProductOption("N");
			resultPd = aService.insertProduct(igd);
			igd.setProductNo(resultPd);
		}
		
		resultIgd = aService.updateIngredient(igd);
			
		if(resultPd != 0 && resultIgd != 0 && imageChange.equals("Y")) {
			
//			�뜲�씠�꽣 �꽌踰� �씠誘몄� �궘�젣
//			HashMap<String, Integer> map = new HashMap<String, Integer>();
//			map.put("imageDivideNo", igd.getIngredientNo());
//			map.put("imageType", 5);
//			Image img = aService.selectAllImageList(map).get(0);
			Image img = selectAllImageList(igd.getIngredientNo(), 5, 0).get(0);
			deleteFile(img.getImageRenameName(), request);
			
//			DB�꽌踰� �씠誘몄� �궘�젣
			resultImgDel = aService.deleteImage(img);
			
//			�씠誘몄� ���옣
			Image image = new Image();
			if(imageFile != null && !imageFile.isEmpty()) {
				String[] returnArr = saveFile(imageFile, request);
				if(returnArr[1] != null) {
//					image.setImageDivideNo(igd.getIngredientNo());
//					image.setImageType(5);
//					image.setImagePath(returnArr[0]);
//					image.setImageOriginalName(imageFile.getOriginalFilename());
//					image.setImageRenameName(returnArr[1]);
//					image.setImageLevel(0);
					image = setImage(igd.getIngredientNo(), 5, imageFile.getOriginalFilename(), returnArr[1], returnArr[0], 0);
				}
			}
			resultImgSave = aService.insertImage(image);
			
		}
		if(resultPd != 0 && resultIgd != 0 && resultImgDel != 0 && resultImgSave != 0) {
			model.addAttribute("page", ab.getPage());
			model.addAttribute("searchType", ab.getSearchType());
			model.addAttribute("searchText", ab.getSearchText());
			return "redirect:adminIngredientManage.ad";
		}else {
			throw new AdminException("�떇�옱猷� �닔�젙�뿉 �떎�뙣�븯���뒿�땲�떎.");
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
	@PostMapping("adminIngredientDeletes.ad")
	public String adminIngredientDeletes(@RequestParam("selectDelete") String[] selDeletes,
										 HttpServletRequest request,
										 Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		
		String[] igdDeletes = new String[selDeletes.length];
		String[] pDeletes = new String[selDeletes.length];
		int pCount = 0;
		
		int resultPd = 0;
		int resultIgd = 0;
		int resultImg = 0;
		for(int i = 0; i < selDeletes.length; i++) {
			String[] deletes = selDeletes[i].split("-");
			
			igdDeletes[i] = deletes[0];
			
			if(deletes.length != 1 && !deletes[1].equals("0")) {
				pDeletes[pCount] = deletes[1];
				pCount++;
			}
			
//			�뜲�씠�꽣 �꽌踰� �씠誘몄� �궘�젣
//			HashMap<String, Integer> map = new HashMap<String, Integer>();
//			map.put("imageDivideNo", Integer.parseInt(deletes[0]));
//			map.put("imageType", 5);
//			ArrayList<Image> iList = aService.selectAllImageList(map);
			ArrayList<Image> iList = selectAllImageList(Integer.parseInt(deletes[0]), 5, 0);
			if(!iList.isEmpty()) {
//				Image img = aService.selectAllImageList(map).get(0);
				Image img = iList.get(0);
				deleteFile(img.getImageRenameName(), request);
//				DB�꽌踰� �씠誘몄� �궘�젣
				resultImg += aService.deleteImage(img);
			}
		}
		
		resultPd = aService.deletesProduct(pDeletes);
		resultIgd = aService.deletesIngredient(igdDeletes);
		
		if(resultPd == pCount) {
			if(resultIgd+resultImg == igdDeletes.length*2) {
				model.addAttribute("page", ab.getPage());
				model.addAttribute("searchType", ab.getSearchType());
				model.addAttribute("searchText", ab.getSearchText());
				return "redirect:adminIngredientManage.ad";
			}
		}
		throw new AdminException("�떇�옱猷� �궘�젣 �떎�뙣");
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
//		insertProduct媛� �떎�뙣�븯吏� �븡�� 寃쎌슦 (!= 0)
		if(resultPd != 0) {
			resultIgd = aService.insertIngredient(igd);
		}
//		insertIngredient媛� �떎�뙣�븯吏� �븡�� 寃쎌슦(!= 0)
		if(resultIgd != 0) {
//			�씠誘몄� ���옣
			Image image = new Image();
			if(imageFile != null && !imageFile.isEmpty()) {
				String[] returnArr = saveFile(imageFile, request);
				if(returnArr[1] != null) {
//					image.setImageDivideNo(resultIgd);
//					image.setImageType(5);
//					image.setImagePath(returnArr[0]);
//					image.setImageOriginalName(imageFile.getOriginalFilename());
//					image.setImageRenameName(returnArr[1]);
//					image.setImageLevel(0);
					image = setImage(resultIgd, 5, imageFile.getOriginalFilename(), returnArr[1], returnArr[0], 0);
				}
			}
			resultImg = aService.insertImage(image);
		}
		
		if(resultPd != 0 && resultIgd != 0 && resultImg != 0) {
			model.addAttribute("page", ab.getPage());
			model.addAttribute("searchType", ab.getSearchType());
			model.addAttribute("searchText", ab.getSearchText());
			return "redirect:adminIngredientManage.ad";
		}else {
			throw new AdminException("�떇�옱猷� �벑濡앹뿉 �떎�뙣�븯���뒿�땲�떎.");
		}
	}
	
	
//	Food-�떇�뭹 愿�由�
	@GetMapping("adminFoodManage.ad")
	public String adminFoodManage(
//			@ModelAttribute AdminBasic ab,
								  HttpServletRequest request,
								  Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		
		int listCount = aService.getFoodCount(ab);
		
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Food> fList = aService.selectFoodList(pi, ab);
//		product�젙蹂� �엯�젰 硫붿냼�뱶
		for(Food f: fList) {
			f = (Food)selectProduct(f);
		}
		if(fList != null) {
			model.addAttribute("pi", pi);
//			model.addAttribute("ab", ab);
			model.addAttribute("fList", fList);
			return "adminFoodManage";
		}else{
			throw new AdminException("�떇�뭹 議고쉶瑜� �떎�뙣�븯���뒿�땲�떎.");
		}
	}
	@GetMapping("adminFoodDetail.ad")
	public String adminFoodDetail(
//			@ModelAttribute AdminBasic ab,
								  @RequestParam("productNo") Integer pNo,
								  Model model) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("no", pNo);
		map.put("type", 1);
		
		Food f = aService.selectFood(map);
//		HashMap<String, Integer> map = new HashMap<String, Integer>();
//		map.put("imageDivideNo", foodNo);
//		map.put("imageType", 3);
//		ArrayList<Image> imgList = aService.selectAllImageList(map);
		ArrayList<Image> imgList = selectAllImageList(pNo, 3, -1);
		
		Image thumbnail = null;
		for(int i = 0; i<imgList.size(); i++) {
			if(imgList.get(i).getImageLevel()==1) {
				thumbnail = imgList.get(i);
				imgList.remove(i);
				break;
			}
		}
		
		f = (Food)selectProduct(f);
		if(f != null) {
//			model.addAttribute("ab", ab);
			model.addAttribute("f", f);
			model.addAttribute("thumbnail", thumbnail);
			model.addAttribute("imgList", imgList);
			return "adminFoodDetail";
		}else {
			throw new AdminException("�떇�뭹 �긽�꽭蹂닿린瑜� �떎�뙣�븯���뒿�땲�떎.");
		}
	}
	@PostMapping("adminFoodUpdate.ad")
	public String adminFoodUpdate(
//			@ModelAttribute AdminBasic ab,
								  HttpServletRequest request,
								  Model model,
								  @ModelAttribute Food f
//								  @RequestParam("imageFile") ArrayList<MultipartFile> imageFiles
								  ) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		f.setFoodContent(f.getFoodContent()+"@"+f.getFoodTarget()+"@"+f.getFoodTable()+"@"+f.getNutrient());
		
		int resultF = aService.updateFood(f);
		int resultPd = aService.updateProduct(f);
		
		if(resultF+resultPd == 2) {
//			model.addAttribute("ab", ab);
			model.addAttribute("page", ab.getPage());
			model.addAttribute("searchType", ab.getSearchType());
			model.addAttribute("searchText", ab.getSearchText());
			return "redirect:adminFoodManage.ad";
		}else {
			throw new AdminException("�떇�뭹 �닔�젙�뿉 �떎�뙣�븯���뒿�땲�떎.");
		}
	}
	@PostMapping("adminFoodDeletes.ad")
	public String adminFoodDeletes(@RequestParam("selectDelete") String[] selDeletes,
								   HttpServletRequest request,
								   Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		
		int resultImg = 0;
		int resultFood = 0;
		int resultPd = 0;
		
		ArrayList<Image> imgList = null;
		for(int i = 0; i < selDeletes.length; i++) {
//			�뜲�씠�꽣 �꽌踰� �씠誘몄� �궘�젣
//			HashMap<String, Integer> map = new HashMap<String, Integer>();
//			map.put("imageDivideNo", Integer.parseInt(selDeletes[i]));
//			map.put("imageType", 3);
//			imgList = aService.selectAllImageList(map);
			imgList = selectAllImageList(Integer.parseInt(selDeletes[i]), 3, -1);
			
			for(Image img:imgList) {
				deleteFile(img.getImageRenameName(), request);
//				DB�꽌踰� �씠誘몄� �궘�젣
				resultImg += aService.deleteImage(img);
			}
		}
		
		resultFood = aService.deletesFood(selDeletes);
		resultPd = aService.deletesProduct(selDeletes);
		
		if(resultImg == imgList.size() && resultFood == selDeletes.length && resultPd == selDeletes.length) {
			model.addAttribute("page", ab.getPage());
			model.addAttribute("searchType", ab.getSearchType());
			model.addAttribute("searchText", ab.getSearchText());
			return "redirect:adminFoodManage.ad";
		}else {
			throw new AdminException("�떇�옱猷� �궘�젣 �떎�뙣");
		}
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
	public String adminFoodInsert(
//			@ModelAttribute AdminBasic ab,
								  HttpServletRequest request,
								  HttpSession session,
								  Model model,
								  @ModelAttribute Food f,
								  @RequestParam("imageFile") ArrayList<MultipartFile> imageFiles) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		
		Users user = (Users)session.getAttribute("loginUser");
		f.setUsersNo(user.getUsersNo());
		
//		foodContent媛� �빀移섍린
		f.setFoodContent(f.getFoodContent()+"@"+f.getFoodTarget()+"@"+f.getFoodTable()+"@"+f.getNutrient());

//		food 湲곕낯媛� �꽕�젙
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
			
//			�씠誘몄� ���옣
			int i = 0;
			for(MultipartFile imageFile: imageFiles) {
				Image image = new Image();
				if(imageFile != null && !imageFile.isEmpty()) {
					System.out.println(imageFile);
					String[] returnArr = saveFile(imageFile, request);
					if(returnArr[1] != null) {
//						image.setImageDivideNo(nowFoodNo);
//						image.setImageType(3);
//						image.setImagePath(returnArr[0]);
//						image.setImageOriginalName(imageFile.getOriginalFilename());
//						image.setImageRenameName(returnArr[1]);
//						image.setImageLevel(0);
						image = setImage(nowFoodNo, 3, imageFile.getOriginalFilename(), returnArr[1], returnArr[0], 0);
						System.out.println(image);
						if(i==0) {
							System.out.println(image);
							image.setImageLevel(1);
						}
						resultImg += aService.insertImage(image);
						i++;
					}
				}
			}
			if(resultImg == i ) {
				model.addAttribute("page", ab.getPage());
				model.addAttribute("searchType", ab.getSearchType());
				model.addAttribute("searchText", ab.getSearchText());
				return "redirect:adminFoodManage.ad";
			}
		}
		throw new AdminException("�떇�뭹 �벑濡앹뿉 �떎�뙣�븯���뒿�땲�떎.");
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
	
	
	
//	Tool-�긽�뭹 愿�由�
	@GetMapping("adminToolManage.ad")
	public String adminToolManage(
//			@ModelAttribute AdminBasic ab,
			  						 HttpServletRequest request,
			  						 Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");

		int listCount = aService.getToolCount(ab);
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Tool> tList = aService.selectToolList(pi, ab);
//		product�젙蹂� �엯�젰 硫붿냼�뱶
		for(Tool t: tList) {
			t = (Tool)selectProduct(t);
		}
		if(tList != null) {
			model.addAttribute("pi", pi);
//			model.addAttribute("ab", ab);
			model.addAttribute("tList", tList);
			return "adminToolManage";
		}else{
			throw new AdminException("�긽�뭹 議고쉶瑜� �떎�뙣�븯���뒿�땲�떎.");
		}
		
	}
	@GetMapping("adminToolDetail.ad")
	public String adminToolDetail(
//			@ModelAttribute AdminBasic ab,
								  @RequestParam("productNo") int toolNo,
								  Model model) {
		Tool t = aService.selectTool(toolNo);
		t = (Tool)selectProduct(t);
//		HashMap<String, Integer> map = new HashMap<String, Integer>();
//		map.put("imageDivideNo", toolNo);
//		map.put("imageType", 6);
//		ArrayList<Image> imgList = aService.selectAllImageList(map);
		ArrayList<Image> imgList = selectAllImageList(toolNo, 6, -1);

//		�샃�뀡�씠 �뾾�뒗 寃쎌슦(opList == null)瑜� �럹�씠吏��뿉�꽌 議곌굔�쑝濡� �궗�슜�븿
		ArrayList<Options> opList = aService.selectOptions(toolNo);

		Image thumbnail = null;
		for(int i = 0; i<imgList.size(); i++) {
			if(imgList.get(i).getImageLevel()==1) {
				thumbnail = imgList.get(i);
				imgList.remove(i);
				break;
			}
		}
		
		if(t != null) {
//			model.addAttribute("ab", ab);
			model.addAttribute("t", t);
			model.addAttribute("thumbnail", thumbnail);
			model.addAttribute("imgList", imgList);
			model.addAttribute("opList", opList);
			return "adminToolDetail";
		}else {
			throw new AdminException("�떇�뭹 �긽�꽭蹂닿린瑜� �떎�뙣�븯���뒿�땲�떎.");
		}
	}
	@PostMapping("adminToolUpdate.ad")
	public String adminToolUpdate(
//			@ModelAttribute AdminBasic ab,
								  HttpServletRequest request,
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
//					�뜲�씠�꽣 �꽌踰� �씠誘몄� �궘�젣
//					HashMap<String, Integer> map = new HashMap<String, Integer>();
//					map.put("imageDivideNo", t.getProductNo());
//					map.put("imageType", 6);
//					map.put("imageLevel", (i == 0 ? 1 : 0 ));
//					Image img = aService.selectAllImageList(map).get(0);
					Image img = selectAllImageList(t.getProductNo(), 6, (i == 0 ? 1 : 0 )).get(0);
					
					int delImgLevel = img.getImageLevel();
					
					deleteFile(img.getImageRenameName(), request);
							
//					DB�꽌踰� �씠誘몄� �궘�젣
					resultImgDel += aService.deleteImage(img);
					
//					�씠誘몄� ���옣
					Image image = new Image();
					String[] returnArr = saveFile(imageFiles.get(i), request);
					if(returnArr[1] != null) {
//						image.setImageDivideNo(t.getProductNo());
//						image.setImageType(6);
//						image.setImagePath(returnArr[0]);
//						image.setImageOriginalName(imageFiles.get(i).getOriginalFilename());
//						image.setImageRenameName(returnArr[1]);
//						image.setImageLevel(delImgLevel);
						image = setImage(t.getProductNo(), 6, imageFiles.get(i).getOriginalFilename(), returnArr[1], returnArr[0], delImgLevel);
					}
					
					resultImgIn += aService.insertImage(image);
			
				}
			}
			if((resultPd + resultT + resultOpDel + resultOpIn >= (1+1+0+1)) 
					&& resultImgDel == resultImgIn 
					&& resultImgIn == upImageCount) {
				model.addAttribute("page", ab.getPage());
				model.addAttribute("searchType", ab.getSearchType());
				model.addAttribute("searchText", ab.getSearchText());
				return "redirect:adminToolManage.ad";
			}else {
				throw new AdminException("�긽�뭹 �닔�젙�뿉 �떎�뙣�븯���뒿�땲�떎.");
			}
		}else {
			throw new AdminException("�긽�뭹 �닔�젙�뿉 �떎�뙣�븯���뒿�땲�떎.");
		}
	}
	@PostMapping("adminToolDeletes.ad")
	public String adminTooldDeletes(@RequestParam("selectDelete") String[] selDeletes,
									HttpServletRequest request,
									Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		
		int resultImg = 0;
		int resultOp = 0;
		int resultTool = 0;
		int resultPd = 0;
		
		ArrayList<Image> imgList = null;
		for(int i = 0; i < selDeletes.length; i++) {
//			�뜲�씠�꽣 �꽌踰� �씠誘몄� �궘�젣
//			HashMap<String, Integer> map = new HashMap<String, Integer>();
//			map.put("imageDivideNo", Integer.parseInt(selDeletes[i]));
//			map.put("imageType", 6);
//			imgList = aService.selectAllImageList(map);
			imgList = selectAllImageList(Integer.parseInt(selDeletes[i]), 6, -1);
			for(Image img:imgList) {
				deleteFile(img.getImageRenameName(), request);
//				DB�꽌踰� �씠誘몄� �궘�젣
				resultImg += aService.deleteImage(img);
			}
		}
		resultOp = aService.deletesOptions(selDeletes);
		resultTool = aService.deletesTool(selDeletes);
		resultPd = aService.deletesProduct(selDeletes);
		
		if(resultImg == imgList.size() && resultOp != 0 && resultTool == selDeletes.length && resultPd == selDeletes.length) {
			model.addAttribute("page", ab.getPage());
			model.addAttribute("searchType", ab.getSearchType());
			model.addAttribute("searchText", ab.getSearchText());
			return "redirect:adminToolManage.ad";
		}else {
			throw new AdminException("�룄援ъ긽�뭹 �궘�젣 �떎�뙣");
		}
	}
	@GetMapping("adminToolWrite.ad")
	public String adminToolWrite() {
		return "adminToolWrite";
	}
	@PostMapping("adminToolInsert.ad")
	public String adminToolInsert(
//			@ModelAttribute AdminBasic ab,
								  HttpServletRequest request,
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
			
//			�씠誘몄� ���옣
			int i = 0;
			for(MultipartFile imageFile: imageFiles) {
				if(imageFile != null && !imageFile.isEmpty()) {
					String[] returnArr = saveFile(imageFile, request);
					if(returnArr[1] != null) {
//						image.setImageDivideNo(nowToolNo);
//						image.setImageType(6);
//						image.setImagePath(returnArr[0]);
//						image.setImageOriginalName(imageFile.getOriginalFilename());
//						image.setImageRenameName(returnArr[1]);
//						image.setImageLevel(0);
						Image image = setImage(nowToolNo, 6, returnArr[0], imageFile.getOriginalFilename(), returnArr[1], 0);
						if(i==0) {
							image.setImageLevel(1);
						}
						resultImg += aService.insertImage(image);
						i++;
					}
				}
			}
			if(resultImg == i) {
				model.addAttribute("page", ab.getPage());
				model.addAttribute("searchType", ab.getSearchType());
				model.addAttribute("searchText", ab.getSearchText());
				return "redirect:adminToolManage.ad";
			}
		}
		throw new AdminException("�떇�뭹 �벑濡앹뿉 �떎�뙣�븯���뒿�땲�떎.");
	}
	

//	Recipe-�젅�떆�뵾 愿�由�
	@GetMapping("adminRecipeManage.ad")
	public String adminRecipeManage(HttpServletRequest request,
									Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");

		int listCount = aService.getRecipeCount(ab);
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Recipe> rpList = aService.selectRecipeList(pi, ab);
		
		if(rpList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("rpList", rpList);
			return "adminRecipeManage";
		}else {
			throw new AdminException("�젅�떆�뵾 紐⑸줉 議고쉶�뿉 �떎�뙣�븯���뒿�땲�떎.");
		}
	}
	@GetMapping("adminRecipeDetail.ad")
	public String adminRecipeDetail(Model model,
									HttpSession session,
									@ModelAttribute Recipe r) {
		Users user = (Users)session.getAttribute("loginUser");
		
//		model.addAttribute("page", 1);
		model.addAttribute("rId", user.getUsersId());
		model.addAttribute("rNo", r.getFoodNo());
		return "redirect:recipeDetail.rc";
	}
	@PostMapping("adminRecipeUpdate.ad")
	public String adminRecipeUpdate() {
		return "redirect:adminRecipeManage.ad";
	}
	@GetMapping("adminRecipeWrite.ad")
	public String adminRecipeWrite() {
		return "adminRecipeWrite";
	}
	@PostMapping("adminRecipeDeletes.ad")
	public String adminRecipedDeletes(@RequestParam("selectDelete") String[] selDeletes,
									HttpServletRequest request,
									Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		
		int resultImg = 0;
		int resultRp = 0;
		
		resultRp = aService.deletesRicipeOrder(selDeletes);
		
		ArrayList<Image> imgList = null;
		for(int i = 0; i < selDeletes.length; i++) {
//			�뜲�씠�꽣 �꽌踰� �씠誘몄� �궘�젣
			imgList = selectAllImageList(Integer.parseInt(selDeletes[i]), 2, -1);
			for(Image img:imgList) {
				deleteFile(img.getImageRenameName(), request);
//				DB�꽌踰� �씠誘몄� �궘�젣
				resultImg += aService.deleteImage(img);
			}
		}
		
		if(resultRp != 0 && resultImg == imgList.size()) {
			model.addAttribute("page", ab.getPage());
			model.addAttribute("searchType", ab.getSearchType());
			model.addAttribute("searchText", ab.getSearchText());
			return "redirect:adminRecipeManage.ad";
		}else {
			throw new AdminException("�젅�떆�뵾 �궘�젣 �떎�뙣");
		}
	}


//	Review-由щ럭 Detail
	@GetMapping("adminReviewDetail.ad")
	public String adminReviewDetail(@RequestParam("reviewNo") Integer reviewNo,
									Model model) {

		Review r = aService.selectReview(reviewNo);
		
		model.addAttribute("r", r);
		return "adminReviewDetail";
	}
	
	
	
//	RecipeReview-�젅�떆�뵾�썑湲� 愿�由�
	@GetMapping("adminRecipeReviewManage.ad")
	public String adminRecipeReviewManage(HttpServletRequest request,
										  Model model) {
		AdminBasic ab = (AdminBasic)request.getAttribute("ab");
		ab.setKind(0);

		int listCount = aService.getReviewCount(ab);
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Review> rprList = aService.selectReviewList(pi, ab);
		
		if(rprList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("rprList", rprList);
			return "adminRecipeReviewManage";
		}else {
			throw new AdminException("�젅�떆�뵾 紐⑸줉 議고쉶�뿉 �떎�뙣�븯���뒿�땲�떎.");
		}
	}
	@GetMapping("adminRecipeReviewDetail.ad")
	public String adminRecipeReviewDetail() {
		return "adminRecipeReviewDetail";
	}
	@PostMapping("adminRecipeReviewUpdate.ad")
	public String adminRecipeReviewUpdate() {
		return "redirect:adminRecipeReviewManage.ad";
	}
	
	
//	MenuReview-硫붾돱�썑湲� 愿�由�
	@GetMapping("adminMenuReviewManage.ad")
	public String adminMenuReviewManage() {
		return "adminMenuReviewManage";
	}
	@GetMapping("adminMenuReviewDetail.ad")
	public String adminMenuReviewDetail() {
		return "adminMenuReviewDetail";
	}
	@PostMapping("adminMenuReviewUpdate.ad")
	public String adminMenuReviewUpdate() {
		return "redirect:adminMenuReviewManage.ad";
	}
	
	
//	ProductReview-�긽�뭹�썑湲� 愿�由�
	@GetMapping("adminProductReviewManage.ad")
	public String adminProductReviewManage() {
		return "adminProductReviewManage";
	}
	@GetMapping("adminProductReviewDetail.ad")
	public String adminProductReviewDetail() {
		return "adminProductReviewDetail";
	}
	@PostMapping("adminProductReviewUpdate.ad")
	public String adminProductReviewUpdate() {
		return "redirect:adminProductReviewManage.ad";
	}
	
	
//	FAQ-�옄二쇰Щ�뒗吏덈Ц 愿�由�
	@GetMapping("adminFAQManage.ad")
	public String adminFAQManage() {
		return "adminFAQManage";
	}
	@GetMapping("adminFAQDetail.ad")
	public String adminFAQDetail() {
		return "adminFAQDetail";
	}
	@PostMapping("adminFAQUpdate.ad")
	public String adminFAQUpdate() {
		return "redirect:adminFAQManage.ad";
	}
	@GetMapping("adminFAQWrite.ad")
	public String adminFAQWrite() {
		return "adminFAQWrite";
	}
	@PostMapping("adminFAQInsert.ad")
	public String adminFAQInsert() {
		return "redirect:adminFAQManage.ad";
	}
	
	
//	QNA-1:1臾몄쓽 愿�由�	
	@GetMapping("adminQNAManage.ad")
	public String adminQNAManage() {
		return "adminQNAManage";
	}
	@GetMapping("adminQNADetail.ad")
	public String adminQNADetail() {
		return "adminQNADetail";
	}
	@PostMapping("adminQNAUpdate.ad")
	public String adminQNAUpdate() {
		return "redirect:adminQNAManage.ad";
	}
	
	
//	怨듭슜
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
//		5	-> users	status �뾽�뜲�씠�듃
//		6	-> recipe	status �뾽�뜲�씠�듃
//		7	-> review	status �뾽�뜲�씠�듃
		
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
//		�뙆�씪 ���옣�냼 吏��젙
		String root = request.getSession().getServletContext().getRealPath("resources");	// webapp-resources �뤃�뜑 �쓽誘�
//								  �뵆 String�뿉�꽌 �뿭�뒳�옒�돩瑜� �몴�쁽�븯湲� �쐞�빐 '\\' �씪怨� �쟻�쓬  
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
//		�뙆�씪 �씠由� 蹂�寃� �삎�떇 吏��젙
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum 
								+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		
//		蹂�寃쎈맂 �씠由꾩쓽 �뙆�씪�쓣 ���옣
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
		return p;
	}
	
//	private AdminBasic adminBasic(AdminBasic ab, HttpSession session) {
//		int currentPage = 1;
//		if(ab.getPage() == null) {
//			ab.setPage(currentPage);
//		}
//		int pageCount = 10;
//	//	�꽭�뀡�뿉 媛� X ab�뿉 媛� X	-> 珥덇린媛� �룞�씪 �꽕�젙
//		if(session.getAttribute("pageCount") == null && ab.getPageCount() == null) {
//			ab.setPageCount(pageCount);
//			session.setAttribute("pageCount", pageCount);
//	//	�꽭�뀡�뿉 媛� X ab�뿉 媛� O	(遺덇��뒫)
//	//	�꽭�뀡�뿉 媛� O ab�뿉 媛� X	-> �꽭�뀡媛� ab�뿉 �엯�젰
//		}else if(session.getAttribute("pageCount") != null && ab.getPageCount() == null){
//			ab.setPageCount((int)session.getAttribute("pageCount"));
//	//	�꽭�뀡�뿉 媛� O ab�뿉 媛� O	-> ab媛� �꽭�뀡�뿉 �엯�젰
//		}else {
//			session.setAttribute("pageCount", ab.getPageCount());
//		}
//		
//		return ab;
//	}

	private ArrayList<Image> selectAllImageList(int imageDivideNo, int imageType, int imageLevel) {
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
