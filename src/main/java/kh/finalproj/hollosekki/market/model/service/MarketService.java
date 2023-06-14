package kh.finalproj.hollosekki.market.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.dao.MarketDAO;
import kh.finalproj.hollosekki.market.model.vo.Attendance;
import kh.finalproj.hollosekki.market.model.vo.Cart;

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
	
	//諛곗넚吏� 異붽�
	public int insertShipping(ShippingAddress sa) {
		return mkDAO.insertShipping(sqlSession, sa);
	}
	
	//諛곗넚吏� 議고쉶
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





}
