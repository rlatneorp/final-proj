package kh.finalproj.hollosekki.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.common.model.vo.AdminBasic;
import kh.finalproj.hollosekki.common.model.vo.Food;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.Options;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Product;
import kh.finalproj.hollosekki.common.model.vo.Tool;
import kh.finalproj.hollosekki.common.model.vo.Users;

@Repository
public class AdminDAO {
	
//	Common-공용
	public int updateStatus(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("adminMapper.updateStatus", map);
	}

	public int insertOptions(SqlSessionTemplate sqlSession, ArrayList<Options> oList) {
		int result = 0;
		for(Options op: oList) {
			result += sqlSession.insert("adminMapper.insertOptions", op);
		}
		return result; 
	}
	
	public int deletesOptions(SqlSessionTemplate sqlSession, String[] selDeletes) {
		return sqlSession.delete("adminMapper.deletesOptions", selDeletes);
	}

	public ArrayList<Options> selectOptions(SqlSessionTemplate sqlSession, int pNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectOptions", pNo);
	}

//	Product-상품
	public Product selectProduct(SqlSessionTemplate sqlSession, int pNo) {
		return sqlSession.selectOne("adminMapper.selectProduct", pNo);
	}

	public int updateProduct(SqlSessionTemplate sqlSession, Product pd) {
		return sqlSession.update("adminMapper.updateProduct", pd);
	}

	public int insertProduct(SqlSessionTemplate sqlSession, Product pd) {
		sqlSession.insert("adminMapper.insertProduct", pd);
		//insertProduct 의 selectKey를 이용하여 insert된 Product의 productNo을 가져왔음 
		return pd.getProductNo();
	}
	
	public int deletesProduct(SqlSessionTemplate sqlSession, String[] pDeletes) {
		return sqlSession.delete("adminMapper.deletesProduct", pDeletes);
	}	
	
	
//	Image-사진
	public ArrayList<Image> selectAllImageList(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectAllImageList", map);
	}

	public int insertImage(SqlSessionTemplate sqlSession, Image image) {
		return sqlSession.insert("adminMapper.insertImage", image);
	}
	
	public int deleteImage(SqlSessionTemplate sqlSession, Image img) {
		return sqlSession.delete("adminMapper.deleteImage", img);
	}
	
	
//	Menu-메뉴
	public int getMenuCount(SqlSessionTemplate sqlSession, AdminBasic ab) {
		return sqlSession.selectOne("adminMapper.getMenuCount", ab);
	}

	public ArrayList<Menu> selectMenuList(SqlSessionTemplate sqlSession, PageInfo pi, AdminBasic ab) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectMenuList", ab, rowBounds);
	}

	public Menu selectMenu(SqlSessionTemplate sqlSession, int pNo) {
		return sqlSession.selectOne("adminMapper.selectMenu", pNo);
	}

	public ArrayList<String> selectFoodProductNo(SqlSessionTemplate sqlSession, int pNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectFoodProductNo", pNo);
	}
	
	public int updateMenu(SqlSessionTemplate sqlSession, Menu m) {
		return sqlSession.update("adminMapper.updateMenu", m);
	}

	public int deleteMenuList(SqlSessionTemplate sqlSession, Menu m) {
		return sqlSession.delete("adminMapper.deleteMenuList", m);
	}

	public int insertMenu(SqlSessionTemplate sqlSession, Menu m) {
		return sqlSession.insert("adminMapper.insertMenu", m);
	}
	
	public int insertMenuList(SqlSessionTemplate sqlSession, Menu m) {
		int result = 0; 
		for(String i:m.getFoodProductNo().split(",")) {
			Menu menu = new Menu();
			menu.setProductNo(m.getProductNo());
			menu.setFoodProductNo(i);
			result += sqlSession.insert("adminMapper.insertMenuList", menu);
		}
		return result;
	}

	
//	Ingredient-식재료
	public int getIngredientCount(SqlSessionTemplate sqlSession, AdminBasic ab) {
		return sqlSession.selectOne("adminMapper.getIngredientCount", ab);
	}

	public ArrayList<Ingredient> selectIngredientList(SqlSessionTemplate sqlSession, PageInfo pi, AdminBasic ab) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectIngredientList", ab, rowBounds);
	}
	
	public Ingredient selectIngredient(SqlSessionTemplate sqlSession, int igdNo) {
		return sqlSession.selectOne("adminMapper.selectIngredient", igdNo);
	}

	public int updateIngredient(SqlSessionTemplate sqlSession, Ingredient igd) {
		return sqlSession.update("adminMapper.updateIngredient", igd);
	}
	
	public int insertIngredient(SqlSessionTemplate sqlSession, Ingredient igd) {
		sqlSession.insert("adminMapper.insertIngredient", igd);
		//insertIngredient 의 selectKey를 이용하여 insert된 Ingredient의 ingredientNo을 가져왔음 
		return igd.getIngredientNo();
	}

	public int ingredientUpdateIsAccept(SqlSessionTemplate sqlSession, Ingredient igd) {
		return sqlSession.update("adminMapper.ingredientUpdateIsAccept", igd);
	}

	public int deletesIngredient(SqlSessionTemplate sqlSession, String[] igdDeletes) {
		return sqlSession.delete("adminMapper.deletesIngredient", igdDeletes);
	}

	
//	Food-식품
	public int getFoodCount(SqlSessionTemplate sqlSession, AdminBasic ab) {
		return sqlSession.selectOne("adminMapper.getFoodCount", ab);
	}
	
	public ArrayList<Food> selectFoodList(SqlSessionTemplate sqlSession, PageInfo pi, AdminBasic ab) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectFoodList", ab, rowBounds);
	}
	
	public Food selectFood(SqlSessionTemplate sqlSession, int foodNo) {
		return sqlSession.selectOne("adminMapper.selectFood", foodNo);
	}
	
	public int updateFood(SqlSessionTemplate sqlSession, Food f) {
		return sqlSession.update("adminMapper.updateFood", f);
	}

	public int insertFood(SqlSessionTemplate sqlSession, Food f) {
		return sqlSession.insert("adminMapper.insertFood", f);
	}

	public ArrayList<String> deleteableFood(SqlSessionTemplate sqlSession, int pNo) {
		return (ArrayList)sqlSession.selectList("adminMapper.deleteableFood", pNo);
	}
	
	public int deletesFood(SqlSessionTemplate sqlSession, String[] foodDeletes) {
		return sqlSession.delete("adminMapper.deletesFood", foodDeletes);
	}

	
//	Tool-도구상품
	public int getToolCount(SqlSessionTemplate sqlSession, AdminBasic ab) {
		return sqlSession.selectOne("adminMapper.getToolCount", ab);
	}

	public ArrayList<Tool> selectToolList(SqlSessionTemplate sqlSession, PageInfo pi, AdminBasic ab) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectToolList", ab, rowBounds);
	}

	public Tool selectTool(SqlSessionTemplate sqlSession, int toolNo) {
		return sqlSession.selectOne("adminMapper.selectTool", toolNo);
	}

	public int updateTool(SqlSessionTemplate sqlSession, Tool t) {
		return sqlSession.update("adminMapper.updateTool", t);
	}

	public int insertTool(SqlSessionTemplate sqlSession, Tool t) {
		return sqlSession.insert("adminMapper.insertTool", t);
	}

	public int deletesTool(SqlSessionTemplate sqlSession, String[] toolDeletes) {
		return sqlSession.delete("adminMapper.deletesTool", toolDeletes);
	}

	

	
	public int getUsersCount(SqlSessionTemplate sqlSession, AdminBasic ab) {
		return sqlSession.selectOne("adminMapper.getUsersCount", ab);
	}

	public ArrayList<Users> selectUsersList(SqlSessionTemplate sqlSession, PageInfo pi, AdminBasic ab) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectUsersList", ab, rowBounds);
	}

	public Users selectUsers(SqlSessionTemplate sqlSession, int uNo) {
		return sqlSession.selectOne("adminMapper.selectUsers", uNo);
	}

	public ArrayList<Integer> selectUsersInfo(SqlSessionTemplate sqlSession, HashMap<String, Integer> uMap) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectUsersInfo", uMap);
	}

	
	



	
}
