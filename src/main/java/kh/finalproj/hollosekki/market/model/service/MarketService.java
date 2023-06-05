package kh.finalproj.hollosekki.market.model.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.market.model.dao.MarketDAO;
import kh.finalproj.hollosekki.member.model.vo.Users;

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


}
