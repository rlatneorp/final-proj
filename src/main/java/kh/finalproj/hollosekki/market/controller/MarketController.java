package kh.finalproj.hollosekki.market.controller;



import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.Menu;
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
		
//		ArrayList<Food> foodsList = new ArrayList<>(); ArrayList<Tool> toolsList = new ArrayList<>(); ArrayList<Ingredient> igsList = new ArrayList<>();
		ArrayList<Product> selectProductInfo = new ArrayList<>(); 
		Food foods = null; Tool tools = null; Ingredient igs = null; Menu menus = null;
		
		ArrayList<Cart> optionNos = new ArrayList<>();
		ArrayList<Options> optValues = new ArrayList<>();
		for(Cart cart : cartList) {
			int productNo = cart.getProductNo();
			
			Options opt = mkService.selectOptionInfo(cart.getProductNo(), cart.getProductOption()); //옵션 넘버 보내서 조회
			optValues.add(opt);
			
			ArrayList<Options> options = mkService.selectOptions(productNo);
			
			//카트List에 담긴 productNo마다 어떤 종류가 올 지 모르기 때문에 하나하나 셀렉 해옴 
			foods = mkService.selectFood(productNo);
			tools = mkService.selectTool(productNo);
			igs = mkService.selectIngrdient(productNo);
			menus = mkService.selectMenu(productNo);
			
			//productNo에 대한 모든 정보를 하나하나 가져옴 
			selectProductInfo = mkService.selectProductInfo(productNo);
			
			//위에서 조회 된 정보 중 price로 cart 속성값 변경 ( cartList 하나로 보내기 위해 )
			//합계 계산 
			int price = 0; int sum = 0;
			for (Product product : selectProductInfo) {
			    price = product.getProductPrice();
			    cart.setProductPrice(price); 
			}
			int size = mkService.plusResultCount(productNo);
			sum = size * price;
			cart.setSum(sum);
			
			//productNo에 대해 포문이 돌 때마다 null이 아니라면 cartList중 해당 되는 객체 값을 변경한다.
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
		    if (menus != null) {
		    	System.out.println("menus : " + menus);
		    	cart.setProductName(menus.getMenuName());
		    }
		}
		System.out.println("cartList : " + cartList);
		model.addAttribute("optValues", optValues);
		model.addAttribute("cartList", cartList);
		return "basket";
	}

	@RequestMapping("payDetail.ma")
	public String payDetail(HttpSession session, Model model, @RequestParam("optNos") String optNos) {
		
		
		Users users = (Users)session.getAttribute("loginUser");
		Food foods = null; Tool tools = null; Ingredient igs = null; Menu menus = null;
		ArrayList<ShippingAddress> shipAddress = mkService.selectShipping(users.getUsersNo());
		ArrayList<Product> productInfo = new ArrayList<>();
		ArrayList<Cart> checkedCart = new ArrayList<>();
		ArrayList<Cart> checkedCartList = new ArrayList<>();
		
		//옵션 
		ArrayList<Cart> optionNos = new ArrayList<>();
		ArrayList<Options> optValues = new ArrayList<>();
		
		
		String[] optNo = optNos.split(",");
		int[] intOptionNo = new int[optNo.length];
		
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
				menus = mkService.selectMenu(productNo);
				
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
			    if (menus != null) {
			    	checCart.setProductName(menus.getMenuName());
			    }
			    checkedCartList.add(checCart);
			}
		}
		
		int point = mkService.selectPoint(users.getUsersNo());
		
		model.addAttribute("point", point);
		model.addAttribute("checkedCartList", checkedCartList );
		model.addAttribute("optValues", optValues);
		return "payDetail";
	}

	@GetMapping("market_detail.ma")
	public String marketdetail(@RequestParam("productNo") int productNo,
							   HttpSession session, Model model) {
		Users users = (Users)session.getAttribute("loginUser");
		Tool tool = mkService.selectTool(productNo);
		ArrayList<Options> options = mkService.selectOptionsSet(productNo);
		Product p = mkService.selectProductSet(productNo);
		
		
		
//		System.out.println(options);
//		System.out.println(tool);
//		System.out.println(p);
		model.addAttribute("tool", tool);
		model.addAttribute("p", p);
		model.addAttribute("options", options);
		return "market_detail";
	}
	
	@GetMapping("createqna.ma")
	public String createqna() {
		return "createQnA";
	}
	
	@PostMapping("insertReview.ma")
	public String insertReview(HttpSession session, 
							   @ModelAttribute Product p,
							   @RequestParam ("imageFile") ArrayList<MultipartFile> imageFiles,
							   HttpServletRequest request,
							   Model model) {
		
		model.addAttribute("productNo", p.getProductNo());
		
		int i = 0;
		int resultF = 0;
		int resultImg = 0;
		
		for(MultipartFile imageFile : imageFiles) {
			Image image = new Image();
			if(imageFile != null && !imageFile.isEmpty()) {
				String[] returnArr = saveFile(imageFile, request);
				if(returnArr[1] != null) {
					image.setImageDivideNo(p.getProductNo());
					image.setImageType(7); /*리뷰는 7번*/
					image.setImagePath(returnArr[0]);
					image.setImageOriginalName(imageFile.getOriginalFilename());
					image.setImageRenameName(returnArr[1]);
					image.setImageLevel(0);
					if(i==0) {
						image.setImageLevel(1);
					}
					resultImg += mkService.insertImage(image);
					i++;
				}
			}
		}
		if(resultImg == i) {
			return "redirect:market_detail.ma";
		}
		
		
		return "redirect:market_detail.ma";
//		return "redirect:market_detail.ma"+p.getProductNo();
	}
		
	
	@GetMapping("createReview.ma")
	public String createReview(HttpSession session, Product p, Model model) {
		Users users = (Users)session.getAttribute("loginUser");
		model.addAttribute("productNo", p.getProductNo());
		return "createReview";
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
	
	
	@GetMapping("kitchenToolMain.ma")
	public String kitchenToolMain() {
		
		return "kitchenToolMainPage";
	}
	
	@RequestMapping("paySuccess.ma")
	public String paySuccess() {
		return "paySuccess";
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}
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
//		int result = mkService.insertCart(c);
//		
//		System.out.println(c);
//		
//		return result;
//	}
//	
	
	@RequestMapping("insertCart.ma")
		public void insertCart(@ModelAttribute Cart c,HttpServletResponse response) {

		
//		System.out.println(pNo);
		System.out.println(c.getProductNo());
		int result = mkService.insertCart(c);
			System.out.println(c);
		
		response.setContentType("application/json; charset=utf-8");
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();
		try {
			gson.toJson(result, response.getWriter());
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
	
	//수정 버튼 클릭 시 클릭한 배송지 정보 조회 
	@RequestMapping(value="updateShipping.ma", produces="application/json; charset=UTF-8")
	public void updateShipping(@RequestParam("shippingNo") int shippingNo, HttpServletResponse response) {
		System.out.println("shippingNo : " + shippingNo);
		
		ShippingAddress sa = mkService.selectShippingForUpdate(shippingNo);
		System.out.println("sa : " + sa);
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
		Gson gson = gb.create();
		try {
			gson.toJson(sa, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	//수정 확인 시 수정 
	@RequestMapping(value ="updateConfirmShipping.ma", produces="application/json; charset=UTF-8")
	public String updateConfirmShipping(@ModelAttribute ShippingAddress sa, 
				@RequestParam("updatePostcode") String addressPostCode,
				@RequestParam("updateAddress") String addressLocation,
				@RequestParam("updateDetailAddress") String detailAddress) {
		
		System.out.println("ShippingAddress : " + sa);
		String[] addresses = new String[3];
		addresses[0] = addressPostCode;
		addresses[1] = addressLocation;
		addresses[2] = detailAddress;
		sa.setAddress(Arrays.toString(addresses));
		
		
		mkService.updateConfirmShipping(sa);
		return "payDetail";
	}
	
	@RequestMapping(value="selectChecShip.ma", produces="application/json; charset=UTF-8")
	public void selectchecShip(@RequestParam("shippingNo") int shippingNo, HttpServletResponse response) {
		
		ShippingAddress sa = mkService.selectChecShip(shippingNo);
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
		Gson gson = gb.create();
		try {
			gson.toJson(sa, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping("delShipping.ma")
	@ResponseBody
	public void delShipping(@RequestParam("shippingNo") int shippingNo) {
		mkService.delShipping(shippingNo);
	}
	
}