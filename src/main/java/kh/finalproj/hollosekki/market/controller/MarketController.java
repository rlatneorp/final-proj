package kh.finalproj.hollosekki.market.controller;



import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.service.MarketService;
import kh.finalproj.hollosekki.market.model.vo.Cart;
import kh.finalproj.hollosekki.market.model.vo.Food;
import kh.finalproj.hollosekki.market.model.vo.Product;
import kh.finalproj.hollosekki.market.model.vo.ShippingAddress;
import kh.finalproj.hollosekki.market.model.vo.Tool;

@Controller
public class MarketController {

	@Autowired
	private MarketService mkService;

	@RequestMapping("basket.ma")
	public String pay(HttpSession session, Model model) {
		
		Users users = (Users)session.getAttribute("loginUser");
		int userNo = users.getUsersNo();
		
		ArrayList<Cart> cartList = mkService.selectCartList(userNo);
		ArrayList<Food> foodsList = new ArrayList<>();
		ArrayList<Tool> toolsList = new ArrayList<>();
		ArrayList<Ingredient> igsList = new ArrayList<>();
		
		ArrayList<Product> foodInfo = new ArrayList<>();
		ArrayList<Integer> productPrices = new ArrayList<>();
		ArrayList<Integer> sumList = new ArrayList<>();
		
		Food foods = null; Tool tools = null; Ingredient igs = null;
		for(Cart cart : cartList) {
			int productNo = cart.getProductNo();
			
			//카트에 담긴 productNo의 가격도 알아야 함 
			foods = mkService.selectFood(productNo);
			tools = mkService.selectTool(productNo);
			igs = mkService.selectIngrdient(productNo);
			
			int price = 0;
			int sum = 0;
			if (foods != null) {
				foodInfo = mkService.selectFoodInfo(productNo);
				
				for (Product product : foodInfo) {
				    price = product.getProductPrice();
//				    productPrices.add(price);
				    cart.setProductPrice(price); //근데 이거 마지막 값으로 저장될 거 아니야... 
				}
				
				System.out.println("foodInfo : " + foodInfo);
				int size = mkService.plusResultCount(productNo);
				sum = size * price;
				cart.setSum(sum);
				if(sum >= 30000) {
					cart.setShippingPrice("무료배송");
				} else {
					cart.setShippingPrice("30,000");
				}
		        foodsList.add(foods);
		    }
		    if (tools != null) {
		        toolsList.add(tools);
		    }
		    if (igs != null) {
		        igsList.add(igs);
		    }
		}
		
		if(foods != null) {
			model.addAttribute("price", productPrices);
			model.addAttribute("productList", foodsList);
		} else if (tools != null) {
			model.addAttribute("productList", toolsList);
		} else if (igs != null) {
			model.addAttribute("productList", igsList);
		}
		model.addAttribute("cartList", cartList);
		return "basket";
	}

	@RequestMapping("payDetail.ma")
	public String payDetail(HttpSession session, Model model) {
		
		Users users = (Users)session.getAttribute("loginUser");
		ArrayList<ShippingAddress> shipAddress = mkService.selectShipping(users.getUsersNo());
		model.addAttribute("shipAddress", shipAddress);
		return "payDetail";
	}

	@GetMapping("market_detail.ma")
	public String marketdetail() {
		return "market_detail";
	}
	
	@GetMapping("createqna.ma")
	public String createqna() {
		return "createQnA";
	}
	
	@GetMapping("createReview.ma")
	public String createReview() {
		return "createReview";
	}
	
	@GetMapping("kitchenToolMain.ma")
	public String kitchenToolMain() {
		
		return "kitchenToolMainPage";
	}
	
	@RequestMapping("paySuccess.ma")
	public String paySuccess() {
		return "paySuccess";
	}
	

		
	
	//獄쏄퀣�꽊筌욑옙 �빊遺쏙옙 獄쏉옙 鈺곌퀬�돳
	@RequestMapping(value="insertShipping.ma", produces="application/json; charset=UTF-8")
	public void insertShipping(@ModelAttribute ShippingAddress sa, @RequestParam("postcode") String postcode, @RequestParam("addressInfo") String addressInfo, @RequestParam("detailAddress") String detailAddress,  HttpServletResponse response) {
		
		String[] addresses = new String[3];
		addresses[0] = postcode;
		addresses[1] = addressInfo;
		addresses[2] = detailAddress;
		sa.setAddress(Arrays.toString(addresses));
		
		System.out.println("ssss : " + sa);
		int result = mkService.insertShipping(sa);
		ArrayList<ShippingAddress> shipAddress = mkService.selectShipping(sa.getUsersNo());
		
		response.setContentType("application/json; charset=UTF-8");
        GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd"); 
        Gson gson = gb.create();
		try {
            gson.toJson(shipAddress, response.getWriter()); 
         } catch (JsonIOException | IOException e) {
            e.printStackTrace();
         }
	}
	
	

	@ResponseBody
	@PostMapping("insertCart.ma")
	public int insertCart(@ModelAttribute Cart c) {
	
		int result = mkService.insertCart(c);
		return result;
	}
	
	//장바구니 목록 삭제 
	@RequestMapping(value="delBasket.ma", produces="application/json; charset=UTF-8")
	public String delBasket(@RequestParam("productNo") int productNo) {
		mkService.delBasket(productNo);
		return "basket";
	}
	
	//
	@RequestMapping(value="plusCount.ma", produces="application/json; charset=UTF-8")
	public void plusCount(@RequestParam("productNo") int productNo, @RequestParam("price") int price, HttpServletResponse response) {
		mkService.plusCount(productNo);
		
		int size = mkService.plusResultCount(productNo);
		int sum = size * price;
		System.out.println("sum : " + sum);
		response.setContentType("application/json; charset=UTF-8");
        GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd"); 
        Gson gson = gb.create();
		try {
            gson.toJson(sum, response.getWriter()); 
         } catch (JsonIOException | IOException e) {
            e.printStackTrace();
         }
	}
	
	@RequestMapping(value="minusCount.ma", produces="application/json; charset=UTF-8")
	public void minusCount(@RequestParam("productNo") int productNo, @RequestParam("price") int price, HttpServletResponse response) {
		mkService.minusCount(productNo);
		int size = mkService.plusResultCount(productNo);
		int sum = size * price;
		response.setContentType("application/json; charset=UTF-8");
        GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd"); 
        Gson gson = gb.create();
		try {
            gson.toJson(sum, response.getWriter()); 
         } catch (JsonIOException | IOException e) {
            e.printStackTrace();
         }
	}
	
	
}