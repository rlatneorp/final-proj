package kh.finalproj.hollosekki.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kh.finalproj.hollosekki.admin.exception.AdminException;
import kh.finalproj.hollosekki.admin.model.service.AdminService;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;

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
	public String adminMenuManage() {
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
	public String adminIngredientManage() {
		return "adminIngredientManage";
	}
	@GetMapping("adminIngredientDetail.ad")
	public String adminIngredientDetail() {
		return "adminIngredientDetail";
	}
	@PostMapping("adminIngredientUpdate.ad")
	public String adminIngredientUpdate() {
		return "redirect:adminIngredientManage.ad";
	}
	@GetMapping("adminIngredientWrite.ad")
	public String adminIngredientWrite() {
		return "adminIngredientWrite";
	}
	@PostMapping("adminIngredientInsert.ad")
	public String adminIngredientInsert(@ModelAttribute Ingredient igd,
										@RequestParam("imageFile") MultipartFile imageFile, 
										HttpServletRequest request,
										HttpSession session) {
//		Users user = (Users)session.getAttribute("loginUser");
		igd.setUsersNo(1);
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		
		if(igd.getProductStatus().equals("Y")) {
			igd.setProductType(3);
			igd.setProductOption("N");
			result2 = aService.insertProduct(igd);
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
	@GetMapping("adminFoodManage.ad")
	public String adminFoodManage() {
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
	@GetMapping("adminProductManage.ad")
	public String adminProductManage() {
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
	
	
//	RecipeReview-레시피 후기 관리
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
	
}
