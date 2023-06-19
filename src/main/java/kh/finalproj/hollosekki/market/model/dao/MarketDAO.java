package kh.finalproj.hollosekki.market.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.vo.Attendance;
import kh.finalproj.hollosekki.market.model.vo.Cart;
import kh.finalproj.hollosekki.market.model.vo.Food;
import kh.finalproj.hollosekki.market.model.vo.Options;
import kh.finalproj.hollosekki.market.model.vo.Product;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.market.model.vo.ShippingAddress;
import kh.finalproj.hollosekki.market.model.vo.Tool;


@Repository
public class MarketDAO {

	public int insertCart(SqlSessionTemplate sqlSession, HashMap<String, String> result) {
		return sqlSession.insert("marketMapper.insertCart",result);
	}

	public void attendanceCheck(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		sqlSession.update("marketMapper.attendanceCheck", map);
	}

	public void attendanceDay(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		sqlSession.update("marketMapper.attendanceDay", map);
	}

	public void firstAdDay(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		sqlSession.selectOne("marketMapper.firstAdDay", map);
	}

	public int aDateCheck(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("marketMapper.aDateCheck", map);
	}

	public void checkDay(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		sqlSession.selectOne("marketMapper.checkDay", map);
	}

	public ArrayList<Attendance> allAt(SqlSessionTemplate sqlSession, Users u) {
		return (ArrayList)sqlSession.selectList("marketMapper.allAt", u);
	}

	public void atInsert(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		sqlSession.insert("marketMapper.atInsert", map);
	}

	public void gettedPoint(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		sqlSession.update("marketMapper.gettedPoint", map);
	}

	public int atTodayChecked(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.selectOne("marketMapper.atTodayChecked", u);
	}




	public int insertShipping(SqlSessionTemplate sqlSession, ShippingAddress sa) {
		return sqlSession.insert("marketMapper.insertShipping", sa);
	}

	public ArrayList<ShippingAddress> selectShipping(SqlSessionTemplate sqlSession, int usersNo) {
		return (ArrayList)sqlSession.selectList("marketMapper.selectShipping", usersNo);
	}

	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("marketMapper.selectCartList", userNo);
	}

	public ArrayList<Options> selectOptions(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("marketMapper.selectOptions", productNo);
	}

	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("marketMapper.selectProductList", productNo);
	}

	public Food selectFood(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("marketMapper.selectFood", productNo);
	}

	public Tool selectTool(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("marketMapper.selectTool", productNo);
	}

	public Ingredient selectIngrdient(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("marketMapper.selectIngrdient", productNo);
	}

	public void delBasket(SqlSessionTemplate sqlSession, int productNo) {
		sqlSession.delete("marketMapper.delBasket", productNo);
	}

	public ArrayList<Product> selectProductInfo(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("marketMapper.selectProductInfo", productNo);
	}

	public int plusCount(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.update("marketMapper.plusCount", productNo);
	}

	public int plusResultCount(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("marketMapper.plusResultCount", productNo);
	}

	public void minusCount(SqlSessionTemplate sqlSession, int productNo) {
		sqlSession.update("marketMapper.minusCount", productNo);
	}

	public ArrayList<Cart> checkCartList(SqlSessionTemplate sqlSession, int usersNo, int preorderNo) {
		Map<String, Object> map = new HashMap<>();
		map.put("usersNo", usersNo);
		map.put("preorderNo", preorderNo);
		return (ArrayList)sqlSession.selectList("marketMapper.checkCartList", map);
	}	
	
	public void getMonthPoint(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		sqlSession.update("marketMapper.getMonthPoint", map);
	}

	public Users sendPoint(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.selectOne("marketMapper.sendPoint", u);
	}

	public void updateOptionNo(SqlSessionTemplate sqlSession, Cart cart) {
		sqlSession.update("marketMapper.updateOptionNo", cart);
	}

	public String selectOptionValue(SqlSessionTemplate sqlSession, int optionNo) {
		return sqlSession.selectOne("marketMapper.selectOptionValue", optionNo);
	}

//	public ArrayList<Cart> selectOptionNo(SqlSessionTemplate sqlSession, int i) {
//		return (ArrayList)sqlSession.selectList("marketMapper.selectOptionNo", i);
//	}

//	public ArrayList<Cart> selectOptionVal(SqlSessionTemplate sqlSession, int preorderNo) {
//		return (ArrayList)sqlSession.selectList("marketMapper.selectOptionVal", preorderNo);
//	}

	
	public ArrayList<Cart> selectOptionNo(SqlSessionTemplate sqlSession, Cart cart) {
		return (ArrayList)sqlSession.selectList("marketMapper.selectOptionNo", cart);
	}

	public Options selectOptionInfo(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.selectOne("marketMapper.selectOptionInfo", cart);
	}

	public Options selectOptions(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.selectOne("marketMapper.selectOptions", cart);
	}

//	public Options selectOptionInfo(SqlSessionTemplate sqlSession, int productOption) {
//		return sqlSession.selectOne("marketMapper.selectOptionInfo", productOption);
//	}

	public Options selectOptionInfo(SqlSessionTemplate sqlSession, int productNo, int productOption) {
		Map<String, Object> map = new HashMap<>();
		map.put("productNo", productNo);
		map.put("productOption", productOption);
		return sqlSession.selectOne("marketMapper.selectOptionInfo", map);
	}

	


}
