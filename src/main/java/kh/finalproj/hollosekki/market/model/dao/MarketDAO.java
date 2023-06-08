package kh.finalproj.hollosekki.market.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.vo.Cart;
import kh.finalproj.hollosekki.market.model.vo.Product;


@Repository
public class MarketDAO {

	public int attendanceCheck(SqlSessionTemplate sqlSession, String attendanceDate) {
		return sqlSession.update("marketMapper.attendanceCheck", attendanceDate);
	}

	public int checkDay(SqlSessionTemplate sqlSession, int aDateCheck) {
		return sqlSession.update("marketMapper.checkDay", aDateCheck);
	}

	public int aDateCheck(SqlSessionTemplate sqlSession, String attendanceDate) {
		return sqlSession.selectOne("marketMapper.aDateCheck", attendanceDate);
	}

	public int attendanceDay(SqlSessionTemplate sqlSession, String ddattendanceDay) {
		return sqlSession.update("marketMapper.attendanceDay", ddattendanceDay);
	}


	public int insertCart(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.insert("marketMapper.insertCart",c);
	}


}
