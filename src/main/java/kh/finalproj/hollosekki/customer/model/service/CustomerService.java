package kh.finalproj.hollosekki.customer.model.service;

import java.util.ArrayList;

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
	
	public int getListCount(int i) {
		return csDAO.getListCount(sqlSession, i);
	}

	public ArrayList<Customer> noticeBoardList(PageInfo pi) {
		return csDAO.noticeBoardList(sqlSession, pi);
	}

	public ArrayList<Customer> personalQuestion(PageInfo pi) {
		return csDAO.personalQuestion(sqlSession, pi);
	}

	public ArrayList<Customer> faqBoardList(PageInfo api) {
		return null;
	}

}
