package kh.finalproj.hollosekki.market.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.market.model.dao.MarketDAO;

@Service("mkService")
public class MarketService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MarketDAO mkDAO;
	
	public int attendanceCheck(String attendanceDate) {
	
		return mkDAO.attendanceCheck(sqlSession, attendanceDate);
	}

	public int checkDay(int aDateCheck) {
		return mkDAO.checkDay(sqlSession, aDateCheck);
	}

	public int aDateCheck(String attendanceDate) {
		return mkDAO.aDateCheck(sqlSession, attendanceDate);
	}

	public int attendanceDay(String ddattendanceDay) {
		return mkDAO.attendanceDay(sqlSession, ddattendanceDay);
	}


}
