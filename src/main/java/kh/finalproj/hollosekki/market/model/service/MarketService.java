package kh.finalproj.hollosekki.market.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.dao.MarketDAO;
import kh.finalproj.hollosekki.market.model.vo.Cart;
import kh.finalproj.hollosekki.market.model.vo.Product;

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

//	public int aDateCheck(HashMap<String, String> map) {
//		return mkDAO.aDateCheck(sqlSession, map);
//	}

	public int checkDay(HashMap<String, String> map) {
		return mkDAO.checkDay(sqlSession, map);
	}



}
