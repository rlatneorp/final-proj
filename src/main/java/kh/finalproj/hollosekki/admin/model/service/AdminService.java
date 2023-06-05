package kh.finalproj.hollosekki.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.admin.DAO.AdminDAO;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;

@Service
public class AdminService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDAO aDAO;
	
	public int insertIngredient(Ingredient igd) {
		return aDAO.insertIngredient(sqlSession, igd);
	}

}
