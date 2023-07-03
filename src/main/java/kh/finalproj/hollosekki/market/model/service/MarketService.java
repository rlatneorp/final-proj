package kh.finalproj.hollosekki.market.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Point;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.dao.MarketDAO;
import kh.finalproj.hollosekki.market.model.vo.Attendance;
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

@Service("mkService")
public class MarketService {
   
   @Autowired
   private SqlSessionTemplate sqlSession;
   @Autowired
   private MarketDAO mkDAO;

//   public int insertCart(HashMap<String, String> result) {
//      return mkDAO.insertCart(sqlSession,result);
//   }

   public void attendanceCheck(HashMap<String, String> map) {
      mkDAO.attendanceCheck(sqlSession, map);
   }

   public void attendanceDay(HashMap<String, String> map) {
      mkDAO.attendanceDay(sqlSession, map);
   }

   public void firstAdDay(HashMap<String, String> map) {
      mkDAO.firstAdDay(sqlSession, map);
   }
   
   // 뛾 룄 ｏ옙苑딁춯 쉻 삕 占쎈퉲 겫 룞 삕
   public int insertShipping(ShippingAddress sa) {
      return mkDAO.insertShipping(sqlSession, sa);
   }
   
   // 뛾 룄 ｏ옙苑딁춯 쉻 삕  댖怨뚰 э옙 뤂
   public ArrayList<ShippingAddress> selectShipping(int usersNo) {
      return mkDAO.selectShipping(sqlSession, usersNo);
   }

   public int aDateCheck(HashMap<String, Object> map) {
      return mkDAO.aDateCheck(sqlSession, map);
   }

   public void checkDay(HashMap<String, String> map) {
      mkDAO.checkDay(sqlSession, map);
   
   }


   public ArrayList<Attendance> allAt(Users u) {
      return mkDAO.allAt(sqlSession, u);
   }

   public void atInsert(HashMap<String, Object> map) {
      mkDAO.atInsert(sqlSession, map);
   }

   public void gettedPoint(HashMap<String, Object> map) {
      mkDAO.gettedPoint(sqlSession, map);
   }

   public int atTodayChecked(Users u) {
      return mkDAO.atTodayChecked(sqlSession, u);
   }

   public ArrayList<Cart> selectCartList(int userNo) {
      return mkDAO.selectCartList(sqlSession, userNo);
   }

   public ArrayList<Options> selectOptions(int productNo) {
      return mkDAO.selectOptions(sqlSession, productNo);
   }

   public ArrayList<Product> selectProductList(int productNo) {
      return mkDAO.selectProductList(sqlSession, productNo);
   }

   public Food selectFood(int productNo) {
      return mkDAO.selectFood(sqlSession, productNo);
   }

   public Tool selectTool(int productNo) {
      return mkDAO.selectTool(sqlSession, productNo);
   }

   public Ingredient selectIngrdient(int productNo) {
      return mkDAO.selectIngrdient(sqlSession, productNo);
   }

   public void delBasket(int preorderNo) {
      mkDAO.delBasket(sqlSession, preorderNo);
   }

   public ArrayList<Product> selectProductInfo(int productNo) {
      return mkDAO.selectProductInfo(sqlSession, productNo);
   }

   public int plusCount(int preorderNo) {
      return mkDAO.plusCount(sqlSession, preorderNo);
   }

   public int plusResultCount(int preorderNo) {
      return mkDAO.plusResultCount(sqlSession, preorderNo);
   }

   public void minusCount(int preorderNo) {
      mkDAO.minusCount(sqlSession, preorderNo);
   }

   public ArrayList<Cart> checkCartList(int usersNo, int preorderNo) {
      return mkDAO.checkCartList(sqlSession, usersNo, preorderNo);
   }

      
   public void updateOptionNo(Cart cart) {
      mkDAO.updateOptionNo(sqlSession, cart);
   }

   public String selectOptionValue(int optionNo) {
      return mkDAO.selectOptionValue(sqlSession, optionNo);
   }

   
   public void getMonthPoint(HashMap<String, Object> map) {
      mkDAO.getMonthPoint(sqlSession, map);
   }

   public Users sendPoint(Users u) {
      return mkDAO.sendPoint(sqlSession, u);
   }

//
//   public ArrayList<Cart> selectOptionNo(int i) {
//      // TODO Auto-generated method stub
//      return mkDAO.selectOptionNo(sqlSession, i);
//   }
//
//   public ArrayList<Cart> selectOptionVal(int preorderNo) {
//      return mkDAO.selectOptionVal(sqlSession, preorderNo);
//   }

   public ArrayList<Cart> selectOptionNo(Cart cart) {
      return mkDAO.selectOptionNo(sqlSession, cart);
   }

   public Options selectOptionInfo(Cart cart) {
      return mkDAO.selectOptionInfo(sqlSession, cart);
   }

   public Options selectOptions(Cart cart) {
      return mkDAO.selectOptions(sqlSession, cart);
   }

   public Options selectOptionInfo(int productNo, int productOption) {
      return mkDAO.selectOptionInfo(sqlSession, productNo, productOption);
   }

   public ArrayList<Options> selectOptionsSet(int productNo) {
      return mkDAO.selectOptionSet(sqlSession, productNo);
   }

   public Product selectProductSet(int productNo) {
      return mkDAO.selectProductSet(sqlSession,productNo);
   }
   
   // 닔 젙 븷 諛곗넚吏  議고쉶 
   public ShippingAddress selectShippingForUpdate(int shippingNo) {
      return mkDAO.selectShippingForUpdate(sqlSession, shippingNo);
   }
   
   //諛곗넚吏   닔 젙 
   public void updateConfirmShipping(ShippingAddress sa) {
      mkDAO.updateConfirmShipping(sqlSession, sa);
   }
   
   // 꽑 깮 븳 諛곗넚吏  議고쉶 
   public ShippingAddress selectChecShip(int shippingNo) {
      return mkDAO.selectChecShip(sqlSession, shippingNo);
   }

   //productNo 뿉    븳 硫붾돱 議고쉶 
   public Menu selectMenu(int productNo) {
      return mkDAO.selectMenu(sqlSession, productNo);
   }

   public int insertCart(Cart c) {
      return mkDAO.insertCart(sqlSession, c);
   }

	public int delShipping(int shippingNo) {
		return mkDAO.delShipping(sqlSession, shippingNo);
	}

	public int insertImage(Image image) {
		return mkDAO.insertImage(sqlSession, image);
	}
	
	public ArrayList<Review> selectReview(int productNo) {
		return mkDAO.selectReview(sqlSession,productNo);
	}

   public int selectReviewCount(int productNo) {
      return mkDAO.selectReviewCount(sqlSession, productNo);
   }

	public ArrayList<String> selectImgList(int productNo) {
		return mkDAO.selectImgList(sqlSession, productNo);
	}
	//장바구니 상품에 대한 이미지 조회 
	public String selectImg(int productNo, int i) {
		return mkDAO.selectImg(sqlSession, productNo, i);
	}
	//장바구니 상품에 대한 이미지 조회 
//	public String selectImg(int productNo, int i) {
//		return mkDAO.selectImg(sqlSession, productNo, i);
//	}

	public ArrayList<Image> selectImagList(HashMap<String, Integer> map) {
		return mkDAO.selectImageList(sqlSession, map);
	}
	
	public int selectPoint(int usersNo) {
		return mkDAO.selectPoint(sqlSession, usersNo);
	}
//	public ShippingAddress selectShippingForUpdate(int shippingNo) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	public int insertReview(Review r) {
		return mkDAO.insertReview(sqlSession, r);
	}

	public int insertPay(Orders orders) {
		return mkDAO.insertPay(sqlSession, orders);
	}
	
	//재고 조회
	public int selectStock(int productNo) {
		return mkDAO.selectStock(sqlSession, productNo);
	}
	//포인트 update 
	public void updatePoint(Users users) {
		mkDAO.updatePoint(sqlSession, users);
	}

	public Integer reviewAvg(int productNo) {
		return mkDAO.reviewAvg(sqlSession, productNo);
	}

	public ArrayList<Review> reviewAvgDesc(int productNo) {
		return mkDAO.reviewAvgDesc(sqlSession, productNo);
		
	}
	//구매 후 장바구니에서 제거
	public void deleteFromCart(int preorderNo) {
		mkDAO.deleteFromCart(sqlSession, preorderNo);
	}

	public int selectProductType(int productNo) {
		return mkDAO.selectProductType(sqlSession, productNo);
	}

	public ArrayList<Review> reviewDesc(int productNo) {
		return mkDAO.reviewDesc(sqlSession,productNo);
	}

	public int orderSearchCount(Properties prop) {
		return mkDAO.orderSearchCount(sqlSession, prop);
	}

	public ArrayList<Map<String, Object>> orderSearch(Properties prop, PageInfo pi) {
		return mkDAO.orderSearch(sqlSession, prop, pi);
	}

	public int orderPeriodSearchCount(Properties prop) {
		return mkDAO.orderPeriodSearchCount(sqlSession, prop);
	}

	public ArrayList<Map<String, Object>> orderPeriodSearchList(Properties prop, PageInfo pi) {
		return mkDAO.orderPeriodSearchList(sqlSession, prop, pi);
	}
	
	//주문번호에 대한 option 조회 
	public ArrayList<Options> selectOptionInfo(int preorderNo) {
		return mkDAO.selectOptionInfo(sqlSession, preorderNo);
	}

	public void updatePointTable(Point p) {
		mkDAO.updatePointTable(sqlSession, p);		
	}

	public int insertQna(QA qna) {
		return mkDAO.insertQna(sqlSession, qna);
	}

	public ArrayList<QA> selectQnaList(PageInfo pi, int productNo) {
		return mkDAO.selectQnaList(sqlSession, pi, productNo);
	}

	public int selectQnaCount(int productNo) {
		return mkDAO.selectQnaCount(sqlSession, productNo);
	}

	public int insertLike(int usersNo, int divisionNo) {
		return mkDAO.insertLike(sqlSession, usersNo, divisionNo);
	}

	public int deleteLike(int usersNo, int divisionNo) {
		return mkDAO.deleteLike(sqlSession, usersNo, divisionNo);
	}

	public int selectLike(int usersNo, int productNo) {
		return mkDAO.selectLike(sqlSession, usersNo, productNo);
	}

	//상품 메인 창에서 카테고리 별 조회 
	public ArrayList<Product> selectViewWhole() {
		return mkDAO.selectViewWhole(sqlSession);
	}

	public ArrayList<Product> selectViewFood() {
		return mkDAO.selectViewFood(sqlSession);
	}

	public ArrayList<Menu> selectViewMenu() {
		return mkDAO.selectViewMenu(sqlSession);
	}

	public ArrayList<Ingredient> selectViewIngredient() {
		return mkDAO.selectViewIngredient(sqlSession);
	}

	public ArrayList<Tool> selectViewTool() {
		return mkDAO.selectViewTool(sqlSession);
	}

	



	


	





}
