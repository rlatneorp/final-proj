package kh.finalproj.hollosekki.customer.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.customer.model.dao.CustomerDAO;
import kh.finalproj.hollosekki.customer.model.vo.Customer;

@Service
public class CustomerService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CustomerDAO csDAO;
	
	public int getNListCount(int i) {
		return csDAO.getNListCount(sqlSession, i);
	}
	
	public int getFListCount(int i) {
		return csDAO.getFListCount(sqlSession, i);
	}
	
	public int getPListCount(int i, HashMap<String, Object> map) {
		return csDAO.getPListCount(sqlSession, i, map);
	}

	public ArrayList<Customer> nBoardList(PageInfo pi) {
		return csDAO.nBoardList(sqlSession, pi);
	}

	public ArrayList<Customer> fBoardList(PageInfo pi) {
		return csDAO.fBoardList(sqlSession, pi);
	}

	public ArrayList<Customer> pBoardList(PageInfo pi, HashMap<String, Object> map) {
		return csDAO.pBoardList(sqlSession, pi, map);
	}




}
