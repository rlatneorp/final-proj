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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import kh.finalproj.hollosekki.admin.exception.AdminException;
import kh.finalproj.hollosekki.admin.model.service.AdminService;
import kh.finalproj.hollosekki.common.model.Pagination;
import kh.finalproj.hollosekki.common.model.vo.AdminBasic;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
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
		
//		int listCount = aService.getMenuCount(ab);
//		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		
		
		return "adminMenuManage";
	}
	@GetMapping("adminMenuDetail.ad")
	public String adminMenuDetail() {
		return "adminMenuDetail";
	}
	@PostMapping("adminMenuUpdate.ad")
	public String adminMenuUpdate() {
		return "redirect:adminMenuManage.ad";
	}
	@GetMapping("adminMenuWrite.ad")
	public String adminMenuWrite() {
		return "adminMenuWrite";
	}
	@PostMapping("adminMenuInsert.ad")
	public String adminMenuInsert() {
		return "redirect:adminMenuManage.ad";
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
		for(int i = 0; i < igdList.size(); i++) {
			Ingredient igd = igdList.get(i);
			if( igd.getProductNo() > 0) {
				Product p = aService.selectProduct(igd.getProductNo());
				if(p != null) {
					igd.setProductType(p.getProductType());
					igd.setProductPrice(p.getProductPrice());
					igd.setProductOption(p.getProductOption());
					igd.setProductStock(p.getProductStock());
					igd.setProductCreateDate(p.getProductCreateDate());
					igd.setProductModifyDate(p.getProductModifyDate());
					igd.setProductSale(p.getProductSale());
					igd.setProductCount(p.getProductCount());
					igd.setProductStatus(p.getProductStatus());
				}
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
		Image img = aService.selectImage(map);

		if(igd.getProductNo() != 0) {
			int pNo = igd.getProductNo();
			Product p = aService.selectProduct(pNo);
			igd.setProductOption(p.getProductOption());
			igd.setProductStock(p.getProductStock());
			igd.setProductPrice(p.getProductPrice());
			igd.setProductSale(p.getProductSale());
			igd.setProductStatus(p.getProductStatus());
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
		int result1 = 1;
		int result2 = 1;
		int result3 = 1;
		int result4 = 1;
			
//		상품등록한 적이 있다면(productNo != 0) (status 무관)
		if(igd.getProductNo() != 0) {
			result1 = aService.updateProduct(pd);
//		상품등록한 적이 없지만(productNo == 0) Status가 Y일때
//		(새로 상품등록)
		}else if(igd.getProductNo() == 0 && igd.getProductStatus().equals("Y")) {
			pd.setProductType(3);
			pd.setProductOption("N");
			result1 = aService.insertProduct(pd);
			igd.setProductNo(aService.getNowProductNo());
		}
		
		result2 = aService.updateIngredient(igd);
			
		System.out.println(pd);
		System.out.println(igd);
		
		if(imageChange.equals("Y")) {
			
//			데이터 서버 이미지 삭제
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("imageDivideNo", igd.getIngredientNo());
			map.put("imageType", 5);
			Image img = aService.selectImage(map);
			deleteFile(img.getImageRenameName(), request);
			
//			DB서버 이미지 삭제
			result3 = aService.deleteImage(img);
			
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
				}
			}
			result4 = aService.insertImage(image);
			
		}
		System.out.println(result1);
		System.out.println(result2);
		System.out.println(result3);
		System.out.println(result4);
		if(result1+result2+result3+result4 == 4) {
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
	@PostMapping("adminIngredientDeletes.ad")
	public String adminIngredientDeletes(@RequestParam("selectDelete") String[] selDeletes,
										 HttpServletRequest request) {
		
		String[] igdDeletes = new String[selDeletes.length];
		String[] pDeletes = new String[selDeletes.length];
		int pCount = 0;
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		for(int i = 0; i < selDeletes.length; i++) {
			String[] deletes = selDeletes[i].split(",");
			
			igdDeletes[i] = deletes[0];
			
			if(deletes.length != 1 && !deletes[1].equals("0")) {
				pDeletes[pCount] = deletes[1];
				pCount++;
			}
			
//			데이터 서버 이미지 삭제
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("imageDivideNo", Integer.parseInt(deletes[0]));
			map.put("imageType", 5);
			Image img = aService.selectImage(map);
			deleteFile(img.getImageRenameName(), request);
			
//			DB서버 이미지 삭제
			result3 += aService.deleteImage(img);
		}
		
		result1 = aService.deletesProduct(pDeletes);
		result2 = aService.deletesIngredient(igdDeletes);
		
		if(result1 == pCount) {
			if(result2+result3 == igdDeletes.length*2) {
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
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		
		if(igd.getProductStatus().equals("Y")) {
			pd.setProductType(3);
			pd.setProductOption("N");
			result2 = aService.insertProduct(pd);
		}
		
		result1 = aService.insertIngredient(igd);
		
//		이미지 저장
		Image image = new Image();
		if(imageFile != null && !imageFile.isEmpty()) {
			String[] returnArr = saveFile(imageFile, request);
			if(returnArr[1] != null) {
				image.setImageDivideNo(aService.getNowIngredientNo());
				image.setImageType(5);
				image.setImagePath(returnArr[0]);
				image.setImageOriginalName(imageFile.getOriginalFilename());
				image.setImageRenameName(returnArr[1]);
			}
		}
		result3 = aService.insertImage(image);
		
		if(result1 + result3 == 2) {
			if(igd.getProductStatus().equals("Y")) {
				if(result2 > 0) {
					return "redirect:adminIngredientManage.ad";
				}else {
					throw new AdminException("식재료 상품 등록에 실패하였습니다.");
				}
			}else {
				return "redirect:adminIngredientManage.ad";
			}
		}else {
			throw new AdminException("식재료 등록에 실패하였습니다.");
		}
	}
	
	
	
//	Food-식품 관리

	
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
		
//		int listCount = aService.getFoodCount(ab);
//		PageInfo pi = Pagination.getPageInfo(ab.getPage(), listCount, ab.getPageCount());
		
		return "adminFoodManage";
	}
	@GetMapping("adminFoodDetail.ad")
	public String adminFoodDetail() {
		return "adminFoodDetail";
	}
	@PostMapping("adminFoodUpdate.ad")
	public String adminFoodUpdate() {
		return "redirect:adminFoodManage.ad";
	}
	@GetMapping("adminFoodWrite.ad")
	public String adminFoodWrite() {
		return "adminFoodWrite";
	}
	@PostMapping("adminFoodInsert.ad")
	public String adminFoodInsert() {
		return "redirect:adminFoodManage.ad";
	}
	
	
//	Product-상품 관리

	
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
	
	
//	Recipe-레시피관리	
	
	
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
	
	
//	RecipeReview-레시피 후기 관리


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
	
	
//	MenuReview-식단구독 후기 관리

	
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
	
	
//	Product-상품 관리

	
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
}
