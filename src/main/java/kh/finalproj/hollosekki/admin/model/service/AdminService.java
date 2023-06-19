package kh.finalproj.hollosekki.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.admin.model.dao.AdminDAO;
import kh.finalproj.hollosekki.common.model.vo.AdminBasic;
import kh.finalproj.hollosekki.common.model.vo.Food;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Product;

@Service
public class AdminService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminDAO aDAO;
	
//	Common-공용
	public int updateStatus(HashMap<String, String> map) {
		return aDAO.updateStatus(sqlSession, map);
	}
	
//	Product-상품
	public Product selectProduct(int pNo) {
		return aDAO.selectProduct(sqlSession, pNo);
	}

	public int updateProduct(Product pd) {
		return aDAO.updateProduct(sqlSession, pd);
	}
	
	public int insertProduct(Product pd) {
		return aDAO.insertProduct(sqlSession, pd);
	}

	public int deletesProduct(String[] pDeletes) {
		return aDAO.deletesProduct(sqlSession, pDeletes);
	}
	
	
//	Image-사진
	public ArrayList<Image> selectAllImageList(HashMap<String, Integer> map) {
		return aDAO.selectAllImageList(sqlSession, map);
	}
	
	public int insertImage(Image image) {
		return aDAO.insertImage(sqlSession, image);
	}

	public int deleteImage(Image img) {
		return aDAO.deleteImage(sqlSession, img);
	}


//	Menu-메뉴
	public int getMenuCount(AdminBasic ab) {
		return aDAO.getMenuCount(sqlSession, ab);
	}

	public ArrayList<Menu> selectMenuList(PageInfo pi, AdminBasic ab) {
		return aDAO.selectMenuList(sqlSession, pi, ab);
	}

	public Menu selectMenu(int pNo) {
		return aDAO.selectMenu(sqlSession, pNo);
	}

	public ArrayList<String> selectFoodProductNo(int pNo) {
		return aDAO.selectFoodProductNo(sqlSession, pNo);
	}
	
	public int updateMenu(Menu m) {
		return aDAO.updateMenu(sqlSession, m);
	}

	public int deleteMenuList(Menu m) {
		return aDAO.deleteMenuList(sqlSession, m);
	}

	public int insertMenu(Menu m) {
		return aDAO.insertMenu(sqlSession, m);
	}
	
	public int insertMenuList(Menu m) {
		return aDAO.insertMenuList(sqlSession, m);
	}

	
//	Ingredient-식재료
	public int getIngredientCount(AdminBasic ab) {
		return aDAO.getIngredientCount(sqlSession, ab);
	}
	
	public ArrayList<Ingredient> selectIngredientList(PageInfo pi, AdminBasic ab) {
		return aDAO.selectIngredientList(sqlSession, pi, ab);
	}
	
	public Ingredient selectIngredient(int igdNo) {
		return aDAO.selectIngredient(sqlSession, igdNo);
	}
	
	public int updateIngredient(Ingredient igd) {
		return aDAO.updateIngredient(sqlSession, igd);
	}
	
	public int insertIngredient(Ingredient igd) {
		return aDAO.insertIngredient(sqlSession, igd);
	}
	
	public int ingredientUpdateIsAccept(Ingredient igd) {
		return aDAO.ingredientUpdateIsAccept(sqlSession, igd);
	}
	
	public int deletesIngredient(String[] igdDeletes) {
		return aDAO.deletesIngredient(sqlSession, igdDeletes);
	}

	
//	Food-식품
	public int getFoodCount(AdminBasic ab) {
		return aDAO.getFoodCount(sqlSession, ab);
	}
	
	public ArrayList<Food> selectFoodList(PageInfo pi, AdminBasic ab) {
		return aDAO.selectFoodList(sqlSession, pi, ab);
	}
	
	public Food selectFood(int foodNo) {
		return aDAO.selectFood(sqlSession, foodNo);
	}
	
	public int updateFood(Food f) {
		return aDAO.updateFood(sqlSession, f);
	}
	
	public int insertFood(Food f) {
		return aDAO.insertFood(sqlSession, f);
	}
	
	public ArrayList<String> deleteableFood(int pNo) {
		return aDAO.deleteableFood(sqlSession, pNo);
	}

	public int deletesFood(String[] foodDeletes) {
		return aDAO.deletesFood(sqlSession, foodDeletes);
	}

	




	

	









}
