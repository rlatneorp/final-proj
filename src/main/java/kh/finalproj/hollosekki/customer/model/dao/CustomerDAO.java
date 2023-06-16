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

	public int getListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("customerMapper.getListCount", map);
	}

	public ArrayList<Customer> faqBoardList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		RowBounds rowBounds = new RowBounds((pi.getCurrentPage() -1 ) * pi.getBoardLimit(),pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("customerMapper.faqBoardList", map, rowBounds);
	}




}
