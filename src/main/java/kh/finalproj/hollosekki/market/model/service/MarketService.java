package kh.finalproj.hollosekki.market.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.dao.MarketDAO;
import kh.finalproj.hollosekki.market.model.vo.Cart;
import kh.finalproj.hollosekki.market.model.vo.Product;
import kh.finalproj.hollosekki.market.model.vo.ShippingAddress;

@Service("mkService")
public class MarketService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MarketDAO mkDAO;

	public int insertCart(Cart c) {
		return mkDAO.insertCart(sqlSession,c);
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
	
	//배송지 추가
	public int insertShipping(ShippingAddress sa) {
		return mkDAO.insertShipping(sqlSession, sa);
	}
	
	//배송지 조회
	public ArrayList<ShippingAddress> selectShipping(int usersNo) {
		return mkDAO.selectShipping(sqlSession, usersNo);
	}

//	public int aDateCheck(HashMap<String, String> map) {
//		return mkDAO.aDateCheck(sqlSession, map);
//	}

	public void checkDay(HashMap<String, String> map) {
		mkDAO.checkDay(sqlSession, map);
	
	}

	public ArrayList<Users> allAt(HashMap<String, String> map) {
		return mkDAO.allAt(sqlSession, map);
	}



}
