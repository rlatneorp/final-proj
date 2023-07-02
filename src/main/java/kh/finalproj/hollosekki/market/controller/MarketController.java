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

import kh.finalproj.hollosekki.common.Pagination;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Point;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
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

   @RequestMapping("basket.ma")
   public String pay(HttpSession session, Model model) {
      
      Users users = (Users)session.getAttribute("loginUser");
      int userNo = users.getUsersNo();
      
      ArrayList<Cart> cartList = mkService.selectCartList(userNo);
      
      ArrayList<Product> selectProductInfo = new ArrayList<>(); 
      Food foods = null; Tool tools = null; Ingredient igs = null; Menu menus = null;
      
      ArrayList<Cart> optionNos = new ArrayList<>();
      
      for(Cart cart : cartList) {
    	  ArrayList<Options> optValues = new ArrayList<>();
         int productNo = cart.getProductNo();
         System.out.println("productNo : " + productNo);
         
         //주문 번호에 대한 optionNo 조회 
         ArrayList<Options> o = mkService.selectOptionInfo(cart.getPreorderNo());
         System.out.println("주문번호에 해당 되는 옵션 정보는?? : " + o);
         
         cart.setOptionName(o);
        
         
         
         
         ArrayList<Options> options = mkService.selectOptions(productNo);
         
         //카트List에 담긴 productNo마다 어떤 종류가 올 지 모르기 때문에 하나하나 셀렉 해옴 
         foods = mkService.selectFood(productNo);
         System.out.println("foods : " + foods);
         tools = mkService.selectTool(productNo);
         igs = mkService.selectIngrdient(productNo);
         System.out.println("igs : " + igs);
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
         if (foods != null) { //이미지 타입 : 3 ( 식품 ) 
            cart.setProductName(foods.getFoodName());
            String imgName = mkService.selectImg(productNo, 3);
            cart.setImgName(imgName);
          }
          if (tools != null) { //이미지 타입 : 6 ( 주방도구)
             cart.setProductName(tools.getToolName());
             String imgName = mkService.selectImg(productNo, 6);
            cart.setImgName(imgName);
          }
          if (igs != null) { //이미지 타입 :5 (식재료) 
             cart.setProductName(igs.getIngredientName());
             String imgName = mkService.selectImg(productNo, 5);
            cart.setImgName(imgName);
          }
          if (menus != null) { //이미지 타입 : 4 (식단)
             cart.setProductName(menus.getMenuName());
             String imgName = mkService.selectImg(productNo, 4);
             cart.setImgName(imgName);
          }
      }
//      System.out.println("optValues " + optValues);
//      model.addAttribute("optValues", optValues);
      System.out.println("cartList : " + cartList);
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
      
      //옵션 
      ArrayList<Cart> optionNos = new ArrayList<>(); ArrayList<Options> optValues = new ArrayList<>();
      
      String[] preorderNo = preorderNos.split(",");
      System.out.println("preorderNo : " + preorderNo);
      for(int i=0; i<preorderNo.length; i++) {
    	  int preNo = Integer.parseInt(preorderNo[i]);
    	  System.out.println("preNo : " + preNo);
    	  //주문번호로 cartList 조회 
          checkedCart = mkService.checkCartList(users.getUsersNo(), preNo);
          System.out.println("cartList : " + checkedCart);
          //주문 번호에 대한 optionNo 조회 
          ArrayList<Options> o = mkService.selectOptionInfo(preNo);
          System.out.println("주문번호에 해당 되는 옵션 정보는??2222 : " + o);
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
            	  String imgName = mkService.selectImg(productNo, 5);
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
      
//      int[] intOptionNo = new int[preorderNo.length];
      
//      for(int i=0; i<optNo.length; i++) {
//         intOptionNo[i] = Integer.parseInt(optNo[i]);
//         System.out.println("intOptionNo : " + intOptionNo[i]);
//         int preorderNo = intOptionNo[i];
//         
//         //주문번호로 cartList 조회 
//         checkedCart = mkService.checkCartList(users.getUsersNo(),preorderNo);
//         
//         for(Cart checCart : checkedCart) { 
//            int productNo = checCart.getProductNo();
//            
//            Options opt = mkService.selectOptionInfo(checCart.getProductNo(), checCart.getProductOption()); //옵션 넘버 보내서 조회
//            optValues.add(opt);
//            
//            foods = mkService.selectFood(productNo);
//            tools = mkService.selectTool(productNo);
//            igs = mkService.selectIngrdient(productNo);
//            menus = mkService.selectMenu(productNo);
//            
//            productInfo = mkService.selectProductInfo(productNo);
//            int price = 0; int sum = 0; int sale = 0;
//            for (Product product : productInfo) {
//                price = product.getProductPrice();
//                checCart.setProductPrice(price); 
//                checCart.setSale(product.getProductSale());
//            }
//            int size = mkService.plusResultCount(productNo);
//            sum = size * price;
//            checCart.setSum(sum);
//            
//            if (foods != null) { //이미지 타입 : 3 ( 식품 ) 
//               checCart.setProductName(foods.getFoodName());
//               String imgName = mkService.selectImg(productNo, 3);
//               checCart.setImgName(imgName);
//             }
//             if (tools != null) { //이미지 타입 : 6 ( 주방도구)
//                checCart.setProductName(tools.getToolName());
//                String imgName = mkService.selectImg(productNo, 6);
//               checCart.setImgName(imgName);
//             }
//             if (igs != null) { //이미지 타입 : 5 (식재료) 
//                checCart.setProductName(igs.getIngredientName());
//                String imgName = mkService.selectImg(productNo, 5);
//               checCart.setImgName(imgName);
//             }
//             if (menus != null) { //이미지 타입 : 4 (식단)
//                checCart.setProductName(menus.getMenuName());
//                String imgName = mkService.selectImg(productNo, 4);
//               checCart.setImgName(imgName);
//             }
//             checkedCartList.add(checCart);
//         }
//      }
      int point = mkService.selectPoint(users.getUsersNo());
      
      
      model.addAttribute("point", point);
      model.addAttribute("checkedCartList", checkedCartList );
      System.out.println("cc : " + checkedCartList);
      model.addAttribute("optValues", optValues);
      return "payDetail";
   }

   @GetMapping("market_detail.ma")
   public String marketdetail(@RequestParam("productNo") int productNo,
		   				@RequestParam(value="page", required=false) Integer currentPage,
                        @ModelAttribute Review r,
                        @ModelAttribute QA q,
                        @ModelAttribute Image img,
                        HttpSession session, Model model) {
      Users users = (Users)session.getAttribute("loginUser");
      Tool tool = mkService.selectTool(productNo);
		if(currentPage == null) {
			currentPage = 1;
		}
		int qnaCount = mkService.selectQnaCount(productNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, qnaCount, 5);
		pi.setCurrentPage(1);
		pi.setBoardLimit(1000);
      ArrayList<Options> options = mkService.selectOptionsSet(productNo);
      ArrayList<QA> qna = mkService.selectQnaList(pi, productNo);
      Product p = mkService.selectProductSet(productNo);
      r.setProductNo(productNo);
//      r.setReviewScore();
      System.out.println(qna);
      
      
      
      ArrayList<Image> mainImage = selectImagList(productNo, 6, 1);
      ArrayList<Review> list = mkService.selectReview(productNo);
      ArrayList<String> imglist = mkService.selectImgList(productNo);/*리뷰 사진만 가져오기*/
      int reviewCount = mkService.selectReviewCount(productNo);
      
      int starAvg = mkService.reviewAvg(productNo);
      
      
      if(mainImage != null) {
    	  model.addAttribute("mainImage", mainImage);
      }
      
      if(list != null) {
         model.addAttribute("list", list);
         model.addAttribute("starAvg", starAvg);
      }
      
      if(imglist != null) {
         model.addAttribute("imglist", imglist);
      }
      
      
      model.addAttribute("reviewCount", reviewCount);
      model.addAttribute("tool", tool);
      model.addAttribute("qna", qna);
      model.addAttribute("qnaCount", qnaCount);
      model.addAttribute("pi", pi);
      model.addAttribute("p", p);
      model.addAttribute("options", options);
      return "market_detail";
   }
   

   @GetMapping("createqna.ma")
   	public String createqna(HttpSession session, Product p, Model model) {
	   Users users = (Users)session.getAttribute("loginUser");
	   System.out.println(p);
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
      
      return "kitchenToolMainPage";
   }
   
   @RequestMapping("paySuccess.ma")
   public String paySuccess(HttpSession session, Model model, @RequestParam("use") String use, @RequestParam("preNo") String preorderNo, @RequestParam("plus") int plus) {
	  System.out.println("preorderNo : " + preorderNo);
	  int usePoint = Integer.parseInt(use.split("원")[0]); //사용 포인트 
      Users users = (Users)session.getAttribute("loginUser");
      
      //users테이블 
      //포인트 차감은 최초 1번만, 포인트 +는 여러 번.... 
//      int currentPointForUserTable = mkService.selectPoint(users.getUsersNo()); //보유 포인트 
//      int minusPoint = currentPointForUserTable - usePoint; //보유 포인트 - 사용 포인트
//      int resultPoint = minusPoint + plus; //보유 포인트 + 추가 포인트
//      
//      users.setPoint(resultPoint);
//      mkService.updatePoint(users); //변경 된 포인트 반영 
      
      //포인트 테이블에 minus, plus 포인트 반영 
      Point p = new Point();
      p.setUsersNo(users.getUsersNo());
      //minus
      
      //상품 하나하나가 들어옴 
      
      if(usePoint != 0) { //사용한 포인트가 있으면 
    	  System.out.println("사용한 포인트가 있다.");
    	  System.out.println("usePoint1 : " + usePoint);
    	  int currentPoint = mkService.selectPoint(users.getUsersNo());
    	  System.out.println("currentPoint1111 : " + currentPoint);
    	  p.setPointBefore(currentPoint);
    	  int minus = currentPoint-usePoint;
    	  System.out.println("minus : " + minus);
    	  p.setPointChange(minus); //현재-사용 금액
    	  p.setPointType(11);
    	  mkService.updatePointTable(p);
      }
      if(plus != 0) { // 추가 된 포인트가 있다면 
    	  System.out.println("추가 한 포인트가 있다." + plus);
    	  int currentPoint2 = mkService.selectPoint(users.getUsersNo()); //33900원이 떠야 되는데....차감이 안됨 ?
    	  System.out.println("currentPoint2222 : " + currentPoint2);
          p.setPointBefore(currentPoint2);
          int plusPoint = currentPoint2+plus;
          System.out.println("plusPoint : " + plusPoint);
          p.setPointChange(plusPoint);
          p.setPointType(3);
          mkService.updatePointTable(p);
      }
      //users테이블에 총 포인트 반영 
      int currentPointForUsers = mkService.selectPoint(users.getUsersNo());
      users.setPoint(currentPointForUsers);
      mkService.updatePoint(users);
      
      //장바구니에서 제거 
      String[] preorderNoArr = preorderNo.split(",");
      int[] preorderNoIntArr = new int[preorderNoArr.length];
      for (int i = 0; i < preorderNoArr.length; i++) {
          preorderNoIntArr[i] = Integer.parseInt(preorderNoArr[i]);
          mkService.deleteFromCart(preorderNoIntArr[i]);
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
   
   
   @RequestMapping("insertCart.ma")
      public void insertCart(@ModelAttribute Cart c,HttpServletResponse response) {

      
//      System.out.println(pNo);
      int result = mkService.insertCart(c);
      
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
   
//   @ResponseBody
//   @RequestMapping("highScrore_review.ma")
//   public String highScrore(HttpServletResponse response, @ModelAttribute Review r) {
//	  int result = mkService.highScrore(r);
//	   
//      response.setContentType("application/json; charset=utf-8");
//      GsonBuilder gb = new GsonBuilder();
//      Gson gson = gb.create();
//      gson.toJson(result, response.getWriter());
//	   return "market_detail";
//   }
//   
   
   

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
      System.out.println("size : " + size);
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
   public void minusCount(@RequestParam("preorderNo") int preorderNo, @RequestParam("price") int price, HttpServletResponse response) {
      System.out.println("minus : " + preorderNo);
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
   public String delShipping(@RequestParam("shippingNo") int shippingNo) {
      int result = mkService.delShipping(shippingNo);
      return result >= 0 ? "yes" : "no";
   }
   
   @RequestMapping("foodMaterialMarcket.ma")
   public String foodMaterialMarcket() {
	   return"market_detail_foodMaterial";
   }
   
   
   private ArrayList<Image> selectImagList(int imageDivideNo, int imageType, int imageLevel) {
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
	   qna.setQnaCategory(qna.getQnaCategory());
	   int result = mkService.insertQna(qna);
	   
	   System.out.println(qna);
	   
	   if(result > 0) {
		   model.addAttribute("qna", qna);
		   model.addAttribute("productNo", productNo);
		   
	   }
	   
	   return "redirect:market_detail.ma";
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
	
//   public String insertPay(@ModelAttribute Orders orders) {
//	   
//	   int selectProductType = mkService.selectProductType(orders.getProductNo());
//	   orders.setProductType(selectProductType);
////	   int result = mkService.insertPay(orders);
////	   
////	   if(result >= 1) {
////		   return "success";
////	   } else {
////		   return "fail";
////	   }
////	   
//	   return "market_detail";
//   }
}
