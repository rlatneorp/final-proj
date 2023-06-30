package kh.finalproj.hollosekki.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.admin.model.vo.AdminBasic;
import kh.finalproj.hollosekki.admin.model.vo.AdminMain;
import kh.finalproj.hollosekki.board.model.vo.Board;
import kh.finalproj.hollosekki.common.model.vo.FAQ;
import kh.finalproj.hollosekki.common.model.vo.Food;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.Options;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Point;
import kh.finalproj.hollosekki.common.model.vo.Product;
import kh.finalproj.hollosekki.common.model.vo.Review;
import kh.finalproj.hollosekki.common.model.vo.Tool;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;

@Repository
public class AdminDAO {

	public ArrayList<AdminMain> adminMainWeek(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.adminMainWeek");
	}
	
//	Common-공용
	public int updateStatus(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("adminMapper.updateStatus", map);
	}

	public int deleteSelects(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.delete("adminMapper.deleteSelects", map);
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
	
	
//	Users-회원
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

	public int updateUsers(SqlSessionTemplate sqlSession, Users u, Point p) {
		int resultU = sqlSession.update("adminMapper.updateUsers", u);
		int resultP = 0;
		if(resultU > 0) {
			if(p.getPointBefore() != p.getPoint()) {
				resultP = sqlSession.insert("adminMapper.insertPoint", p);
			}else {
				resultP = 1;
			}
		}
		return resultU+resultP;
	}

	
//	Point-포인트
	public int getPointCount(SqlSessionTemplate sqlSession, AdminBasic ab) {
		return sqlSession.selectOne("adminMapper.getPointCount", ab);
	}

	public ArrayList<Point> selectPointList(SqlSessionTemplate sqlSession, PageInfo pi, AdminBasic ab) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectPointList", ab, rowBounds);
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
	
	public ArrayList<Food> selectFoodListNotD(SqlSessionTemplate sqlSession, PageInfo pi, AdminBasic ab) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectFoodListNotD", ab, rowBounds);
	}
	
	public Food selectFood(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("adminMapper.selectFood", map);
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


//	Recipe-레시피
	public int getRecipeCount(SqlSessionTemplate sqlSession, AdminBasic ab) {
		return sqlSession.selectOne("adminMapper.getRecipeCount", ab);
	}

	public ArrayList<Recipe> selectRecipeList(SqlSessionTemplate sqlSession, PageInfo pi, AdminBasic ab) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectRecipeList", ab, rowBounds);
	}

	public int deletesRecipeOrder(SqlSessionTemplate sqlSession, String[] selDeletes) {
		int resultRpOd = sqlSession.delete("adminMapper.deletesRecipeOrder", selDeletes);
		int resultRp = 0;
		if(resultRpOd > 0) {
			resultRp = sqlSession.delete("adminMapper.deletesRecipe", selDeletes);
		}
		return resultRpOd+resultRp;
	}


//	Board-게시판
	public int getBoardCount(SqlSessionTemplate sqlSession, AdminBasic ab) {
		return sqlSession.selectOne("adminMapper.getBoardCount", ab);
	}

	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, AdminBasic ab) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoardList", ab, rowBounds);
	}

	public Board selectBoard(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("adminMapper.selectBoard", boardNo);
	}

	public int deletesBoard(SqlSessionTemplate sqlSession, String[] selDeletes) {
		int resultR = 0;
		AdminBasic ab = new AdminBasic();
		ab.setKind(-1);
		for(int i = 0; i < selDeletes.length; i++) {
			ab.setNumber(Integer.parseInt(selDeletes[i]));
			resultR += sqlSession.delete("adminMapper.deleteReview", ab);
		}
		
		return resultR + sqlSession.delete("adminMapper.deletesBoard", selDeletes);
	}


//	Review-리뷰
	public int getReviewCount(SqlSessionTemplate sqlSession, AdminBasic ab) {
		return sqlSession.selectOne("adminMapper.getReviewCount", ab);
	}

	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, PageInfo pi, AdminBasic ab) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			return (ArrayList)sqlSession.selectList("adminMapper.selectReviewList", ab, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("adminMapper.selectReviewList", ab);
		}
	}

	public Review selectReview(SqlSessionTemplate sqlSession, Integer reviewNo) {
		return sqlSession.selectOne("adminMapper.selectReview", reviewNo);
	}

	public int deletesReview(SqlSessionTemplate sqlSession, String[] selDeletes) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("selDeletes", selDeletes);
		map.put("type", 7);
		return sqlSession.delete("adminMapper.deletesReview", map);
	}

	
//	FAQ-자주묻는질문
	public int getFAQCount(SqlSessionTemplate sqlSession, AdminBasic ab) {
		return sqlSession.selectOne("adminMapper.getFAQCount", ab);
	}

	public ArrayList<FAQ> selectFAQList(SqlSessionTemplate sqlSession, PageInfo pi, AdminBasic ab) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectFAQList", ab, rowBounds);
	}

	public FAQ selectFAQ(SqlSessionTemplate sqlSession, Integer faqNo) {
		return sqlSession.selectOne("adminMapper.selectFAQ", faqNo);
	}





	
}
