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
	
	public int getListCount(HashMap<String, Object> map) {
		return csDAO.getListCount(sqlSession, map);
	}

	public ArrayList<Customer> faqBoardList(PageInfo pi, HashMap<String, Object> map) {
		return csDAO.faqBoardList(sqlSession, pi, map);
	}



}
