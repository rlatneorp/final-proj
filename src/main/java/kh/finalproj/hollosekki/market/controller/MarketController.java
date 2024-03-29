package kh.finalproj.hollosekki.market.controller;



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

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import kh.finalproj.hollosekki.common.Pagination;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Point;
import kh.finalproj.hollosekki.enroll.model.service.EnrollService;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.exception.MarketException;
import kh.finalproj.hollosekki.market.model.service.MarketService;
import kh.finalproj.hollosekki.market.model.vo.Cart;
import kh.finalproj.hollosekki.market.model.vo.Food;
import kh.finalproj.hollosekki.market.model.vo.Options;
import kh.finalproj.hollosekki.market.model.vo.Orders;
//import kh.finalproj.hollosekki.market.model.vo.Orders;
import kh.finalproj.hollosekki.market.model.vo.Product;
import kh.finalproj.hollosekki.market.model.vo.QA;
import kh.finalproj.hollosekki.market.model.vo.Review;
import kh.finalproj.hollosekki.market.model.vo.ShippingAddress;
import kh.finalproj.hollosekki.market.model.vo.Tool;

@Controller
public class MarketController {

   @Autowired
   private MarketService mkService;
   
   @Autowired
   private EnrollService eService;

   @RequestMapping("basket.ma")
   public String basket(HttpSession session, Model model) {
      
      Users users = (Users)session.getAttribute("loginUser");
      int userNo = users.getUsersNo();
      
      if(users != null) {
			int cart = eService.cartCount(users.getUsersNo());
			model.addAttribute("cart", cart);
      }
      ArrayList<Cart> cartList = mkService.selectCartList(userNo);
      ArrayList<Product> selectProductInfo = new ArrayList<>(); 
      Food foods = null; Tool tools = null; Ingredient igs = null; Menu menus = null;
      
      for(Cart cart : cartList) {
         int productNo = cart.getProductNo();
         
         //주문 번호에 대한 optionNo 조회 
         ArrayList<Options> o = mkService.selectOptionInfo(cart.getPreorderNo());
         cart.setOptionName(o);
         
         //카트List에 담긴 productNo마다 어떤 종류가 올 지 모르기 때문에 하나하나 셀렉 해옴 
         foods = mkService.selectFood(productNo);
         tools = mkService.selectTool(productNo);
         igs = mkService.selectIngrdient(productNo);
         menus = mkService.selectMenu(productNo);
         
         //productNo에 대한 모든 정보를 하나하나 가져옴 
         selectProductInfo = mkService.selectProductInfo(productNo);
         //위에서 조회 된 정보 중 price로 cart 속성값 변경 ( cartList 하나로 보내기 위해 )
         //합계 계산 
         int price = 0; int sum = 0; int sale = 0;
         for (Product product : selectProductInfo) {
             price = product.getProductPrice();
             sale = product.getProductSale();
             cart.setProductPrice(price);
             cart.setSale(sale);
         }
         int size = mkService.plusResultCount(cart.getPreorderNo());
         sum = size * price;
         cart.setSum(sum);
         
         //productNo에 대해 포문이 돌 때마다 null이 아니라면 cartList중 해당 되는 객체 값을 변경한다.
         if (foods != null) { //이미지 타입 : 3 ( 식품 ) - 1
            cart.setProductName(foods.getFoodName());
            cart.setProductType(1);
            String imgName = mkService.selectImg(productNo, 3);
            cart.setImgName(imgName);
          }
          if (tools != null) { //이미지 타입 : 6 ( 주방도구) - 4
             cart.setProductName(tools.getToolName());
             cart.setProductType(4);
             String imgName = mkService.selectImg(productNo, 6);
             cart.setImgName(imgName);
          }
          if (igs != null) { //이미지 타입 :5 (식재료) - 3
             cart.setProductName(igs.getIngredientName());
             cart.setProductType(3);
             String imgName = mkService.selectImg(igs.getIngredientNo(), 5);
             cart.setImgName(imgName);
          }
          if (menus != null) { //이미지 타입 : 4 (식단) - 2
             cart.setProductName(menus.getMenuName());
             cart.setProductType(2);
             String imgName = mkService.selectImg(productNo, 4);
             cart.setImgName(imgName);
          }
      }
      model.addAttribute("cartList", cartList);
      return "basket";
   }

   @RequestMapping("payDetail.ma")
   public String payDetail(HttpSession session, Model model, @RequestParam("preorderNos") String preorderNos) {
      
	  //전달 받은 주문번호를 select 해와 화면에 전달 
      Users users = (Users)session.getAttribute("loginUser");
      Food foods = null; Tool tools = null; Ingredient igs = null; Menu menus = null;
      ArrayList<ShippingAddress> shipAddress = mkService.selectShipping(users.getUsersNo());
      ArrayList<Product> productInfo = new ArrayList<>(); ArrayList<Cart> checkedCart = new ArrayList<>(); ArrayList<Cart> checkedCartList = new ArrayList<>();
      if(users != null) {
    	  int cart = eService.cartCount(users.getUsersNo());
    	  	session.setAttribute("cart", cart);
      }
      
      //옵션 
      ArrayList<Cart> optionNos = new ArrayList<>(); ArrayList<Options> optValues = new ArrayList<>();
      
      String[] preorderNo = preorderNos.split(",");
      System.out.println("preorderNo : " + preorderNo);
      for(int i=0; i<preorderNo.length; i++) {
    	  int preNo = Integer.parseInt(preorderNo[i]);
    	  //주문번호로 cartList 조회 
          checkedCart = mkService.checkCartList(users.getUsersNo(), preNo);
          //주문 번호에 대한 optionNo 조회 
          ArrayList<Options> o = mkService.selectOptionInfo(preNo);
          for(Cart checCart : checkedCart) {
        	  checCart.setOptionName(o);
        	  int productNo = checCart.getProductNo();
        	  foods = mkService.selectFood(productNo); tools = mkService.selectTool(productNo); igs = mkService.selectIngrdient(productNo); menus = mkService.selectMenu(productNo);
        	  
        	  productInfo = mkService.selectProductInfo(productNo);
              int price = 0; int sum = 0; int sale = 0;
              for (Product product : productInfo) {
                price = product.getProductPrice();
                checCart.setProductPrice(price); 
                checCart.setSale(product.getProductSale());
              }
              int size = mkService.plusResultCount(preNo);
              sum = size * price;
              checCart.setSum(sum);
            
              if (foods != null) { //이미지 타입 : 3 ( 식품 ) 
            	  checCart.setProductName(foods.getFoodName());
            	  String imgName = mkService.selectImg(productNo, 3);
            	  checCart.setImgName(imgName);
              }
              if (tools != null) { //이미지 타입 : 6 ( 주방도구)
            	  checCart.setProductName(tools.getToolName());
            	  String imgName = mkService.selectImg(productNo, 6);
            	  checCart.setImgName(imgName);
              }
              if (igs != null) { //이미지 타입 : 5 (식재료) 
            	  checCart.setProductName(igs.getIngredientName());
            	  String imgName = mkService.selectImg(igs.getIngredientNo(), 5);
            	  checCart.setImgName(imgName);
              }
              if (menus != null) { //이미지 타입 : 4 (식단)
            	  checCart.setProductName(menus.getMenuName());
            	  String imgName = mkService.selectImg(productNo, 4);
            	  checCart.setImgName(imgName);
              }
        	  
              checkedCartList.add(checCart);
          } //checCart for문 끝 
          
      } //주문번호 for문 끝 
      
      int point = mkService.selectPoint(users.getUsersNo());
      model.addAttribute("point", point);
      model.addAttribute("checkedCartList", checkedCartList );
      model.addAttribute("optValues", optValues);
      return "payDetail";
   }
   
   @RequestMapping("payDetail2.ma")
   public String payDetail2(HttpSession session, Model model) {
	   Users users = (Users)session.getAttribute("loginUser");
	   Menu menus = null;
	   ArrayList<Product> productInfo = new ArrayList<>(); ArrayList<Cart> checkedCart = new ArrayList<>(); ArrayList<Cart> checkedCartList = new ArrayList<>();
	   
	   Cart cart = mkService.selectCart(users.getUsersNo());
	   int preNo = cart.getPreorderNo();
	   
	   checkedCart = mkService.checkCartList(users.getUsersNo(), preNo);
	   
	   System.out.println(checkedCart);
	   
	   for(Cart checCart : checkedCart) {
     	  int productNo = checCart.getProductNo();
     	  menus = mkService.selectMenu(productNo);
     	  
     	  productInfo = mkService.selectProductInfo(productNo);
           int price = 0; int sum = 0; int sale = 0;
           for (Product product : productInfo) {
             price = product.getProductPrice();
             checCart.setProductPrice(price); 
             checCart.setSale(product.getProductSale());
           }
           int size = mkService.plusResultCount(preNo);
           sum = size * price;
           checCart.setSum(sum);
         
         if (menus != null) { //이미지 타입 : 4 (식단)
         	  checCart.setProductName(menus.getMenuName());
         	  String imgName = mkService.selectImg(productNo, 4);
         	  checCart.setImgName(imgName);
           }
     	  
           checkedCartList.add(checCart);
       } //checCart for문 끝 
	   
	   model.addAttribute("point", users.getPoint());
	   model.addAttribute("checkedCartList", checkedCart );
	   
	   return "payDetail";
   }

   @GetMapping("marketProductDetail.ma")
   public String marketProductDetail(@RequestParam("pNo") int productNo, Model model) {
	   
	   ArrayList<Review> r = mkService.selectReview(productNo);
	   model.addAttribute("productNo", productNo);
	   model.addAttribute("r", r);
	   return "redirect:market_detail.ma";
   }
   
   @GetMapping("market_detail.ma")
   public String marketdetail(@RequestParam("productNo") int productNo,
		   				@RequestParam(value="page", required=false) Integer currentPage,
                        @ModelAttribute Review r,
                        @ModelAttribute QA q,
                        @ModelAttribute Image img,
                        HttpSession session,  Model model) {
	   
      Users users = (Users)session.getAttribute("loginUser");
      System.out.println("유저번호  : "+ users);
      Tool tool = mkService.selectTool(productNo);
      Food food = mkService.selectFood(productNo);
      Ingredient ingredient = mkService.selectIngrdient(productNo);
      System.out.println(tool);
      
     
		if(users != null) {
			int cart = eService.cartCount(users.getUsersNo());
			model.addAttribute("cart", cart);
		}
      
      
      
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int qnaCount = mkService.selectQnaCount(productNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, qnaCount, 5);
		
  
      Product p = mkService.selectProductSet(productNo);
      
      int resultCount = 1;
      if(users != null) {
    	  resultCount = mkService.addCount(productNo, users.getUsersNo());
      }
      
      r.setProductNo(productNo);
      
      
      
      HashMap<String, Integer> map = new HashMap<String, Integer>();
      if(users != null) {
    	  map.put("productNo", productNo);
    	  map.put("usersNo", users.getUsersNo());
      }else {
    	  map.put("productNo", productNo);
          map.put("usersNo", 0);
      }
    
      
      ArrayList<Orders> ordList = mkService.orderList(map);
      ArrayList<Options> options = mkService.selectOptionsSet(productNo);
      ArrayList<QA> qna = mkService.selectQnaList(pi, productNo);
      ArrayList<Image> ToolMainImage = selectImagList(productNo, 6, 0);
      ArrayList<Image> ToolsubImage = selectImagList(productNo, 6, 1);
      ArrayList<Image> foodMainImage = selectImagList(productNo, 3, 0);
      ArrayList<Image> foodsubImage = selectImagList(productNo, 3, 1);
      
      ArrayList<Review> list = mkService.selectReview(productNo);
      ArrayList<String> imglist = mkService.selectImgList(productNo);/*리뷰 사진만 가져오기*/
      int reviewCount = mkService.selectReviewCount(productNo);
      
      Integer starAvg = mkService.reviewAvg(productNo);
      
      if(tool != null) {
    	  model.addAttribute("toolMainImage", ToolMainImage);
    	  model.addAttribute("toolsubImage", ToolsubImage);
    	  model.addAttribute("tool", tool);
    	  
      }
      
      if(food != null) {
    	  model.addAttribute("food", food);
    	  model.addAttribute("foodMainImage", foodMainImage);
    	  model.addAttribute("foodsubImage", foodsubImage);
    	  
      }
      
      if(ingredient != null) {
          ArrayList<Image> ingredientMainImage = selectImagList(ingredient.getIngredientNo(), 5, 0);
          ArrayList<Image> ingredientsubImage = selectImagList(ingredient.getIngredientNo(), 5, 1);
    	  model.addAttribute("ingredient", ingredient);
    	  model.addAttribute("ingredientMainImage", ingredientMainImage);
    	  model.addAttribute("ingredientsubImage", ingredientsubImage);
    	  System.out.println(ingredient);
    	  System.out.println(ingredientMainImage);
    	  System.out.println(ingredientsubImage);
      }
      
      
      
      if(list != null) {
         model.addAttribute("list", list);
         model.addAttribute("starAvg", starAvg);
      }
      
      if(imglist != null) {
         model.addAttribute("imglist", imglist);
      }
      
      //로그인 한 회원이라면 
      if(users != null) {
    	  Integer result = mkService.selectLike(users.getUsersNo(), productNo);
          if(result != null && result >= 1) {
        	  model.addAttribute("like", result);
          }
      }
      
      
      model.addAttribute("reviewCount", reviewCount);
      
      
      model.addAttribute("qna", qna);
      model.addAttribute("qnaCount", qnaCount);
      model.addAttribute("pi", pi);
      model.addAttribute("p", p);
      model.addAttribute("options", options);
      model.addAttribute("ordList", ordList);
      return "market_detail";
   }
   
    
   @GetMapping("createqna.ma")
   	public String createqna(HttpSession session, Product p, Model model) {
	   Users users = (Users)session.getAttribute("loginUser");
	   model.addAttribute("productNo", p.getProductNo());
	   return "createQnA";
   }
   
   @PostMapping("insertReview.ma")
   public String insertReview(HttpSession session, 
                        @RequestParam ("productNo") int productNo,
                        @ModelAttribute Review r,
                        @ModelAttribute Image img,
                        @RequestParam(value="reviewScore", defaultValue = "0", required=false) int reviewScore,
                        @RequestParam (value = "imageFile", required = false) ArrayList<MultipartFile> imageFiles,
                        HttpServletRequest request,
                        Model model) {
      
      
      Users users = (Users)session.getAttribute("loginUser");
      r.setProductNo(productNo);
      r.setReviewContent(r.getReviewContent());
      r.setReviewScore(r.getReviewScore());
      r.setReviewWriter(users.getNickName());
      r.setUsersNo(r.getUsersNo());
      
      int result = mkService.insertReview(r);
      
      if(result > 0) {
         model.addAttribute("productNo", productNo);
         model.addAttribute("review", r);
      }
      
   
      if(imageFiles != null) {   
         int i = 0;
         int resultF = 0;
         int resultImg = 0;
         for(MultipartFile imageFile : imageFiles) {
            Image image = new Image();
            if(imageFile != null && !imageFile.isEmpty()) {
               String[] returnArr = saveFile(imageFile, request);
               if(returnArr[1] != null) {
                  image.setImageDivideNo(r.getReviewNo());
                  image.setImageType(7); /*리뷰는 7번*/
                  image.setImagePath(returnArr[0]);
                  image.setImageOriginalName(imageFile.getOriginalFilename());
                  image.setImageRenameName(returnArr[1]);
                  image.setImageLevel(1);
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
         
      }
      
      
      return "redirect:market_detail.ma";
   }
   
   
   
   @GetMapping("createReview.ma")
   public String createReview(HttpSession session, Product p, Model model) {
      Users users = (Users)session.getAttribute("loginUser");
      model.addAttribute("productNo", p.getProductNo());
      
      return "createReview";
   }
   
   public String[] saveFile(MultipartFile file, HttpServletRequest request) {
//      파일 저장소 지정
      String root = request.getSession().getServletContext().getRealPath("resources");   // webapp-resources 폴더 의미
//                          ┌ String에서 역슬래쉬를 표현하기 위해 '\\' 라고 적음  
      String savePath = root + "\\uploadFiles";
      File folder = new File(savePath);
      if(!folder.exists()) {
         folder.mkdirs();
      }
      
//      파일 이름 변경 형식 지정
      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
      int ranNum = (int)(Math.random()*100000);
      String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum 
                        + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
      
//      변경된 이름의 파일을 저장
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
      
      return "redirect:viewWhole.ma";
   }
   
   @RequestMapping("paySuccess.ma")
   public String paySuccess(HttpSession session, Model model, @RequestParam("use") String use, @RequestParam("preNo") String preorderNo, @RequestParam("plus") int plus) {
	  int usePoint = Integer.parseInt(use.split("원")[0]); //사용 포인트 
      Users users = (Users)session.getAttribute("loginUser");
      
      System.out.println("plus : " + plus);
      System.out.println("use : " + use);
      
      //포인트 테이블에 minus, plus 포인트 반영 
      Point p = new Point();
      p.setUsersNo(users.getUsersNo());
      
      //상품 하나하나가 들어옴 
      if(usePoint != 0) { //사용한 포인트가 있으면 
    	  int currentPoint = mkService.selectPoint(users.getUsersNo());
    	  p.setPointBefore(currentPoint);
    	  int minus = currentPoint-usePoint;
    	  p.setPointChange(minus); //현재-사용 금액
    	  p.setPointType(11);
    	  mkService.updatePointTable(p);
    	  
    	  int currentPointForUsers1 = mkService.selectPoint(users.getUsersNo());
    	  int minusForUsers = (currentPointForUsers1 - usePoint);
    	  users.setPoint(minusForUsers);
          mkService.updatePoint(users);
      }
      if(plus != 0) { // 추가 된 포인트가 있다면 
    	  int currentPoint2 = mkService.selectPoint(users.getUsersNo()); //33900원이 떠야 되는데....차감이 안됨 ?
          p.setPointBefore(currentPoint2);
          int plusPoint = currentPoint2+plus;
          p.setPointChange(plusPoint);
          p.setPointType(3);
          mkService.updatePointTable(p);
          
          int currentPointForUsers2 = mkService.selectPoint(users.getUsersNo());
    	  int plusForUsers = (currentPointForUsers2 + plus);
    	  users.setPoint(plusForUsers);
          mkService.updatePoint(users);
      }
      
      //장바구니에서 제거 
      String[] preorderNoArr = preorderNo.split(",");
      int[] preorderNoIntArr = new int[preorderNoArr.length];
      for (int i = 0; i < preorderNoArr.length; i++) {
          preorderNoIntArr[i] = Integer.parseInt(preorderNoArr[i]);
          mkService.deleteFromCart(preorderNoIntArr[i]);
      }
      if(users != null) {
    	  int cart = eService.cartCount(users.getUsersNo());
    	  session.setAttribute("cart", cart);
      }
      model.addAttribute("users", users);
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
      
   
   //獄쏄퀣 꽊筌욑옙  빊遺쏙옙 獄쏉옙 鈺곌퀬 돳
   @RequestMapping(value="insertShipping.ma", produces="application/json; charset=UTF-8")
   public void insertShipping(@ModelAttribute ShippingAddress sa, @RequestParam("postcode") String postcode, @RequestParam("addressInfo") String addressInfo, @RequestParam("detailAddress") String detailAddress,  HttpServletResponse response) {
      
      String[] addresses = new String[3];
      addresses[0] = postcode;
      addresses[1] = addressInfo;
      addresses[2] = detailAddress;
      sa.setAddress(Arrays.toString(addresses));
      
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
   @RequestMapping("insertCart.ma")
      public String insertCart(@ModelAttribute Cart c,HttpServletResponse response, Model model) {
      
      int result = mkService.insertCart(c);
      int cart = eService.cartCount(c.getUsersNo());
      System.out.println(cart);
      
//      response.setContentType("application/json; charset=utf-8");
//      GsonBuilder gb = new GsonBuilder();
//      Gson gson = gb.create();
//      
//      try {
//         gson.toJson(result, response.getWriter());
//         gson.toJson(cart, response.getWriter());
//         
//      } catch (JsonIOException e) {
//         e.printStackTrace();
//      } catch (IOException e) {
//         e.printStackTrace();
//      } 
      
      	JSONArray jArr = new JSONArray();
      	jArr.put(result);
      	jArr.put(cart);
		
		return jArr.toString();
      
//		JSONObject json = new JSONObject(); // map(키, 벨류)에 값 집어넣을때 "put" 이용
//		json.put("preNo", result);
//		json.put("cart", cart);
//		return json.toString();
   }
   
   @RequestMapping("goToPay.ma")
   public void goToPay(@ModelAttribute Cart c,HttpServletResponse response, Model model) {
   
   int result = mkService.goToPay(c);
   
   model.addAttribute("c", c);
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
//   
//   return "payDetail";
   
}
   
   

   //장바구니 목록 삭제 
   @RequestMapping(value="delBasket.ma", produces="application/json; charset=UTF-8")
   public String delBasket(@RequestParam("preorderNo") int preorderNo) {
      mkService.delBasket(preorderNo);
      return "basket";
   }
   
   
   @RequestMapping(value="plusCount.ma", produces="application/json; charset=UTF-8")
   public void plusCount(@RequestParam("preorderNo") int preorderNo, @RequestParam("price") int price, HttpServletResponse response) {
      mkService.plusCount(preorderNo);
      
      int size = mkService.plusResultCount(preorderNo);
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
   
   @RequestMapping(value="minusCount.ma", produces="application/json; charset=UTF-8")
   public void minusCount(@RequestParam("preorderNo") int preorderNo, @RequestParam("price") int price, HttpServletResponse response) {
	  mkService.minusCount(preorderNo);
      int size = mkService.plusResultCount(preorderNo);
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
      
      ShippingAddress sa = mkService.selectShippingForUpdate(shippingNo);
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
   public String delShipping(@RequestParam("shippingNo") int shippingNo) {
      int result = mkService.delShipping(shippingNo);
      return result >= 0 ? "yes" : "no";
   }
   
   @RequestMapping("foodMaterialMarcket.ma")
   public String foodMaterialMarcket(@RequestParam("productNo") int productNo,
					  			     @RequestParam(value="page", required=false) Integer currentPage,
					                 @ModelAttribute Review r,
					                 @ModelAttribute QA q,
					                 @ModelAttribute Image img,
					                 HttpSession session,  Model model) {
		Users users = (Users)session.getAttribute("loginUser");
		Tool tool = mkService.selectTool(productNo);
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		int qnaCount = mkService.selectQnaCount(productNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, qnaCount, 5);
		pi.setCurrentPage(1);
		pi.setBoardLimit(1000);
		
		
		Product p = mkService.selectProductSet(productNo);
		r.setProductNo(productNo);
		
		
		
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		if(users != null) {
		 map.put("productNo", productNo);
		 map.put("usersNo", users.getUsersNo());
		}else {
		 map.put("productNo", productNo);
		 map.put("usersNo", 0);
		}
		
		
		ArrayList<Orders> ordList = mkService.orderList(map);
		ArrayList<Options> options = mkService.selectOptionsSet(productNo);
		ArrayList<QA> qna = mkService.selectQnaList(pi, productNo);
		ArrayList<Image> mainImage = selectImagList(productNo, 6, 0);
		ArrayList<Image> subImage = selectImagList(productNo, 6, 1);
		ArrayList<Review> list = mkService.selectReview(productNo);
		ArrayList<String> imglist = mkService.selectImgList(productNo);/*리뷰 사진만 가져오기*/
		//System.out.println(imglist);
		int reviewCount = mkService.selectReviewCount(productNo);
		
		Integer starAvg = mkService.reviewAvg(productNo);
		
		if(mainImage != null) {
		 model.addAttribute("mainImage", mainImage);
		 model.addAttribute("subImage", subImage);
		}
		
		if(list != null) {
		model.addAttribute("list", list);
		model.addAttribute("starAvg", starAvg);
		}
		
		if(imglist != null) {
		model.addAttribute("imglist", imglist);
		}
		
		//로그인 한 회원이라면 
		if(users != null) {
		 Integer result = mkService.selectLike(users.getUsersNo(), productNo);
		 if(result != null && result >= 1) {
			  model.addAttribute("like", result);
		 }
		}
		
		
		model.addAttribute("reviewCount", reviewCount);
		model.addAttribute("tool", tool);
		model.addAttribute("qna", qna);
		model.addAttribute("qnaCount", qnaCount);
		model.addAttribute("pi", pi);
		model.addAttribute("p", p);
		model.addAttribute("options", options);
		model.addAttribute("ordList", ordList);

	   
	   return"market_detail_foodMaterial";
   }
   
   
   private ArrayList<Image> selectImagList(Integer imageDivideNo, int imageType, int imageLevel) {
      HashMap<String, Integer> map = new HashMap<String, Integer>();
      map.put("imageDivideNo", imageDivideNo);
      map.put("imageType", imageType);
      map.put("imageLevel", imageLevel);
      ArrayList<Image> imageList = mkService.selectImagList(map);
      return imageList;
   }
   
   
   @PostMapping("reviewAvgDesc.ma")
   public void reviewAvgDesc(@RequestParam ("productNo") int productNo, HttpServletResponse response, Model model) {
	   	
	   	ArrayList<Review> result = mkService.reviewAvgDesc(productNo);
	   	ArrayList<String> imgList = mkService.selectImgList(productNo);
	   	
	   	HashMap<String, Object> map = new HashMap<String, Object>();
	   	map.put("result", result);
	   	map.put("imgList", imgList);
	   	
	    response.setContentType("application/json; charset=UTF-8");
	      GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
	      Gson gson = gb.create();
	      try {
	         gson.toJson(map, response.getWriter());
	      } catch (JsonIOException | IOException e) {
	         e.printStackTrace();
	      }
	   	
   }
   
   @PostMapping("reviewDesc.ma")
   public void reviewDesc(@RequestParam ("productNo") int productNo, HttpServletResponse response, Model model) {
	   
	   ArrayList<Review> result = mkService.reviewDesc(productNo);
	   ArrayList<String> imgList = mkService.selectImgList(productNo);
	   
	   HashMap<String, Object> map = new HashMap<String, Object>();
	   map.put("result", result);
	   map.put("imgList", imgList);
	   
	   response.setContentType("application/json; charset=UTF-8");
	   GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
	   Gson gson = gb.create();
	   try {
		   gson.toJson(map, response.getWriter());
	   } catch (JsonIOException | IOException e) {
		   e.printStackTrace();
	   }
	   
   }
   
   
   @PostMapping("insertQna.ma")
   public String insertQna(QA qna,HttpSession session, @RequestParam ("productNo") int productNo, Model model) {
	   Users users = (Users)session.getAttribute("loginUser");
	   qna.setQnaContent(qna.getQnaContent());
	   qna.setUsersNo(users.getUsersNo());
	   qna.setQnaTitle(qna.getQnaTitle());
	   qna.setNickName(users.getNickName());
	   qna.setQnaType(qna.getQnaType());
	   qna.setProductNo(productNo);
	   int result = mkService.insertQna(qna);
	   
	   System.out.println(qna);
	   
	   if(result > 0) {
		   model.addAttribute("qna", qna);
		   model.addAttribute("productNo", productNo);
		   
	   }
	   
	   return "redirect:market_detail.ma";
   }
   
   @GetMapping("QnAdetail.ma")
   public String QnAdetail(@RequestParam ("usersNo") int usersNo, @RequestParam ("productNo") int productNo, @RequestParam("qnaNo") int qnaNo,Model model) {
	   HashMap<String, Object> map = new HashMap<String, Object>();
	   map.put("usersNo", usersNo);
	   map.put("productNo", productNo);
	   map.put("qnaNo", qnaNo);
	   ArrayList<QA> qnaList = mkService.qnalist(map);
	   if(qnaList != null) {
		   model.addAttribute("qnaList",qnaList);
	   }
	   return "QnAdetail";
   }
   
   
   @RequestMapping("insertPay.ma")
   @ResponseBody
   public String insertPay(@ModelAttribute Orders orders) {
	   
	   int selectProductType = mkService.selectProductType(orders.getProductNo());
	   orders.setProductType(selectProductType);
	   int result = mkService.insertPay(orders);
	   
	   if(result >= 1) {
		   return "success";
	   } else {
		   return "fail";
	   }
   }
	
   @RequestMapping("insertLike.ma")
   @ResponseBody
   public String insertLike(@RequestParam("usersNo") int usersNo, @RequestParam("divisionNo") int divisionNo) {
	   int result = mkService.insertLike(usersNo, divisionNo);
	   if(result >= 1) {
		   return "success";
	   } else {
		   return "fail";
	   }
   }
   
   @RequestMapping("deleteLike.ma")
   @ResponseBody
   public String deleteLike(@RequestParam("usersNo") int usersNo, @RequestParam("divisionNo") int divisionNo) {
	   int result = mkService.deleteLike(usersNo, divisionNo);
	   if(result >= 1) {
		   return "success";
	   } else {
		   return "fail";
	   }
   }
   
   //전체보기
   @RequestMapping("viewWhole.ma")
   public String viewWhole(Model model, @RequestParam(value="page", required=false) Integer currentPage, HttpSession session) {
	   
	   Users u = (Users)session.getAttribute("loginUser");
		if(u != null) {
			int cart = eService.cartCount(u.getUsersNo());
			session.setAttribute("cart", cart);
		}
	   
	   if(currentPage == null) {
		   currentPage = 1;
	   }
	   Food food = null; Tool tool = null; Ingredient ingre = null;
	   int listCount = mkService.selectViewWholeCount();
	   PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 15);
	   ArrayList<Product> list = mkService.selectViewWhole(pi);
	   //전체 상품 조회
	   if(!list.isEmpty()) {
		   for(Product lists : list) {
			   int productNo = lists.getProductNo(); String img = null;
			   food = mkService.selectFood(productNo); tool = mkService.selectTool(productNo); ingre = mkService.selectIngrdient(productNo);
			   if(food != null) {
				   lists.setProductName(food.getFoodName());
				   img = mkService.selectImg(productNo, 3);
			   } else if (tool != null) {
				   lists.setProductName(tool.getToolName());
				   img = mkService.selectImg(productNo, 6);
			   } else if (ingre != null) {
				   lists.setProductName(ingre.getIngredientName());
				   img = mkService.selectImg(ingre.getIngredientNo(), 5);
			   }
			   if(img != null) {
				   lists.setProductImg(img);
			   }
		   }
	   }
	   
	   ArrayList<Product> hotDeal = mkService.selectWholeHotDeal();
	   //가장 sale 높은 순 
	   if(!hotDeal.isEmpty()) {
		   for(Product lists : hotDeal) {
			   int productNo = lists.getProductNo(); String img = null; food = mkService.selectFood(productNo); tool = mkService.selectTool(productNo); ingre = mkService.selectIngrdient(productNo);
			   System.out.println("productNo : " + productNo);
			   if(food != null) {
				   lists.setProductName(food.getFoodName());img = mkService.selectImg(productNo, 3);
			   } else if (tool != null) {
				   lists.setProductName(tool.getToolName()); img = mkService.selectImg(productNo, 6);
			   } else if (ingre != null) {
				   lists.setProductName(ingre.getIngredientName()); img = mkService.selectImg(ingre.getIngredientNo(), 5);
			   }
			   if(img != null) {
				   lists.setProductImg(img);
			   }
		   }
	   }
	   
	   //전체 상품 중 좋아요가 많은 상위 8개 조회 
	   ArrayList<HashMap<String, Object>> likeOrderBy = mkService.selectLikeOrderBy();
	   ArrayList<Product> lists = new ArrayList<>();
	   if(!likeOrderBy.isEmpty()) {
		   for(HashMap<String, Object> map : likeOrderBy) {
			   int productNo = Integer.parseInt(map.get("PRODUCT_NO").toString()); 
			   String img = null; 
			   
			   food = mkService.selectFood(productNo); 
			   tool = mkService.selectTool(productNo); 
			   ingre = mkService.selectIngrdient(productNo);
			   
			   Product product = new Product();
			   product.setProductNo(productNo);
			   
			   if(food != null) {
				   product.setProductName(food.getFoodName());
				   product.setProductPrice(Integer.parseInt(map.get("PRODUCT_PRICE").toString()));
				   product.setProductSale(Integer.parseInt(map.get("PRODUCT_SALE").toString()));
				   img = mkService.selectImg(productNo, 3);
			   } else if (tool != null) {
				   product.setProductName(tool.getToolName());
				   product.setProductPrice(Integer.parseInt(map.get("PRODUCT_PRICE").toString()));
				   product.setProductSale(Integer.parseInt(map.get("PRODUCT_SALE").toString()));
				   img = mkService.selectImg(productNo, 6);
			   } else if (ingre != null) {
				   product.setProductName(ingre.getIngredientName()); 
				   product.setProductPrice(Integer.parseInt(map.get("PRODUCT_PRICE").toString()));
				   product.setProductSale(Integer.parseInt(map.get("PRODUCT_SALE").toString()));
				   img = mkService.selectImg(ingre.getIngredientNo(), 5);
			   }
			   if(img != null) {
				   product.setProductImg(img);
			   }
			   lists.add(product);
		   }
		   
	   }
	   
	   model.addAttribute("whole", "whole");
	   model.addAttribute("pi", pi);
	   model.addAttribute("list", list);
	   model.addAttribute("hotDeal", hotDeal);
	   model.addAttribute("like", lists);
	   
	   return "kitchenToolMainPage";
   }
   
   //식품
   @RequestMapping("viewFood.ma")
   public String viewFood(Model model, @RequestParam(value="page", required=false) Integer currentPage) {
	   //식품 - 밀키트,식재료 
	   if(currentPage == null) {
		   currentPage = 1;
	   }
	   Food food = null; Product pFood = null;
	   int listCount = mkService.selectViewFoodCount();
	   PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 15);
	   ArrayList<Food> list = mkService.selectViewFood(pi); ArrayList<Object> productInfo = new ArrayList<>();
	   //식품 전체 상품 조회
	   if(!list.isEmpty()) {
		   for(Food lists : list) {
			   int productNo = lists.getProductNo(); String img = null;
			   pFood = mkService.selectPfood(productNo); //food productNo에 대한 Product 테이블 조회 
			   pFood.setProductName(lists.getFoodName());
			   img = mkService.selectImg(productNo, 3);
			   if(img != null) {
				   pFood.setProductImg(img);
			   }
			   productInfo.add(pFood); 
		   }
	   }
		   
	   //HotDeal조회
	   Food hotFood = null;
	   ArrayList<Product> hotDeal = mkService.selectFoodHotDeal();
	   if(!hotDeal.isEmpty()) {
		   for(Product lists : hotDeal) {
			   int productNo = lists.getProductNo(); 
			   String img = null; 
			   hotFood = mkService.selectFood(productNo);
			   if(hotFood != null) {
				   lists.setProductName(hotFood.getFoodName());
			   }
			   img = mkService.selectImg(productNo, 3);
			   if(img != null) {
				   lists.setProductImg(img);
			   }
		   }
	   }
	   //식품 상품 중 좋아요가 많은 상위 8개 조회 
	   ArrayList<HashMap<String,Object>> likeOrderBy = mkService.selectLikeOrderByFood();
	   ArrayList<Product> lists = new ArrayList<>();
	   if(!likeOrderBy.isEmpty()) {
		   for(HashMap<String, Object> map : likeOrderBy) {
			   int productNo = Integer.parseInt(map.get("PRODUCT_NO").toString()); 
			   String img = null; 
			   food = mkService.selectFood(productNo); 
			   
			   Product product = new Product();
			   product.setProductNo(productNo);
			   
			   if(food != null) {
				   product.setProductName(food.getFoodName());
				   product.setProductPrice(Integer.parseInt(map.get("PRODUCT_PRICE").toString()));
				   product.setProductSale(Integer.parseInt(map.get("PRODUCT_SALE").toString()));
				   img = mkService.selectImg(productNo, 3);
			   if(img != null) {
				   product.setProductImg(img);
			   }
			   lists.add(product);
			   }
		   }
	   }
	   
	   model.addAttribute("foodView", "foodView");
	   model.addAttribute("pi", pi);
	   model.addAttribute("list", productInfo);
	   model.addAttribute("hotDeal", hotDeal);
	   model.addAttribute("like", lists);
	   
	   return "kitchenToolMainPage";
   }
   
   //식재료
   @RequestMapping("viewIngredient.ma")
   public String viewIngredient(Model model, @RequestParam(value="page", required=false) Integer currentPage) {
	  
	   //식재료 : 이미지 타입 5번 - 상품 타입 : 3번 
	   if(currentPage == null) {
		   currentPage = 1;
	   }
	   int listCount = mkService.selectViewIngreCount();
	   PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 15);
	   ArrayList<Ingredient> list = mkService.selectViewIngredient(pi);
	   ArrayList<Object> productInfo = new ArrayList<>(); Product pIngre = new Product();
	   //식재료 전체 상품 조회
	   if(!list.isEmpty()) {
		   for(Ingredient lists : list) {
			   int productNo = lists.getProductNo(); String img = null;
			   System.out.println("productNo : " + productNo);
			   pIngre = mkService.selectPIngre(productNo); //food productNo에 대한 Product 테이블 조회 
			   img = mkService.selectImg(lists.getIngredientNo(), 5);
			   if(pIngre != null) {
				   pIngre.setProductName(lists.getIngredientName());
				   if(img != null) {
					   pIngre.setProductImg(img);
				   }
			   }
			   productInfo.add(pIngre); 
		   }
	   }
	   //HotDeal조회
	   Ingredient hotIngre = null;
	   ArrayList<Product> hotDeal = mkService.selectIngreHotDeal();
	   ArrayList<Object> hotDeals = new ArrayList<>();
	   if(!hotDeal.isEmpty()) {
		   for(Product lists : hotDeal) {
			   int productNo = lists.getProductNo(); 
			   String img = null; 
			   hotIngre = mkService.selectIngrdient(productNo);
			   if(hotIngre != null) {
				   lists.setProductName(hotIngre.getIngredientName());
			   }
			   img = mkService.selectImg(hotIngre.getIngredientNo(), 5);
			   if(img != null) {
				   lists.setProductImg(img);
			   }
			   hotDeals.add(lists);
		   }
	   }
	   
	   //식재료 상품 중 좋아요가 많은 상위 8개 조회 
	   ArrayList<HashMap<String,Object>> likeOrderBy = mkService.selectLikeOrderByIngre();
	   ArrayList<Product> lists = new ArrayList<>();
	   if(!likeOrderBy.isEmpty()) {
		   for(HashMap<String, Object> map : likeOrderBy) {
			   int productNo = Integer.parseInt(map.get("PRODUCT_NO").toString()); 
			   String img = null; 
			   Ingredient ingre = mkService.selectIngrdient(productNo);
			   
			   Product product = new Product();
			   product.setProductNo(productNo);
			   
			  if (ingre != null) {
				   product.setProductName(ingre.getIngredientName()); 
				   product.setProductPrice(Integer.parseInt(map.get("PRODUCT_PRICE").toString()));
				   product.setProductSale(Integer.parseInt(map.get("PRODUCT_SALE").toString()));
				   img = mkService.selectImg(ingre.getIngredientNo(), 5);
			   }
			   if(img != null) {
				   product.setProductImg(img);
			   }
			   lists.add(product);
		   }
		   
	   }
	   
	   model.addAttribute("IngreView", "IngreView");
	   model.addAttribute("pi", pi);
	   model.addAttribute("list", productInfo);
	   model.addAttribute("hotDeal", hotDeals);
	   model.addAttribute("like", lists);
	   
	   return "kitchenToolMainPage";
   }
   
   //주방용품
   @RequestMapping("viewTool.ma")
   public String viewTool(Model model, @RequestParam(value="page", required=false) Integer currentPage) {
	   
	   //Tool : 이미지 타입 6번 - 상품 타입 : 4번
	   if(currentPage == null) {
		   currentPage = 1;
	   }
	   int listCount = mkService.selectViewToolCount();
	   PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 15);
	   ArrayList<Tool> list = mkService.selectViewTool(pi);
	   ArrayList<Object> productInfo = new ArrayList<>(); Product pTool = new Product();
	   //도구 전체 상품 조회
	   if(!list.isEmpty()) {
		   for(Tool lists : list) {
			   int productNo = lists.getProductNo(); String img = null;
			   pTool = mkService.selectPIngre(productNo); //food productNo에 대한 Product 테이블 조회 
			   if(pTool != null) {
				   pTool.setProductName(lists.getToolName());
			   }
			   img = mkService.selectImg(lists.getProductNo(), 6);
			   if(img != null) {
				   pTool.setProductImg(img);
			   }
			   productInfo.add(pTool); 
		   }
	   }
	   //HotDeal조회
	   Tool hotTool = null;
	   ArrayList<Product> hotDeal = mkService.selectToolHotDeal();
	   ArrayList<Object> hotDeals = new ArrayList<>();
	   System.out.println("hotDeal : " + hotDeal);
	   if(!hotDeal.isEmpty()) {
		   for(Product lists : hotDeal) {
			   int productNo = lists.getProductNo(); 
			   System.out.println("productNo : " + productNo);
			   String img = null; 
			   hotTool = mkService.selectTool(productNo);
			   if(hotTool != null) {
				   lists.setProductName(hotTool.getToolName());
			   }
			   System.out.println("htPN : "+ hotTool.getProductNo());
			   img = mkService.selectImg(hotTool.getProductNo(), 6);
			   if(img != null) {
				   lists.setProductImg(img);
			   }
			   hotDeals.add(lists);
		   }
	   }
	   
	   
	   //도구 상품 중 좋아요가 많은 상위 8개 조회 
	   ArrayList<HashMap<String,Object>> likeOrderBy = mkService.selectLikeOrderByTool();
	   ArrayList<Product> lists = new ArrayList<>();
	   if(!likeOrderBy.isEmpty()) {
		   for(HashMap<String, Object> map : likeOrderBy) {
			   int productNo = Integer.parseInt(map.get("PRODUCT_NO").toString()); 
			   String img = null; 
			   
			   Tool tool = mkService.selectTool(productNo); 
			   
			   Product product = new Product();
			   product.setProductNo(productNo);
			   
			   if (tool != null) {
				   product.setProductName(tool.getToolName());
				   product.setProductPrice(Integer.parseInt(map.get("PRODUCT_PRICE").toString()));
				   product.setProductSale(Integer.parseInt(map.get("PRODUCT_SALE").toString()));
				   img = mkService.selectImg(productNo, 6);
			   if(img != null) {
				   product.setProductImg(img);
			   }
			   lists.add(product);
		   }
		   
		   }
	   
	   }
	   
	   
	   model.addAttribute("ToolView", "ToolView");
	   model.addAttribute("pi", pi);
	   model.addAttribute("list", productInfo);
	   model.addAttribute("hotDeal", hotDeals);
	   model.addAttribute("like", lists);
	   
	   return "kitchenToolMainPage";
   }
   
   @RequestMapping("viewSearch.ma")
   public String viewSearch(@RequestParam(value="page", required=false) Integer currentPage,
		   					@RequestParam(value="searchStart", required=false) String searchStart,
		   					@RequestParam("searchType") String searchType,
		   					@RequestParam("searchText") String searchText,
		   					Model model){
	   
	   if(currentPage == null || (searchStart != null && searchStart.equals("Y"))) {
		   currentPage = 1;
	   }
	   HashMap<String, String> map = new HashMap<String, String>();
	   map.put("searchType", searchType);
	   map.put("searchText", searchText);
	   
	   int listCount = mkService.selectViewSearchCount(map);
	   PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 15);
	   ArrayList<Product> list = mkService.selectViewSearch(pi, map);
	   
	   for(Product p:list) {
		   System.out.println(p);
	   }
	   //전체 상품 조회
	   if(!list.isEmpty()) {
		   for(Product lists : list) {
			   int productNo = lists.getProductNo(); 
			   String img = null;
			   switch(lists.getProductType()) {
			   case 1: Food f = mkService.selectFood(productNo);
		   				lists.setProductName(f.getFoodName());
			   			img = mkService.selectImg(productNo, 3); break;
			   case 3: Ingredient igd = mkService.selectIngrdient(productNo);
					    lists.setProductName(igd.getIngredientName());
			   			img = mkService.selectImg(igd.getIngredientNo(), 6); break;
			   case 4: Tool t = mkService.selectTool(productNo);
					    lists.setProductName(t.getToolName());
				   		img = mkService.selectImg(productNo, 5); break;
			   }
			   if(img != null) {
				   lists.setProductImg(img);
			   }
		   }
	   }
	   
	   for(Product p:list) {
		   System.out.println(p);
	   }
	   model.addAttribute("searchType", searchType);
	   model.addAttribute("searchText", searchText);
	   model.addAttribute("pi", pi);
	   model.addAttribute("list", list);
	   
	   return "kitchenToolMainSearchPage";
   }
   
   
   // 후기 조회
   @RequestMapping("editReview.ma")
   public String editReview(Model model, @RequestParam("reviewNo") int reviewNo) {
	   ArrayList<HashMap<String, Object>> list = mkService.selectDetailReview(reviewNo);
	
	   model.addAttribute("list", list);
	
	   return "updateReview";
   }
   
   @RequestMapping("updateReview.ma")
   public String updateReview(@ModelAttribute Review r, @RequestParam(value = "deleteAttm", required = false) String[] deleteAttm,
		   					  @RequestParam(value = "file", required = false) ArrayList<MultipartFile> files,
		   					  HttpServletRequest request, Model model) {
	   ArrayList<String> delRename = new ArrayList<>();
	   
	   if(deleteAttm != null) {
		   for(String rename : deleteAttm) {
			   if(!rename.equals("")) {
				   String[] split = rename.split("/");
				   delRename.add(split[0]);
			   }
		   }
	   }
	   
	   int deleteImageResult = 0;
	   if(!delRename.isEmpty()) {
		   deleteImageResult = mkService.deleteImage(delRename);
		   if(deleteImageResult > 0) {
			   for(String rename : delRename) {
				   deleteFile(rename, request);
			   }
		   }
	   }
	   
	   if(files != null) {
		   Image image = null;
		   for(int i = 0; i < files.size(); i++) {
			   MultipartFile upload = files.get(i);
			   if(!upload.getOriginalFilename().equals("")) {
				   String[] returnArr = saveFile(upload, request);
				   if(returnArr != null) {
					   image = new Image();
					   image.setImageOriginalName(upload.getOriginalFilename());
					   image.setImageRenameName(returnArr[1]);
					   image.setImagePath(returnArr[0]);
					   image.setImageDivideNo(r.getReviewNo());
					   image.setImageType(7);
					   image.setImageLevel(1);
					   
					   int updateImageResult = mkService.insertImage(image);
				   }
			   }
		   }
	   }
	   
	   int updateReviewResult = mkService.updateReview(r);
	   
	   if(updateReviewResult > 0) {
		   model.addAttribute("productNo", r.getProductNo());
	       model.addAttribute("review", r);
	       return "redirect:market_detail.ma";
	   } else {
		   throw new MarketException("수정 실패");
	   }
	   
   }
   
   // 후기 삭제
   @RequestMapping("deleteReview.ma")
   public String deleteReview(@RequestParam("productNo") int productNo, @RequestParam("reviewNo") int reviewNo, Model model) {
	   int result = mkService.deleteReview(reviewNo);
	   
	   if(result > 0) {
		   return "redirect:market_detail.ma?productNo=" + productNo;
	   } else {
		   throw new MarketException("후기 삭제 실패");
	   }
   }
   
   @RequestMapping(value="foodDropDownSelect.ma", produces="application/json; charset=UTF-8")
   public void foodDropDownSelect(int foodType, int foodKind, @RequestParam(value="page", required=false) Integer currentPage, HttpServletResponse response) {
	   
	   if(currentPage == null) {
		   currentPage = 1;
	   }
	   ArrayList<Food> foodList = new ArrayList<>();
	   int listCount = 0;
	   PageInfo pi = null;
	   if(foodType == 0 && foodKind == 0) {
		   listCount = mkService.selectViewFoodCount();
		   pi = Pagination.getPageInfo(currentPage, listCount, 15);
		   foodList = mkService.selectViewFood(pi);
	   } else if (foodType >= 1 && foodKind >= 1) {
		   listCount = mkService.selectFoodKindTypeCount(foodType, foodKind);
		   pi = Pagination.getPageInfo(currentPage, listCount, 15);
		   foodList = mkService.selectFoodKindType(pi, foodType, foodKind);
	   } else if (foodType == 0 && foodKind >= 1) {
		   listCount = mkService.selectFoodKindCount(foodKind);
		   pi = Pagination.getPageInfo(currentPage, listCount, 15);
		   foodList = mkService.selectFoodKind(foodKind, pi);
	   } else if (foodType >= 1 && foodKind == 0) {
		   listCount = mkService.selectFoodTypeCount(foodType);
		   pi = Pagination.getPageInfo(currentPage, listCount, 15);
		   foodList = mkService.selectFoodType(foodType, pi);
	   }
	   
	   
	   Food food = null; Product pFood = null;
//	   int listCount = mkService.selectViewFoodCount();
//	   PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 15);
	    ArrayList<Object> productInfo = new ArrayList<>();
	   //식품 전체 상품 조회
	   if(!foodList.isEmpty()) {
		   for(Food lists : foodList) {
			   int productNo = lists.getProductNo(); String img = null;
			   pFood = mkService.selectPfood(productNo); //food productNo에 대한 Product 테이블 조회 
			   pFood.setProductName(lists.getFoodName());
			   img = mkService.selectImg(productNo, 3);
			   if(img != null) {
				   pFood.setProductImg(img);
			   }
			   productInfo.add(pFood); 
		   }
	   }
	   
	   response.setContentType("application/json; charset=UTF-8");
       GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd");
       Gson gson = gb.create();
       try {
          gson.toJson(productInfo, response.getWriter());
       } catch (JsonIOException | IOException e) {
          e.printStackTrace();
       }
	   
   	 }
		
   
   
   	@RequestMapping("inputCartCount.ma")
   	@ResponseBody
   	public String inputCartCount(int preorderNo, int size) {
   		int result = mkService.updateCartCount(preorderNo, size);
   		
   		return result >= 0? "yes" : "no";
   	}
   
   
   
   }
   
