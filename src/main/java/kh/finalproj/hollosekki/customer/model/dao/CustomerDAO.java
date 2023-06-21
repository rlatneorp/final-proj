package kh.finalproj.hollosekki.customer.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.customer.model.vo.Customer;

@Repository
public class CustomerDAO {

	public int getNListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("customerMapper.getNListCount", i);
	}
	
	public int getFListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("customerMapper.getFListCount", i);
	}
	
	public int getPListCount(SqlSessionTemplate sqlSession, int i, HashMap<String, Object> map) {
		return sqlSession.selectOne("customerMapper.getPListCount", map);
	}

	public ArrayList<Customer> nBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1 ) * pi.getBoardLimit(),pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("customerMapper.nBoardList", null, rowBounds);
	}

	public ArrayList<Customer> fBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1 ) * pi.getBoardLimit(),pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("customerMapper.fBoardList", null, rowBounds);
	}

	public ArrayList<Customer> pBoardList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1 ) * pi.getBoardLimit(), pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("customerMapper.pBoardList", map, rowBounds);
	}




}
