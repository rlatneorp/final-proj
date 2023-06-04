package kh.finalproj.hollosekki.market.model.dao;

import java.util.ArrayList;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.member.model.vo.Users;

@Repository
public class MarketDAO {

	public int attendanceCheck(SqlSessionTemplate sqlSession, int attendanceDateInt) {
		return sqlSession.update("marketMapper.attendanceCheck", attendanceDateInt);
	}

	public int checkDay(SqlSessionTemplate sqlSession, int checkDay) {
		return sqlSession.update("marketMapper.checkDay", checkDay);
	}

}
