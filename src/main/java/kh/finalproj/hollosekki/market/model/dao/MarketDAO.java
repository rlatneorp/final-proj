package kh.finalproj.hollosekki.market.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.vo.Attendance;
import kh.finalproj.hollosekki.market.model.vo.Cart;
import kh.finalproj.hollosekki.market.model.vo.Product;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;



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

	public int aDateCheck(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("marketMapper.aDateCheck", map);
	}

	public void checkDay(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		sqlSession.selectOne("marketMapper.checkDay", map);
	}

	public ArrayList<Attendance> allAt(SqlSessionTemplate sqlSession, Users u) {
		return (ArrayList)sqlSession.selectList("marketMapper.allAt", u);
	}

	public void atInsert(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		sqlSession.insert("marketMapper.atInsert", map);
	}

	public void gettedPoint(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		sqlSession.update("marketMapper.gettedPoint", map);
	}

	public int atTodayChecked(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.selectOne("marketMapper.atTodayChecked", u);
	}




	public int insertShipping(SqlSessionTemplate sqlSession, ShippingAddress sa) {
		return sqlSession.insert("marketMapper.insertShipping", sa);
	}

	public ArrayList<ShippingAddress> selectShipping(SqlSessionTemplate sqlSession, int usersNo) {
		return (ArrayList)sqlSession.selectList("marketMapper.selectShipping", usersNo);
	}


}
