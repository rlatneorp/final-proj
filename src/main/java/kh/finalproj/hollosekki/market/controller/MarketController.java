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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		ArrayList<Cart> optionNos = new ArrayList<>();
		ArrayList<Options> optValues = new ArrayList<>();
		for(Cart cart : cartList) {
			int productNo = cart.getProductNo();
			
			Options opt = mkService.selectOptionInfo(cart.getProductNo(), cart.getProductOption()); //옵션 넘버 보내서 조회
			optValues.add(opt);
			
			ArrayList<Options> options = mkService.selectOptions(productNo);
			
			
			foods = mkService.selectFood(productNo);
			tools = mkService.selectTool(productNo);
			igs = mkService.selectIngrdient(productNo);
			
			selectProductInfo = mkService.selectProductInfo(productNo);
			
			int price = 0; int sum = 0;
			for (Product product : selectProductInfo) {
			    price = product.getProductPrice();
			    cart.setProductPrice(price); 
			}
			int size = mkService.plusResultCount(productNo);
			sum = size * price;
			cart.setSum(sum);
			
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
		model.addAttribute("optValues", optValues);
		model.addAttribute("cartList", cartList);
		return "basket";
	}

	@RequestMapping("payDetail.ma")
	public String payDetail(HttpSession session, Model model, @RequestParam("optNos") String optNos) {
		
		
		Users users = (Users)session.getAttribute("loginUser");
		Food foods = null; Tool tools = null; Ingredient igs = null;
		ArrayList<ShippingAddress> shipAddress = mkService.selectShipping(users.getUsersNo());
		ArrayList<Product> productInfo = new ArrayList<>();
		ArrayList<Cart> checkedCart = new ArrayList<>();
		ArrayList<Cart> checkedCartList = new ArrayList<>();
		
		//옵션 
		ArrayList<Cart> optionNos = new ArrayList<>();
		ArrayList<Options> optValues = new ArrayList<>();
		
		
		String[] optNo = optNos.split(",");
		int[] intOptionNo = new int[optNo.length];
		System.out.println("optNos.lenght : " + optNo.length ); //3 
		
		
		
		for(int i=0; i<optNo.length; i++) {
			intOptionNo[i] = Integer.parseInt(optNo[i]);
			System.out.println("intOptionNo : " + intOptionNo[i]);
			int preorderNo = intOptionNo[i];
			
			//주문번호로 cartList 조회 
			checkedCart = mkService.checkCartList(users.getUsersNo(),preorderNo);
			
			for(Cart checCart : checkedCart) { 
				int productNo = checCart.getProductNo();
				
				Options opt = mkService.selectOptionInfo(checCart.getProductNo(), checCart.getProductOption()); //옵션 넘버 보내서 조회
				optValues.add(opt);
				
				foods = mkService.selectFood(productNo);
				tools = mkService.selectTool(productNo);
				igs = mkService.selectIngrdient(productNo);
				
				productInfo = mkService.selectProductInfo(productNo);
				int price = 0; int sum = 0;
				for (Product product : productInfo) {
				    price = product.getProductPrice();
				    checCart.setProductPrice(price); 
				}
				int size = mkService.plusResultCount(productNo);
				sum = size * price;
				checCart.setSum(sum);
				
				if (foods != null) {
					checCart.setProductName(foods.getFoodName()); 
			    }
			    if (tools != null) {
			    	checCart.setProductName(tools.getToolName());
			    }
			    if (igs != null) {
			    	checCart.setProductName(igs.getIngredientName());
			    }
			    checkedCartList.add(checCart);
			}
		}
		model.addAttribute("checkedCartList", checkedCartList );
		model.addAttribute("optValues", optValues);
		return "payDetail";
	}

	@GetMapping("market_detail.ma")
	public String marketdetail(@RequestParam("productNo") int productNo,
							   Model model) {
		Tool tool = mkService.selectTool(productNo);
		ArrayList<Options> options = mkService.selectOptionsSet(productNo);
		Product p = mkService.selectProductSet(productNo);
	
		
		
		System.out.println(options);
		System.out.println(tool);
		System.out.println(p);
		model.addAttribute("tool", tool);
		model.addAttribute("p", p);
		model.addAttribute("options", options);
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
	
	

//	@ResponseBody
//	@PostMapping("insertCart.ma")
//	public int insertCart(@RequestBody Cart c /*@RequestParam("productNo")ArrayList<Cart> productNo,
//						  @RequestParam("cartCount")ArrayList<Cart>cartCount,
//						  @RequestParam("productOption")ArrayList<Cart>productOption,
//						  @RequestParam("UserNo")ArrayList<Cart>UserNo*/) {
//
//		
//		int result = mkService.insertCart(c);
//		
//		System.out.println(c);
//		
//		return result;
//	}
//	
	
	@RequestMapping("insertCart.ma")
	public void insertCart(
				//			@ModelAttribute Cart c,
							@RequestParam("productNo") String pNo,@RequestParam("cartCount") String cartCount,
							@RequestParam("productOption") String pOption,@RequestParam("productOption2") String pOption2,
							@RequestParam("usersNo") String usersNo,
							HttpServletResponse response) {
		System.out.println(pNo);
		System.out.println(cartCount);
		System.out.println(pOption);
		System.out.println(pOption2);
		System.out.println(usersNo);
		
		response.setContentType("application/json; charset=utf-8");
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();
		try {
			gson.toJson("", response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	
	
	
	
	
	
	
	
	
	
	
	//장바구니 목록 삭제 
	@RequestMapping(value="delBasket.ma", produces="application/json; charset=UTF-8")
	public String delBasket(@RequestParam("productNo") int productNo) {
		mkService.delBasket(productNo);
		return "basket";
	}
	
	
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
	
	//
	@RequestMapping(value="selectShipping.ma", produces="application/json; charset=UTF-8")
	public void selectShipping(@RequestParam("usersNo") int usersNo, HttpServletResponse response) {
		ArrayList<ShippingAddress> shippingInfo = mkService.selectShipping(usersNo);
		
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
		Gson gson = gb.create();
		try {
			gson.toJson(shippingInfo, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	@RequestMapping(value="updateShipping.ma", produces="application/json; charset=UTF-8")
	public void updateShipping(@RequestParam("shippingNo") int shippingNo) {
		System.out.println("shippingNo : " + shippingNo);
	}
	
}