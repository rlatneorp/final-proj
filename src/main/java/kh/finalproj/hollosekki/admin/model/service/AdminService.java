package kh.finalproj.hollosekki.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.admin.DAO.AdminDAO;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;

@Service
public class AdminService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDAO aDAO;
	
	public int insertProduct(Ingredient igd) {
		return aDAO.insertProduct(sqlSession, igd);
	}
	
	public int insertIngredient(Ingredient igd) {
		return aDAO.insertIngredient(sqlSession, igd);
	}

	public int getNowIngredientNo() {
		return aDAO.getNowIngredientNo(sqlSession);
	}

	public int insertImage(Image image) {
		return aDAO.insertImage(sqlSession, image);
	}


}
