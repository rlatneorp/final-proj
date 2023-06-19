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
		
		System.out.println("엥? : " + cartList);
		ArrayList<Food> foodsList = new ArrayList<>(); ArrayList<Tool> toolsList = new ArrayList<>(); ArrayList<Ingredient> igsList = new ArrayList<>();
		ArrayList<Product> selectProductInfo = new ArrayList<>(); 
		Food foods = null; Tool tools = null; Ingredient igs = null;
//		ArrayList<Object> optName = new ArrayList<>();
		
		ArrayList<Cart> optionNos = new ArrayList<>();
		ArrayList<Options> optValues = new ArrayList<>();
		for(Cart cart : cartList) {
			int productNo = cart.getProductNo();
			System.out.println("cart : " + cart);
			
			//preorderNo 하나하나 
			//optionNo하나하나ㅏ......
			//에 해당 되는 value 가져오기 
			//그럼 얘네는 겹칠 수가 없음 
			
//			System.out.println("cart.getProductOption : " + cart.getProductOption(), car);
			Options opt = mkService.selectOptionInfo(cart.getProductNo(), cart.getProductOption()); //옵션 넘버 보내서 조회
			System.out.println("cart.get~" + cart.getProductNo());
			System.out.println("cart.get~" + cart.getProductOption());
			
			System.out.println("opt : " + opt);
			optValues.add(opt);
			
			
			
//			System.out.println("opttttttt : " + opt.getOptionValue());
			
			
//			cart.setOptionValue(opt.getOptionValue());
			
			
			
			
			
			
			
//			optionNos = mkService.selectOptionNo(cart); //주문번호에 해당 되는 옵션 번호 조회 
//			System.out.println("optionNos : " + optionNos);
//			for(Cart optNos : optionNos) {
//				System.out.println("optNos : " + optNos);
////				cart.setProductOption(optNos);
////				Options optionValue = mkService.selectOptionInfo(optNos);
////				optValues.add(optionInfos);
//			}
			
			
//			System.out.println("optionValues : " + optionValues);
//			cart.setOptionValue(optionValues);
//			System.out.println("optionsNos = " + optionNos);
			
			//예를들어 11번일 때 
//			ArrayList<Options> options = mkService.selectOptions(productNo);
			//11번에 해당 되는 옵션들이 모두 조회 
//			System.out.println("options : " + options);
//			cart.setOptionValue(options);
			
			ArrayList<Options> options = mkService.selectOptions(productNo);
//			productOpt.add(options);
//			cart.setOptionValue(options);
			
			System.out.println("options : " + options);
			
			foods = mkService.selectFood(productNo);
			tools = mkService.selectTool(productNo);
			igs = mkService.selectIngrdient(productNo);
			
			
//			for(Options opt : options) {
//				
//				 if (opt.getProductNo() == productNo) {  // productNo가 일치하는 경우에만 실행
//			            String optValue = opt.getOptionValue();
//			            System.out.println("optValue : " + optValue);
//			            productOpt.add(optValue);
//			            cart.setOptionValue(productOpt);
//			        }
				
//				cart.setOptionValue(optValue);
				
				
//			System.out.println("productOpt : " + productOpt);
			
			
			selectProductInfo = mkService.selectProductInfo(productNo);
			int price = 0; int sum = 0;
			for (Product product : selectProductInfo) {
			    price = product.getProductPrice();
			    cart.setProductPrice(price); 
			}
			int size = mkService.plusResultCount(productNo);
			sum = size * price;
			cart.setSum(sum);
			
//			if(sum >= 30000) {
//				cart.setShippingPrice("무료배송");
//			} else {
//				cart.setShippingPrice("30,000");
//			}
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
		System.out.println("optValues : " + optValues);
		System.out.println("cartList" + cartList);
		
		
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
				System.out.println("getProductNo : " + checCart.getProductNo());
				
				Options opt = mkService.selectOptionInfo(checCart.getProductNo(), checCart.getProductOption()); //옵션 넘버 보내서 조회
				System.out.println("cart.get~" + checCart.getProductNo());
				System.out.println("cart.get~" + checCart.getProductOption());
				
				System.out.println("opt인데 여기는 어디냐면 payDetail!!!!!!!! : " + opt);
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
			}System.out.println("checkedCartList : " + checkedCartList);
			
			
			
			
//			System.out.println("checkedCart111111111111111111111111111 : " + checkedCart);
			
			//productNo, productName, optionNo, cartCount, price
		}
		
//		System.out.println("checkedCart112222222222222222222222222222222222222 : " + checkedCart);
		
		
//		for(Cart checCart : checkedCart) { 
//			int productNo = checCart.getProductNo();
//			System.out.println("getProductNo : " + checCart.getProductNo());
//			
//			foods = mkService.selectFood(productNo);
//			tools = mkService.selectTool(productNo);
//			igs = mkService.selectIngrdient(productNo);
//			
//			productInfo = mkService.selectProductInfo(productNo);
//			int price = 0; int sum = 0;
//			for (Product product : productInfo) {
//			    price = product.getProductPrice();
//			    checCart.setProductPrice(price); 
//			}
//			int size = mkService.plusResultCount(productNo);
//			sum = size * price;
//			checCart.setSum(sum);
//			
//			if (foods != null) {
//				checCart.setProductName(foods.getFoodName());
//		    }
//		    if (tools != null) {
//		    	checCart.setProductName(tools.getToolName());
//		    }
//		    if (igs != null) {
//		    	checCart.setProductName(igs.getIngredientName());
//		    }
//		    checkedCart.add(checCart);
//		}System.out.println("checkedCart : " + checkedCart);
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
//			
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
//				checkedCart.setProductName(foods.getFoodName());
//		    }
//		    if (tools != null) {
//		    	checkedCart.setProductName(tools.getToolName());
//		    }
//		    if (igs != null) {
//		    	checkedCart.setProductName(igs.getIngredientName());
//		    }
//			checkedCartList.add(checkedCart);
			
			
			
			
			
			
//		}
		
		
		
		
//		Food foods = null; Tool tools = null; Ingredient igs = null;
//		Users users = (Users)session.getAttribute("loginUser");
		
		
		
//		ArrayList<ShippingAddress> shipAddress = mkService.selectShipping(users.getUsersNo());
//		ArrayList<Cart> checkedCartList = new ArrayList<>();
//		ArrayList<Product> productInfo = new ArrayList<>(); 
//		
//		Cart cart = null;
//		System.out.println("pairs.length : " + pairs.length);
//		System.out.println("pairs : " + pairs);
//		for(int i=0; i <= pairs.length-2; i+=2) {
//			
//			int productNo = Integer.parseInt(pairs[i]);
//			System.out.println("productNo!!!!!!!!!!!!!: " + productNo);
//			int optionNo = Integer.parseInt(pairs[i+1]);
//			System.out.println("optionNo : " + optionNo);
//			System.out.println("----------헨젤과그레텔 과자 1 ");
//			Cart checkedCart = mkService.checkCartList(users.getUsersNo(), productNo);
//			System.out.println("----------헨젤과그레텔 과자 2 ");
//			//보낸 option 넘버로 cart 업데이트 
//			checkedCart.setProductNo(productNo);
//			checkedCart.setProductOption(optionNo);
//			mkService.updateOptionNo(cart); // cart 테이블 OptionNo 업데이트 
//			System.out.println("----------헨젤과그레텔 과자 3 ");
//			String optionVal = mkService.selectOptionValue(optionNo);
//			System.out.println("----------헨젤과그레텔 과자 4 ");
//			checkedCart.setSelectedOpt(optionVal);
//			System.out.println("----------헨젤과그레텔 과자 5 ");
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
//			
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
//				checkedCart.setProductName(foods.getFoodName());
//		    }
//		    if (tools != null) {
//		    	checkedCart.setProductName(tools.getToolName());
//		    }
//		    if (igs != null) {
//		    	checkedCart.setProductName(igs.getIngredientName());
//		    }
//			checkedCartList.add(checkedCart);
//		} //첫 번째 for문 끝 
//			
//		System.out.println("checkCartList : " + checkedCartList);
//		model.addAttribute("cartList", checkedCartList );
		
		model.addAttribute("checkedCartList", checkedCartList );
		model.addAttribute("optValues", optValues);
		
		return "payDetail";
	}

	@GetMapping("market_detail.ma")
	public String marketdetail(@RequestParam("productNo") int productNo,
							   Model model) {
		Tool tool = mkService.selectTool(productNo);
		ArrayList<Options> options = mkService.selectOptions(productNo);
		
		model.addAttribute("tool", tool);
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
		HashMap<String, String> result = new HashMap<String, String>();
		
		result.put("pNo", pNo);
		result.put("cartCount", cartCount);
		result.put("pOption", pOption);
		result.put("pOption2", pOption2);
		result.put("usersNo", usersNo);

		mkService.insertCart(result);
		System.out.println(pNo);
//		System.out.println(c);
//		ArrayList<Cart> list  = mkService.insertCart(c.getCartNo());
		
		response.setContentType("application/json; charset=utf-8");
//		Gson gson = new Gson();//json객체로 보내고 싶은것
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