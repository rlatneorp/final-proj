package kh.finalproj.hollosekki.recipe.model.service;

import java.util.ArrayList;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;
import kh.finalproj.hollosekki.recipe.model.vo.RecipeOrder;

public interface RecipeService {

	int insertAttm(ArrayList<Image> thumImgList);

	int insertRecipe(Recipe r);

	int insertOrder(ArrayList<RecipeOrder> orc);

	int getListCount();

	ArrayList<Recipe> selectRecipeList(PageInfo pi);

	ArrayList<Image> selectRecipeImageList();

	Recipe recipeDetail(int foodNo, boolean yn);

	Image recipeDetailThum(int foodNo);

	ArrayList<Image> recipeDetailOrder(int foodNo);

	ArrayList<Image> recipeDetailComp(int foodNo);

	ArrayList<RecipeOrder> recipeDetailOrderText(int foodNo);

	int deleteRecipe(int foodNo);

	int deleteOrder(int foodNo);

	int deleteImage(int foodNo);

	int deleteThumImg(String thumDelRename);

	int updateRecipe(Recipe r);

	int deleteListImg(ArrayList<String> delOrderImgRename);

	int deleteComImg(ArrayList<String> comDelRename);

	int insertThum(Image img);

	ArrayList<Recipe> recentRecipeList();

	ArrayList<Recipe> mostRecipeList();

	ArrayList<Recipe> searchRecipe(String word);

	ArrayList<Image> searchImage();


}
