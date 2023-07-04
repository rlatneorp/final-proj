package kh.finalproj.hollosekki.customer.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.customer.model.vo.Customer;
import kh.finalproj.hollosekki.customer.model.vo.Qna;
import kh.finalproj.hollosekki.market.model.vo.Orders;

@Repository
public class CustomerDAO {

	public int getNListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("customerMapper.getNListCount", i);
	}
	
//	public int getFListCount(SqlSessionTemplate sqlSession, int i) {
//		return sqlSession.selectOne("customerMapper.getFListCount", i);
//	}
	
	public int getPListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("customerMapper.getPListCount", map);
	}

	public ArrayList<Customer> nBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1 ) * pi.getBoardLimit(),pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("customerMapper.nBoardList", null, rowBounds);
	}

	public ArrayList<Customer> fBoardList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1 ) * pi.getBoardLimit(),pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("customerMapper.fBoardList", map, rowBounds);
	}

	public ArrayList<Customer> pBoardList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1 ) * pi.getBoardLimit(), pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("customerMapper.pBoardList", map, rowBounds);
	}

	public int getCategoryFListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("customerMapper.getCategoryFListCount", map);
	}

	public int qnaInsert(SqlSessionTemplate sqlSession, HashMap<Object, Object> map) {
		return sqlSession.insert("customerMapper.qnaInsert", map);
	}

	public int qnaProduct(SqlSessionTemplate sqlSession, HashMap<Object, Object> map) {
		return sqlSession.insert("customerMapper.qnaProduct", map) ;
	}

	public ArrayList<Orders> selectQnaProduct(SqlSessionTemplate sqlSession, Orders o) {
		return (ArrayList)sqlSession.selectList("customerMapper.selectQnaProduct", o);
	}

	public ArrayList<Qna> qBoardList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1 ) * pi.getBoardLimit(), pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("customerMapper.qBoardList", map, rowBounds);
	}

	public ArrayList<Qna> qnaType(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return (ArrayList)sqlSession.selectList("customerMapper.qnaType", map);
	}




}
