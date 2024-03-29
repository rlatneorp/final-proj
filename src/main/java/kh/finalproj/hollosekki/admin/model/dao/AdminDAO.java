package kh.finalproj.hollosekki.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.admin.model.vo.AdminBasic;
import kh.finalproj.hollosekki.admin.model.vo.AdminMain;
import kh.finalproj.hollosekki.admin.model.vo.Sales;
import kh.finalproj.hollosekki.board.model.vo.Board;
import kh.finalproj.hollosekki.common.model.vo.FAQ;
import kh.finalproj.hollosekki.common.model.vo.Food;
import kh.finalproj.hollosekki.common.model.vo.Healther;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.Options;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Point;
import kh.finalproj.hollosekki.common.model.vo.Product;
import kh.finalproj.hollosekki.common.model.vo.QNA;
import kh.finalproj.hollosekki.common.model.vo.Review;
import kh.finalproj.hollosekki.common.model.vo.Tool;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.vo.Orders;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;

@Repository
public class AdminDAO {

	
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
	
	public int deleteOptions(SqlSessionTemplate sqlSession, int pNo) {
		return sqlSession.delete("adminMapper.deleteOptions", pNo);
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
	
	public Product selectProductCount(SqlSessionTemplate sqlSession, int pNo) {
		Product p = new Product();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("pNo", pNo);
		map.put("type", 1);
		int orderCount = sqlSession.selectOne("adminMapper.selectProductCount", map);
		map.put("type", 2);
		int likeCount = sqlSession.selectOne("adminMapper.selectProductCount", map);
		p.setOrderCount(orderCount);
		p.setLikeCount(likeCount);
		System.out.println(p);
		return p;
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
	
	
//	AdminMain-관리자메인
	public ArrayList<AdminMain> selectAdminMainList(SqlSessionTemplate sqlSession, AdminBasic ab) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectAdminMainList", ab);
	}
	
	
//	Sales-매출
	public int getSalesCount(SqlSessionTemplate sqlSession, AdminBasic ab) {
		return sqlSession.selectOne("adminMapper.getSalesCount", ab);
	}

	public ArrayList<Sales> selectSalesList(SqlSessionTemplate sqlSession, PageInfo pi, AdminBasic ab) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			return (ArrayList)sqlSession.selectList("adminMapper.selectSalesList", ab, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("adminMapper.selectSalesList", ab);
		}
	}

	
//	Orders-주문
	public int getOrdersCount(SqlSessionTemplate sqlSession, AdminBasic ab) {
		return sqlSession.selectOne("adminMapper.getOrdersCount", ab);
	}
	
	public ArrayList<Orders> selectOrdersList(SqlSessionTemplate sqlSession, PageInfo pi, AdminBasic ab) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectOrdersList", ab, rowBounds);
	}

	public Orders selectOrders(SqlSessionTemplate sqlSession, AdminBasic ab) {
		return sqlSession.selectOne("adminMapper.selectOrders", ab);
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
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			return (ArrayList)sqlSession.selectList("adminMapper.selectMenuList", ab, rowBounds);
		}else {
			return (ArrayList)sqlSession.selectList("adminMapper.selectMenuList", ab);
		}
	}

	public Menu selectMenu(SqlSessionTemplate sqlSession, int pNo) {
		return sqlSession.selectOne("adminMapper.selectMenu", pNo);
	}

	public ArrayList<Integer> selectFoodProductNo(SqlSessionTemplate sqlSession, int pNo) {
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


//	Recipe-레시피
	public int getRecipeCount(SqlSessionTemplate sqlSession, AdminBasic ab) {
		return sqlSession.selectOne("adminMapper.getRecipeCount", ab);
	}

	public ArrayList<Recipe> selectRecipeList(SqlSessionTemplate sqlSession, PageInfo pi, AdminBasic ab) {
		if(pi != null) {
			int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			return (ArrayList)sqlSession.selectList("adminMapper.selectRecipeList", ab, rowBounds);
		}else {
			System.out.println(pi);
			return (ArrayList)sqlSession.selectList("adminMapper.selectRecipeList", ab);
		}
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

	public int updateFAQ(SqlSessionTemplate sqlSession, FAQ faq) {
		return sqlSession.update("adminMapper.updateFAQ", faq);
	}

	public int insertFAQ(SqlSessionTemplate sqlSession, FAQ faq) {
		return sqlSession.insert("adminMapper.insertFAQ", faq);
	}
	
	
//	QNA-1:1문의
	public int getQNACount(SqlSessionTemplate sqlSession, AdminBasic ab) {
		return sqlSession.selectOne("adminMapper.getQNACount", ab);
	}

	public ArrayList<QNA> selectQNAList(SqlSessionTemplate sqlSession, PageInfo pi, AdminBasic ab) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectQNAList", ab, rowBounds);
	}

	public QNA selectQNA(SqlSessionTemplate sqlSession, Integer qnaNo) {
		return sqlSession.selectOne("adminMapper.selectQNA", qnaNo);
	}

	public int updateQNA(SqlSessionTemplate sqlSession, QNA qna) {
		return sqlSession.update("adminMapper.updateQNA", qna);
	}

	
//	Healther-영양사
	public Healther selectHealther(SqlSessionTemplate sqlSession, int uNo) {
		return sqlSession.selectOne("adminMapper.selectHealther", uNo);
	}

	public int insertHealther(SqlSessionTemplate sqlSession, Healther h) {
		return sqlSession.insert("adminMapper.insertHealther", h);
	}

	public int updateHealther(SqlSessionTemplate sqlSession, Healther h) {
		return sqlSession.update("adminMapper.updateHealther", h);
	}







	







	
}
