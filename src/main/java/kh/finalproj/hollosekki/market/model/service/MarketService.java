package kh.finalproj.hollosekki.market.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.dao.MarketDAO;
import kh.finalproj.hollosekki.market.model.vo.Attendance;
import kh.finalproj.hollosekki.market.model.vo.Cart;
import kh.finalproj.hollosekki.market.model.vo.Food;
import kh.finalproj.hollosekki.market.model.vo.Options;
import kh.finalproj.hollosekki.market.model.vo.Product;
import kh.finalproj.hollosekki.market.model.vo.Review;
import kh.finalproj.hollosekki.market.model.vo.ShippingAddress;
import kh.finalproj.hollosekki.market.model.vo.Tool;

@Service("mkService")
public class MarketService {
   
   @Autowired
   private SqlSessionTemplate sqlSession;
   @Autowired
   private MarketDAO mkDAO;

   public int insertCart(HashMap<String, String> result) {
      return mkDAO.insertCart(sqlSession,result);
   }

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

   public void delBasket(int productNo) {
      mkDAO.delBasket(sqlSession, productNo);
   }

   public ArrayList<Product> selectProductInfo(int productNo) {
      return mkDAO.selectProductInfo(sqlSession, productNo);
   }

   public int plusCount(int productNo) {
      return mkDAO.plusCount(sqlSession, productNo);
   }

   public int plusResultCount(int productNo) {
      return mkDAO.plusResultCount(sqlSession, productNo);
   }

   public void minusCount(int productNo) {
      mkDAO.minusCount(sqlSession, productNo);
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

   public int insertReview(Review r) {
      return mkDAO.insertReview(sqlSession, r);
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

   public ArrayList<Image> selectImagList(HashMap<String, Integer> map) {
      return mkDAO.selectImageList(sqlSession, map);
   }
   
   public int selectPoint(int usersNo) {
      return mkDAO.selectPoint(sqlSession, usersNo);
   }
//   public ShippingAddress selectShippingForUpdate(int shippingNo) {
//      // TODO Auto-generated method stub
//      return null;
//   }


   
   





}