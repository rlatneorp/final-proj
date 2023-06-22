package kh.finalproj.hollosekki.recipe.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;
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


}
