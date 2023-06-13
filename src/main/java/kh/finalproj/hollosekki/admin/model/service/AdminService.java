package kh.finalproj.hollosekki.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.admin.model.dao.AdminDAO;
import kh.finalproj.hollosekki.common.model.vo.AdminBasic;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Product;

@Service
public class AdminService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDAO aDAO;
	
	public int getIngredientCount(AdminBasic ab) {
		return aDAO.getIngredientCount(sqlSession, ab);
	}
	
	public ArrayList<Ingredient> selectIngredientList(PageInfo pi, AdminBasic ab) {
		return aDAO.selectIngredientList(sqlSession, pi, ab);
	}
	
	public Product selectProduct(int pNo) {
		return aDAO.selectProduct(sqlSession, pNo);
	}
	
	public Ingredient selectIngredient(int igdNo) {
		return aDAO.selectIngredient(sqlSession, igdNo);
	}
	
	public int updateIngredient(Ingredient igd) {
		return aDAO.updateIngredient(sqlSession, igd);
	}

	public int updateProduct(Product pd) {
		return aDAO.updateProduct(sqlSession, pd);
	}
	
	public int insertProduct(Product pd) {
		return aDAO.insertProduct(sqlSession, pd);
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

	public Image selectImage(HashMap<String, Integer> map) {
		return aDAO.selectImage(sqlSession, map);
	}

	public int deleteImage(Image img) {
		return aDAO.deleteImage(sqlSession, img);
	}

	public int getNowProductNo() {
		return aDAO.getNowProductNo(sqlSession);
	}

	public int ingredientUpdateIsAccept(Ingredient igd) {
		return aDAO.ingredientUpdateIsAccept(sqlSession, igd);
	}

	public int updateStatus(HashMap<String, String> map) {
		return aDAO.updateStatus(sqlSession, map);
	}

	public int deletesProduct(String[] pDeletes) {
		return aDAO.deletesProduct(sqlSession, pDeletes);
	}
	
	public int deletesIngredient(String[] igdDeletes) {
		return aDAO.deletesIngredient(sqlSession, igdDeletes);
	}







}
