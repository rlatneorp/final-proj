package kh.finalproj.hollosekki.market.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.vo.Cart;
import kh.finalproj.hollosekki.market.model.vo.Product;


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




}
