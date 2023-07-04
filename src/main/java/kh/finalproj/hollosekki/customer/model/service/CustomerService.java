package kh.finalproj.hollosekki.customer.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.customer.model.dao.CustomerDAO;
import kh.finalproj.hollosekki.customer.model.vo.Customer;
import kh.finalproj.hollosekki.customer.model.vo.Qna;
import kh.finalproj.hollosekki.market.model.vo.Orders;

@Service
public class CustomerService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CustomerDAO csDAO;
	
	public int getNListCount(int i) {
		return csDAO.getNListCount(sqlSession, i);
	}
	
//	public int getFListCount(int i) {
//		return csDAO.getFListCount(sqlSession, i);
//	}
	
	public int getPListCount(HashMap<String, Object> map) {
		return csDAO.getPListCount(sqlSession,  map);
	}

	public ArrayList<Customer> nBoardList(PageInfo pi) {
		return csDAO.nBoardList(sqlSession, pi);
	}

	public ArrayList<Customer> fBoardList(PageInfo pi, HashMap<String, Object> map) {
		return csDAO.fBoardList(sqlSession, pi, map);
	}

	public ArrayList<Customer> pBoardList(PageInfo pi, HashMap<String, Object> map) {
		return csDAO.pBoardList(sqlSession, pi, map);
	}

	public int getCategoryFListCount(HashMap<String, Object> map) {
		return csDAO.getCategoryFListCount(sqlSession, map);
	}

	public int qnaInsert(HashMap<Object, Object> map) {
		return csDAO.qnaInsert(sqlSession, map);
	}

	public int qnaProduct(HashMap<Object, Object> map) {
		return csDAO.qnaProduct(sqlSession, map);
	}

	public ArrayList<Orders> selectQnaProduct(Orders o) {
		return csDAO.selectQnaProduct(sqlSession, o);
	}

	public ArrayList<Qna> qBoardList(PageInfo pi, HashMap<String, Object> map) {
		return csDAO.qBoardList(sqlSession, pi, map);
	}

	public ArrayList<Qna> qnaType(HashMap<Object, Object> map) {
		return csDAO.qnaType(sqlSession, map);
	}




}
