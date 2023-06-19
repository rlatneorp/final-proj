package kh.finalproj.hollosekki.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import kh.finalproj.hollosekki.common.model.Pagination;
import kh.finalproj.hollosekki.common.model.vo.AdminBasic;
import kh.finalproj.hollosekki.common.model.vo.Food;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Product;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	@GetMapping("adminMain.ad")
	public String adminMain() {
		return "adminMain";
	}
	
//	sales-매출 관리
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
	
//	order-주문 관리
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
	
	
//	Member-회원 관리
	@GetMapping("adminMemberManage.ad")
	public String adminMemberManage() {
		return "adminMemberManage";
	}
	@GetMapping("adminMemberDetail.ad")
	public String adminMemberDetail() {
		return "adminMemberDetail";
	}
	@PostMapping("adminMemberUpdate.ad")
	public String adminMemberUpdate() {
//		update 진행
		return "redirect:adminMemberManage.ad";
	}
	
	
//	Menu-식단 관리
	@GetMapping("adminMenuManage.ad")
	public String adminMenuManage(@ModelAttribute AdminBasic ab,
								  HttpSession session,
							 	  Model model) {
		int currentPage = 1;
		if(ab.getPage() == null) {
			ab.setPage(currentPage);
		}
		int pageCount = 10;
//		세션에 값 X ab에 값 X	-> 초기값 동일 설정
		if(session.getAttribute("pageCount") == null && ab.getPageCount() == null) {
			ab.setPageCount(pageCount);
			session.setAttribute("pageCount", pageCount);
//		세션에 값 X ab에 값 O	(불가능)
//		세션에 값 O ab에 값 X	-> 세션값 ab에 입력
		}else if(session.getAttribute("pageCount") != null && ab.getPageCount() == null){
			ab.setPageCount((int)session.getAttribute("pageCount"));
//		세션에 값 O ab에 값 O	-> ab값 세션에 입력
		}else {
			session.setAttribute("pageCount", ab.getPageCount());
		}
		
		int listCount = aService.getMenuCount(ab);
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Menu> mList = aService.selectMenuList(pi, ab);
		for(int i = 0; i < mList.size(); i++) {
			Menu m = mList.get(i);
			m = (Menu)selectProduct(m);
		}
		if(mList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("ab", ab);
			model.addAttribute("mList", mList);
			return "adminMenuManage";
		}else {
			throw new AdminException("식재료 조회를 실패하였습니다.");
		}
		
	}
	@GetMapping("adminMenuDetail.ad")
	public String adminMenuDetail() {
		return "adminMenuDetail";
	}
	@PostMapping("adminMenuUpdate.ad")
	public String adminMenuUpdate() {
		return "redirect:adminMenuManage.ad";
	}
	@PostMapping("adminMenuDeletes.ad")
	public String adminMenuDeletes(@RequestParam("selectDelete") String[] selDeletes,
										 HttpServletRequest request) {
		
		int resultImg = 0;
		int resultM = 0;
		int resultPd = 0;
		
		ArrayList<Image> imgList = null;
		for(int i = 0; i < selDeletes.length; i++) {
//			데이터 서버 이미지 삭제
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("imageDivideNo", Integer.parseInt(selDeletes[i]));
			map.put("imageType", 4);
			imgList = aService.selectAllImageList(map);
			for(Image img:imgList) {
				deleteFile(img.getImageRenameName(), request);
//				DB서버 이미지 삭제
				resultImg += aService.deleteImage(img);
			}
		}
		
//		resultM = aService.deletesMenu(selDeletes);
		resultPd = aService.deletesProduct(selDeletes);
		
		if(resultImg == imgList.size() && resultM == selDeletes.length && resultPd == selDeletes.length) {
			return "redirect:adminFoodManage.ad";
		}else {
			throw new AdminException("식재료 삭제 실패");
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
								  HttpServletRequest request,
								  HttpSession session) {
		
		m.setUsersNo(1);
		
		int resultPd = -1;
		int resultM = 0;
		int resultMl = 0;
		int resultImg = 0;
		
		m.setProductType(2);
		m.setProductOption("N");
//		return "redirect:adminMenuManage.ad";
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
					image.setImageDivideNo(resultPd);
					image.setImageType(4);
					image.setImagePath(returnArr[0]);
					image.setImageOriginalName(imageFile.getOriginalFilename());
					image.setImageRenameName(returnArr[1]);
					image.setImageLevel(1);
				}
			}
			resultImg = aService.insertImage(image);
		}
		
		if(resultPd != 0 && resultM != 0 && resultImg != 0) {
			return "redirect:adminMenuManage.ad";
		}else {
			throw new AdminException("메뉴 등록에 실패하였습니다.");
		}
	}
	@GetMapping("adminFoodSelector.ad")
	public void adminFoodSelector(@RequestParam("pNo") int pNo,
				  				  HttpServletResponse response) {
		Food food = null;
		if(pNo != 0) {
			food = aService.selectFood(pNo);
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
	public void adminFoodImageSelector(@RequestParam("pNo") int pNo,
									   HttpServletResponse response) {
		Image img = null; 
		if(pNo != 0) {
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("imageDivideNo", pNo);
			map.put("imageType", 3);
			map.put("imageLevel", 1);
			img = aService.selectAllImageList(map).get(0);
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
	public String adminIngredientManage(@ModelAttribute AdminBasic ab,
										HttpSession session,
									 	Model model) {
		int currentPage = 1;
		if(ab.getPage() == null) {
			ab.setPage(currentPage);
		}
		int pageCount = 10;
//		세션에 값 X ab에 값 X	-> 초기값 동일 설정
		if(session.getAttribute("pageCount") == null && ab.getPageCount() == null) {
			ab.setPageCount(pageCount);
			session.setAttribute("pageCount", pageCount);
//		세션에 값 X ab에 값 O	(불가능)
//		세션에 값 O ab에 값 X	-> 세션값 ab에 입력
		}else if(session.getAttribute("pageCount") != null && ab.getPageCount() == null){
			ab.setPageCount((int)session.getAttribute("pageCount"));
//		세션에 값 O ab에 값 O	-> ab값 세션에 입력
		}else {
			session.setAttribute("pageCount", ab.getPageCount());
		}
		
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
			model.addAttribute("pi", pi);
			model.addAttribute("ab", ab);
			model.addAttribute("igdList", igdList);
			return "adminIngredientManage";
		}else {
			throw new AdminException("식재료 조회를 실패하였습니다.");
		}
	}
	@GetMapping("adminIngredientDetail.ad")
	public String adminIngredientDetail(@ModelAttribute AdminBasic ab,
									 	@RequestParam("ingredientNo") int igdNo,
									 	Model model) {
		Ingredient igd = aService.selectIngredient(igdNo);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("imageDivideNo", igdNo);
		map.put("imageType", 5);
		Image img = aService.selectAllImageList(map).get(0);

		if(igd.getProductNo() != 0) {
			igd = (Ingredient)selectProduct(igd);
		}
		if(igd != null) {
			model.addAttribute("ab", ab);
			model.addAttribute("igd", igd);
			model.addAttribute("img", img);
			return "adminIngredientDetail";
		}else {
			throw new AdminException("식재료 상세보기를 실패하였습니다.");
		}
		
	}
	@PostMapping("adminIngredientUpdate.ad")
	public String adminIngredientUpdate(@ModelAttribute AdminBasic ab,
									 	@ModelAttribute Ingredient igd,
									 	@ModelAttribute Product pd,
									 	@RequestParam("imageChange") String imageChange,
									 	@RequestParam("imageFile") MultipartFile imageFile,
										HttpServletRequest request,
									 	Model model) {
		int resultPd = -1;		// 선택사항이면서, ProductNo이 1일 수 있으므로 -1
		int resultIgd = 0;		// 필수사항이므로 0
		int resultImgDel = 1;	// 선택사항이므로 1
		int resultImgSave = 1;	// 선택사항이므로 1
//		상품등록한 적이 있다면(productNo != 0) (status 무관)
		if(igd.getProductNo() != 0) {
			resultPd = aService.updateProduct(pd);
//		상품등록한 적이 없지만(productNo == 0) Status가 Y일때
//		(새로 상품등록)
		}else if(igd.getProductNo() == 0 && igd.getProductStatus().equals("Y")) {
			pd.setProductType(3);
			pd.setProductOption("N");
			resultPd = aService.insertProduct(pd);
			igd.setProductNo(resultPd);
		}
		
		resultIgd = aService.updateIngredient(igd);
			
		if(resultPd != 0 && resultIgd != 0 && imageChange.equals("Y")) {
			
//			데이터 서버 이미지 삭제
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("imageDivideNo", igd.getIngredientNo());
			map.put("imageType", 5);
			Image img = aService.selectAllImageList(map).get(0);
			deleteFile(img.getImageRenameName(), request);
			
//			DB서버 이미지 삭제
			resultImgDel = aService.deleteImage(img);
			
//			이미지 저장
			Image image = new Image();
			if(imageFile != null && !imageFile.isEmpty()) {
				String[] returnArr = saveFile(imageFile, request);
				if(returnArr[1] != null) {
					image.setImageDivideNo(igd.getIngredientNo());
					image.setImageType(5);
					image.setImagePath(returnArr[0]);
					image.setImageOriginalName(imageFile.getOriginalFilename());
					image.setImageRenameName(returnArr[1]);
					image.setImageLevel(0);
				}
			}
			resultImgSave = aService.insertImage(image);
			
		}
		if(resultPd != 0 && resultIgd != 0 && resultImgDel != 0 && resultImgSave != 0) {
			model.addAttribute("ab", ab);
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
	@PostMapping("adminIngredientDeletes.ad")
	public String adminIngredientDeletes(@RequestParam("selectDelete") String[] selDeletes,
										 HttpServletRequest request) {
		
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
			
//			데이터 서버 이미지 삭제
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("imageDivideNo", Integer.parseInt(deletes[0]));
			map.put("imageType", 5);
			ArrayList<Image> iList = aService.selectAllImageList(map);
			if(!iList.isEmpty()) {
				Image img = aService.selectAllImageList(map).get(0);
				deleteFile(img.getImageRenameName(), request);
//				DB서버 이미지 삭제
				resultImg += aService.deleteImage(img);
			}
		}
		
		resultPd = aService.deletesProduct(pDeletes);
		resultIgd = aService.deletesIngredient(igdDeletes);
		
		if(resultPd == pCount) {
			if(resultIgd+resultImg == igdDeletes.length*2) {
				return "redirect:adminIngredientManage.ad";
			}
		}
		throw new AdminException("식재료 삭제 실패");
	}
	@GetMapping("adminIngredientWrite.ad")
	public String adminIngredientWrite() {
		return "adminIngredientWrite";
	}
	@PostMapping("adminIngredientInsert.ad")
	public String adminIngredientInsert(@ModelAttribute Ingredient igd,
									    @ModelAttribute Product pd,
										@RequestParam("imageFile") MultipartFile imageFile, 
										HttpServletRequest request,
										HttpSession session,
										Model model) {
//		Users user = (Users)session.getAttribute("loginUser");
		igd.setUsersNo(1);
		
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
					image.setImageDivideNo(resultIgd);
					image.setImageType(5);
					image.setImagePath(returnArr[0]);
					image.setImageOriginalName(imageFile.getOriginalFilename());
					image.setImageRenameName(returnArr[1]);
					image.setImageLevel(0);
				}
			}
			resultImg = aService.insertImage(image);
		}
		
		if(resultPd != 0 && resultIgd != 0 && resultImg != 0) {
			return "redirect:adminIngredientManage.ad";
		}else {
			throw new AdminException("식재료 등록에 실패하였습니다.");
		}
	}
	
	
//	Food-식품 관리
	@GetMapping("adminFoodManage.ad")
	public String adminFoodManage(@ModelAttribute AdminBasic ab,
								  HttpSession session,
								  Model model) {
		int currentPage = 1;
		if(ab.getPage() == null) {
			ab.setPage(currentPage);
		}
		int pageCount = 10;
//		세션에 값 X ab에 값 X	-> 초기값 동일 설정
		if(session.getAttribute("pageCount") == null && ab.getPageCount() == null) {
			ab.setPageCount(pageCount);
			session.setAttribute("pageCount", pageCount);
//		세션에 값 X ab에 값 O	(불가능)
//		세션에 값 O ab에 값 X	-> 세션값 ab에 입력
		}else if(session.getAttribute("pageCount") != null && ab.getPageCount() == null){
			ab.setPageCount((int)session.getAttribute("pageCount"));
//		세션에 값 O ab에 값 O	-> ab값 세션에 입력
		}else {
			session.setAttribute("pageCount", ab.getPageCount());
		}
		
		int listCount = aService.getFoodCount(ab);
		
		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		ArrayList<Food> fList = aService.selectFoodList(pi, ab);
//		product정보 입력 메소드
		for(Food f: fList) {
			f = (Food)selectProduct(f);
		}
		if(fList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("ab", ab);
			model.addAttribute("fList", fList);
			return "adminFoodManage";
		}else{
			throw new AdminException("식품 조회를 실패하였습니다.");
		}
	}
	@GetMapping("adminFoodDetail.ad")
	public String adminFoodDetail(@ModelAttribute AdminBasic ab,
								  @RequestParam("productNo") int foodNo,
								  Model model) {
		Food f = aService.selectFood(foodNo);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("imageDivideNo", foodNo);
		map.put("imageType", 3);
		ArrayList<Image> imgList = aService.selectAllImageList(map);
		
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
			model.addAttribute("ab", ab);
			model.addAttribute("f", f);
			model.addAttribute("thumbnail", thumbnail);
			model.addAttribute("imgList", imgList);
			return "adminFoodDetail";
		}else {
			throw new AdminException("식품 상세보기를 실패하였습니다.");
		}
	}
	@PostMapping("adminFoodUpdate.ad")
	public String adminFoodUpdate(@ModelAttribute AdminBasic ab,
								  HttpServletRequest request,
								  HttpSession session,
								  Model model,
								  @ModelAttribute Food f,
								  @ModelAttribute Product p
//								  @RequestParam("imageFile") ArrayList<MultipartFile> imageFiles
								  ) {
		f.setFoodContent(f.getFoodContent()+"@"+f.getFoodTarget()+"@"+f.getFoodTable()+"@"+f.getNutrient());
		
		int resultF = aService.updateFood(f);
		int resultPd = aService.updateProduct(p);
		
		if(resultF+resultPd == 2) {
			model.addAttribute("ab", ab);
			return "redirect:adminFoodManage.ad";
		}else {
			throw new AdminException("식품 수정에 실패하였습니다.");
		}
	}
	@PostMapping("adminFoodDeletes.ad")
	public String adminFoodDeletes(@RequestParam("selectDelete") String[] selDeletes,
								   HttpServletRequest request) {

		int resultImg = 0;
		int resultFood = 0;
		int resultPd = 0;
		
		ArrayList<Image> imgList = null;
		for(int i = 0; i < selDeletes.length; i++) {
//			데이터 서버 이미지 삭제
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("imageDivideNo", Integer.parseInt(selDeletes[i]));
			map.put("imageType", 3);
			imgList = aService.selectAllImageList(map);
			for(Image img:imgList) {
				deleteFile(img.getImageRenameName(), request);
//				DB서버 이미지 삭제
				resultImg += aService.deleteImage(img);
			}
		}
		
		resultFood = aService.deletesFood(selDeletes);
		resultPd = aService.deletesProduct(selDeletes);
		
		if(resultImg == imgList.size() && resultFood == selDeletes.length && resultPd == selDeletes.length) {
			return "redirect:adminFoodManage.ad";
		}else {
			throw new AdminException("식재료 삭제 실패");
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
	public String adminFoodInsert(@ModelAttribute AdminBasic ab,
								  HttpServletRequest request,
								  HttpSession session,
								  Model model,
								  @ModelAttribute Food f,
								  @ModelAttribute Product p,
								  @RequestParam("imageFile") ArrayList<MultipartFile> imageFiles) {

		f.setUsersNo(1);
		
//		foodContent값 합치기
		f.setFoodContent(f.getFoodContent()+"@"+f.getFoodTarget()+"@"+f.getFoodTable()+"@"+f.getNutrient());

//		food 기본값 설정
		f.setFoodType(0);
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
					String[] returnArr = saveFile(imageFile, request);
					if(returnArr[1] != null) {
						image.setImageDivideNo(nowFoodNo);
						image.setImageType(3);
						image.setImagePath(returnArr[0]);
						image.setImageOriginalName(imageFile.getOriginalFilename());
						image.setImageRenameName(returnArr[1]);
						image.setImageLevel(0);
						if(i==0) {
							image.setImageLevel(1);
						}
						resultImg += aService.insertImage(image);
						i++;
					}
				}
			}
			if(resultImg == i ) {
				return "redirect:adminFoodManage.ad";
			}
		}
		throw new AdminException("식품 등록에 실패하였습니다.");
	}
	
	
//	Product-상품 관리
	@GetMapping("adminProductManage.ad")
	public String adminProductManage(@ModelAttribute AdminBasic ab,
			  						 HttpSession session,
			  						 Model model) {
		
		int currentPage = 1;
		if(ab.getPage() == null) {
			ab.setPage(currentPage);
		}
		int pageCount = 10;
//		세션에 값 X ab에 값 X	-> 초기값 동일 설정
		if(session.getAttribute("pageCount") == null && ab.getPageCount() == null) {
			ab.setPageCount(pageCount);
			session.setAttribute("pageCount", pageCount);
//		세션에 값 X ab에 값 O	(불가능)
//		세션에 값 O ab에 값 X	-> 세션값 ab에 입력
		}else if(session.getAttribute("pageCount") != null && ab.getPageCount() == null){
			ab.setPageCount((int)session.getAttribute("pageCount"));
//		세션에 값 O ab에 값 O	-> ab값 세션에 입력
		}else {
			session.setAttribute("pageCount", ab.getPageCount());
		}
		
//		int listCount = aService.getProductCount(ab);
//		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());

		
		return "adminProductManage";
	}
	@GetMapping("adminProductDetail.ad")
	public String adminProductDetail() {
		return "adminProductDetail";
	}
	@PostMapping("adminProductUpdate.ad")
	public String adminProductUpdate() {
		return "redirect:adminProductManage.ad";
	}
	@GetMapping("adminProductWrite.ad")
	public String adminProductWrite() {
		return "adminProductWrite";
	}
	@PostMapping("adminProductInsert.ad")
	public String adminProductInsert() {
		return "redirect:adminProductManage.ad";
	}
	
	
//	Recipe-레시피 관리
	@GetMapping("adminRecipeManage.ad")
	public String adminRecipeManage() {
		return "adminRecipeManage";
	}
	@GetMapping("adminRecipeDetail.ad")
	public String adminRecipeDetail() {
		return "adminRecipeDetail";
	}
	@PostMapping("adminRecipeUpdate.ad")
	public String adminRecipeUpdate() {
		return "redirect:adminRecipeManage.ad";
	}
	@GetMapping("adminRecipeWrite.ad")
	public String adminRecipeWrite() {
		return "adminRecipeWrite";
	}
	@PostMapping("adminRecipeInsert.ad")
	public String adminRecipeInsert() {
		return "redirect:adminRecipeManage.ad";
	}
	
	
//	RecipeReview-레시피후기 관리
	@GetMapping("adminRecipeReviewManage.ad")
	public String adminRecipeReviewManage() {
		return "adminRecipeReviewManage";
	}
	@GetMapping("adminRecipeReviewDetail.ad")
	public String adminRecipeReviewDetail() {
		return "adminRecipeReviewDetail";
	}
	@PostMapping("adminRecipeReviewUpdate.ad")
	public String adminRecipeReviewUpdate() {
		return "redirect:adminRecipeReviewManage.ad";
	}
	
	
//	MenuReview-메뉴후기 관리
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
	
	
//	ProductReview-상품후기 관리
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
	
	
//	FAQ-자주묻는질문 관리
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
	
	
//	QNA-1:1문의 관리	
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
	
	
//	공용
	@GetMapping("adminUpdateStatus.ad")
	public void adminUpdateStatus(@RequestParam("dataNo") String dataNo,
								  @RequestParam("dataStatus") String dataStatus,
								  @RequestParam("dataType") String dataType,
								  HttpServletResponse response) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("dataNo", dataNo);
		map.put("dataStatus", dataStatus);
		map.put("dataType", dataType);
		
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
		return p;
	}
}
