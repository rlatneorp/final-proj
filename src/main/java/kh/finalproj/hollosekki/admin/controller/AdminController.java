package kh.finalproj.hollosekki.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminController {
	
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
	public String adminIngredientInsert() {
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
	@GetMapping("adminFoodWrtie.ad")
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
