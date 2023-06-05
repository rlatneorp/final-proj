package kh.finalproj.hollosekki.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import kh.finalproj.hollosekki.admin.model.service.AdminService;
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
										HttpSession session) {
//		Users user = (Users)session.getAttribute("loginUser");
		igd.setUsersNo(1);
		
		int result = aService.insertIngredient(igd);
//		상품등록여부 확인 후 상품등록도 진행해야함
		
		
		return "redirect:adminIngredientManage.ad";
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
	
}
