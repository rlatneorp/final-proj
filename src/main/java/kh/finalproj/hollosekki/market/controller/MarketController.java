package kh.finalproj.hollosekki.market.controller;



import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

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
import kh.finalproj.hollosekki.market.model.vo.Options;
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
		
		ArrayList<Food> foodsList = new ArrayList<>(); ArrayList<Tool> toolsList = new ArrayList<>(); ArrayList<Ingredient> igsList = new ArrayList<>();
		ArrayList<Product> selectProductInfo = new ArrayList<>(); 
		Food foods = null; Tool tools = null; Ingredient igs = null;
		ArrayList<Object> productOpt = new ArrayList<>();
		
		for(Cart cart : cartList) {
			int productNo = cart.getProductNo();
			
			ArrayList<Options> options = mkService.selectOptions(productNo);
			cart.setOptionValue(options);
			
			System.out.println("options : " + options);
			
			foods = mkService.selectFood(productNo);
			tools = mkService.selectTool(productNo);
			igs = mkService.selectIngrdient(productNo);
				
			System.out.println("productOpt : " + productOpt);
			
			
			selectProductInfo = mkService.selectProductInfo(productNo);
			int price = 0; int sum = 0;
			for (Product product : selectProductInfo) {
			    price = product.getProductPrice();
			    cart.setProductPrice(price); 
			}
			int size = mkService.plusResultCount(productNo);
			sum = size * price;
			cart.setSum(sum);
			
			if(sum >= 30000) {
				cart.setShippingPrice("무료배송");
			} else {
				cart.setShippingPrice("30,000");
			}
			
			if (foods != null) {
				System.out.println("foods : " + foods);
				cart.setProductName(foods.getFoodName());
		    }
		    if (tools != null) {
		    	System.out.println("tools : " + tools);
		    	cart.setProductName(tools.getToolName());
		    }
		    if (igs != null) {
		    	System.out.println("igs : " + igs);
		    	cart.setProductName(igs.getIngredientName());
		    }
		}
		model.addAttribute("cartList", cartList);
		return "basket";
	}

	@RequestMapping("payDetail.ma")
	public String payDetail(HttpSession session, Model model, @RequestParam("pairs") String[] pairs) {
		
		Food foods = null; Tool tools = null; Ingredient igs = null;
		Users users = (Users)session.getAttribute("loginUser");
		ArrayList<ShippingAddress> shipAddress = mkService.selectShipping(users.getUsersNo());
		ArrayList<Cart> checkedCartList = new ArrayList<>();
		ArrayList<Product> productInfo = new ArrayList<>(); 
		
		Cart cart = null;
		System.out.println("pairs.length : " + pairs.length);
		for(int i=0; i <= pairs.length-2; i+=2) {
			
			int productNo = Integer.parseInt(pairs[i]);
			System.out.println("productNo!!!!!!!!!!!!!: " + productNo);
			int optionNo = Integer.parseInt(pairs[i+1]);
			
			Cart checkedCart = mkService.checkCartList(users.getUsersNo(), productNo);
			//보낸 option 넘버로 cart 업데이트 
			checkedCart.setProductNo(productNo);
			checkedCart.setProductOption(optionNo);
			mkService.updateOptionNo(cart); // cart 테이블 OptionNo 업데이트 
			String optionVal = mkService.selectOptionValue(optionNo);
			checkedCart.setSelectedOpt(optionVal);
			
			foods = mkService.selectFood(productNo);
			tools = mkService.selectTool(productNo);
			igs = mkService.selectIngrdient(productNo);
			
			productInfo = mkService.selectProductInfo(productNo);
			int price = 0; int sum = 0;
			
			for (Product product : productInfo) {
			    price = product.getProductPrice();
			    checkedCart.setProductPrice(price); 
			}
			
			int size = mkService.plusResultCount(productNo);
			sum = size * price;
			checkedCart.setSum(sum);
			
			if(sum >= 30000) {
				checkedCart.setShippingPrice("무료배송");
			} else {
				checkedCart.setShippingPrice("30,000");
			}
			
			if (foods != null) {
				checkedCart.setProductName(foods.getFoodName());
		    }
		    if (tools != null) {
		    	checkedCart.setProductName(tools.getToolName());
		    }
		    if (igs != null) {
		    	checkedCart.setProductName(igs.getIngredientName());
		    }
			checkedCartList.add(checkedCart);
		} //첫 번째 for문 끝 
			
		System.out.println("checkCartList : " + checkedCartList);
		model.addAttribute("cartList", checkedCartList );
		return "payDetail";
	}
			
			
//		}
			
			
			
//			
//			
//			cart.setProductNo(productNo);
//			cart.setUsersNo(users.getUsersNo());
////			cart.setProductOption();
//			Cart checkedCart = mkService.checkCartList(users.getUsersNo(), productNo);
//			
//			foods = mkService.selectFood(productNo);
//			tools = mkService.selectTool(productNo);
//			igs = mkService.selectIngrdient(productNo);
//			
//			productInfo = mkService.selectProductInfo(productNo);
//			int price = 0; int sum = 0;
//			
//			for (Product product : productInfo) {
//			    price = product.getProductPrice();
//			    checkedCart.setProductPrice(price); 
//			}
//			int size = mkService.plusResultCount(productNo);
//			sum = size * price;
//			checkedCart.setSum(sum);
//			
//			if(sum >= 30000) {
//				checkedCart.setShippingPrice("무료배송");
//			} else {
//				checkedCart.setShippingPrice("30,000");
//			}
//			
//			if (foods != null) {
//				System.out.println("foods : " + foods);
//				checkedCart.setProductName(foods.getFoodName());
//		    }
//		    if (tools != null) {
//		    	System.out.println("tools : " + tools);
//		    	checkedCart.setProductName(tools.getToolName());
//		    }
//		    if (igs != null) {
//		    	System.out.println("igs : " + igs);
//		    	checkedCart.setProductName(igs.getIngredientName());
//		    }
//			checkedCartList.add(checkedCart);
//		}
//		
////		model.addAttribute("cartList", checkedCartList );
////		model.addAttribute("shipAddress", shipAddress);
//		return "payDetail";
//	}

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