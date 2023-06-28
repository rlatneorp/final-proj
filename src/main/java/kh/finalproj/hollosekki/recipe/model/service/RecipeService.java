package kh.finalproj.hollosekki.recipe.model.service;

import java.util.ArrayList;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.market.model.vo.Review;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;
import kh.finalproj.hollosekki.recipe.model.vo.RecipeElement;
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

	ArrayList<Recipe> ingredientSearch(String ingredient);

	ArrayList<Recipe> situationSearch(String situation);

	ArrayList<Recipe> typeSearch(String type);

	int reviewWrite(Review re);

	ArrayList<Review> selectReview(int parseInt);

	int getReviewCount(int foodNo);

	ArrayList<Review> selectReviewList(PageInfo rpi, int foodNo);

	ArrayList<Ingredient> selectIngredient();

	void insertIngredient(ArrayList<RecipeElement> reelList);

	void insertNewIngredient(String newI);

	Ingredient selectNewIngredient(String newI);

	ArrayList<RecipeElement> selectRecipeElement(int foodNo);


}
