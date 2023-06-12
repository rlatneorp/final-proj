package kh.finalproj.hollosekki.market.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
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

	public int insertCart(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.insert("marketMapper.insertCart",c);
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

//	public int aDateCheck(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
//		return sqlSession.update("marketMapper.aDateCheck", map);
//	}

	public void checkDay(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		sqlSession.selectOne("marketMapper.checkDay", map);
	}

	public ArrayList<Users> allAt(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("marketMapper.allAt", map);
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

	


}
