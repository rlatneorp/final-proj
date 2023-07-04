package kh.finalproj.hollosekki.recipe.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Review;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;
import kh.finalproj.hollosekki.recipe.model.vo.RecipeElement;
import kh.finalproj.hollosekki.recipe.model.vo.RecipeOrder;

@Repository
public class RecipeDAO {

	public int insertAttm(SqlSessionTemplate sqlSession, ArrayList<Image> thumImgList) {
		return sqlSession.insert("recipeMapper.insertAttm", thumImgList);
	}

	public int insertRecipe(SqlSessionTemplate sqlSession, Recipe r) {
		return sqlSession.insert("recipeMapper.insertRecipe", r);
	}
	
	public int insertOrder(SqlSessionTemplate sqlSession, ArrayList<RecipeOrder> orc) {
		return sqlSession.insert("recipeMapper.insertOrder", orc);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("recipeMapper.getListCount");
	}

	public ArrayList<Recipe> selectRecipeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("recipeMapper.selectRecipeList", null, rowBounds);
	}

	public ArrayList<Image> selectRecipeImageList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("recipeMapper.selectRecipeImageList");
	}

	public Recipe recipeDetail(SqlSessionTemplate sqlSession, int foodNo) {
		return sqlSession.selectOne("recipeMapper.recipeDetail", foodNo);
	}

	public int addCount(SqlSessionTemplate sqlSession, int foodNo) {
		return sqlSession.update("recipeMapper.addCount", foodNo);
	}

//	썸네일
	public Image recipeDetailThum(SqlSessionTemplate sqlSession, int foodNo) {
		return sqlSession.selectOne("recipeMapper.recipeDetailThum", foodNo);
	}

//	조리순서
	public ArrayList<Image> recipeDetailOrder(SqlSessionTemplate sqlSession, int foodNo) {
		return (ArrayList)sqlSession.selectList("recipeMapper.recipeDetailOrder", foodNo);
	}

//	완성사진
	public ArrayList<Image> recipeDetailComp(SqlSessionTemplate sqlSession, int foodNo) {
		return (ArrayList)sqlSession.selectList("recipeMapper.recipeDetailComp", foodNo);
	}

	public ArrayList<RecipeOrder> recipeDetailOrderText(SqlSessionTemplate sqlSession, int foodNo) {
		return (ArrayList)sqlSession.selectList("recipeMapper.recipeDetailOrderText", foodNo);
	}

	public int deleteRecipe(SqlSessionTemplate sqlSession, int foodNo) {
		return sqlSession.delete("recipeMapper.deleteRecipe", foodNo);
	}

	public int deleteOrder(SqlSessionTemplate sqlSession, int foodNo) {
		return sqlSession.delete("recipeMapper.deleteOrder", foodNo);
	}

	public int deleteImage(SqlSessionTemplate sqlSession, int foodNo) {
		return sqlSession.delete("recipeMapper.deleteImage", foodNo);
	}

	public int deleteThumImg(SqlSessionTemplate sqlSession, String thumDelRename) {
		return sqlSession.delete("recipeMapper.deleteThumImg", thumDelRename);
	}

	public int updateRecipe(SqlSessionTemplate sqlSession, Recipe r) {
		return sqlSession.update("recipeMapper.updateRecipe", r);
	}

	public int deleteListImg(SqlSessionTemplate sqlSession, ArrayList<String> delOrderImgRename) {
		return sqlSession.delete("recipeMapper.deleteListImg", delOrderImgRename);
	}

	public int deleteComImg(SqlSessionTemplate sqlSession, ArrayList<String> comDelRename) {
		return sqlSession.delete("recipeMapper.deleteComImg", comDelRename);
	}

	public int insertThum(SqlSessionTemplate sqlSession, Image img) {
		return sqlSession.insert("recipeMapper.insertThum", img);
	}

	public ArrayList<Recipe> recentRecipeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("recipeMapper.recentRecentList");
	}

	public ArrayList<Recipe> mostRecipeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("recipeMapper.mostRecipeList");
	}

	public ArrayList<Recipe> searchRecipe(SqlSessionTemplate sqlSession, String word) {
		return (ArrayList)sqlSession.selectList("recipeMapper.searchRecipe", word);
	}

	public ArrayList<Image> searchImage(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("recipeMapper.searchImage", sqlSession);
	}

	public ArrayList<Recipe> ingredientSearch(SqlSessionTemplate sqlSession, String ingredient) {
		return (ArrayList)sqlSession.selectList("recipeMapper.ingredientSearch", ingredient);
	}

	public ArrayList<Recipe> situationSearch(SqlSessionTemplate sqlSession, String situation) {
		return (ArrayList)sqlSession.selectList("recipeMapper.situationSearch", situation);
	}

	public ArrayList<Recipe> typeSearch(SqlSessionTemplate sqlSession, String type) {
		return (ArrayList)sqlSession.selectList("recipeMapper.typeSearch", type);
	}

	public int reviewWrite(SqlSessionTemplate sqlSession, Review re) {
		return sqlSession.insert("recipeMapper.reviewWrite", re);
	}

	public ArrayList<Review> selectReview(SqlSessionTemplate sqlSession, int foodNo) {
		return (ArrayList)sqlSession.selectList("recipeMapper.selectReview", foodNo);
	}

	public int getReviewCount(SqlSessionTemplate sqlSession, int foodNo) {
		return sqlSession.selectOne("recipeMapper.getReviewCount", foodNo);
	}

	public ArrayList<Review> selectReivewList(SqlSessionTemplate sqlSession, PageInfo rpi, int foodNo) {
		int offset = (rpi.getCurrentPage() - 1) * rpi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, rpi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("recipeMapper.selectReview", foodNo, rowBounds);
	}

	public ArrayList<Ingredient> selectIngredient(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("recipeMapper.selectIngredient");
	}

	public void insertIngredient(SqlSessionTemplate sqlSession, ArrayList<RecipeElement> reelList) {
		sqlSession.insert("recipeMapper.insertIngredient", reelList);
	}

	public void insertNewIngredient(SqlSessionTemplate sqlSession, String newI) {
		sqlSession.insert("recipeMapper.insertNewIngredient", newI);
	}

	public Ingredient selectNewIngredient(SqlSessionTemplate sqlSession, String newI) {
		return sqlSession.selectOne("recipeMapper.selectNewIngredient", newI);
	}

	public ArrayList<RecipeElement> selectRecipeElement(SqlSessionTemplate sqlSession, int foodNo) {
		return (ArrayList)sqlSession.selectList("recipeMapper.selectRecipeElement", foodNo);
	}

	public int myReivew(SqlSessionTemplate sqlSession, Review my) {
		return sqlSession.selectOne("recipeMapper.myReview", my);
	}

	public int updateReview(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("recipeMapper.updateReview", map);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, int reviewNo) {
		return sqlSession.update("recipeMapper.deleteReview", reviewNo);
	}

	public int updateOrder(SqlSessionTemplate sqlSession, ArrayList<RecipeOrder> orc) {
		int result = 0;
		for(int i = 0; i < orc.size(); i++) {
			result += sqlSession.update("recipeMapper.updateOrder", orc.get(i));
		}
		
		if(result < orc.size()) {
			for(int i = result; i < orc.size(); i++) {
				result += sqlSession.insert("recipeMapper.insertOrderPlus", orc.get(i));
			}
		}
		
		return result;
	}

}
