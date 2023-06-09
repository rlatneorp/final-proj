package kh.finalproj.hollosekki.market.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.market.model.dao.MarketDAO;
import kh.finalproj.hollosekki.market.model.vo.ShippingAddress;

@Service("mkService")
public class MarketService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MarketDAO mkDAO;
	
	public int attendanceCheck(String attendanceDate) {
	
		return mkDAO.attendanceCheck(sqlSession, attendanceDate);
	}

	public int checkDay(int checkDay) {
		return mkDAO.checkDay(sqlSession, checkDay);
	}

	public int aDateCheck(String attendanceDate) {
		return mkDAO.aDateCheck(sqlSession, attendanceDate);
	}

	public int attendanceDay(String ddattendanceDay) {
		return mkDAO.attendanceDay(sqlSession, ddattendanceDay);
	}
	
	//배송지 추가
	public int insertShipping(ShippingAddress sa) {
		return mkDAO.insertShipping(sqlSession, sa);
	}
	
	//배송지 조회
	public ArrayList<ShippingAddress> selectShipping(int usersNo) {
		return mkDAO.selectShipping(sqlSession, usersNo);
	}


}
