package kh.finalproj.hollosekki.recipe.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Review;
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

	ArrayList<Recipe> searchRecipe(PageInfo pi, String word);

	ArrayList<Image> searchImage();

	ArrayList<Recipe> ingredientSearch(PageInfo pi, String ingredient);

	ArrayList<Recipe> situationSearch(PageInfo pi, String situation);

	ArrayList<Recipe> typeSearch(PageInfo pi, String type);

	int reviewWrite(Review re);

	ArrayList<Review> selectReview(int parseInt);

	int getReviewCount(int foodNo);

	ArrayList<Review> selectReviewList(PageInfo rpi, int foodNo);

	ArrayList<Ingredient> selectIngredient();

	void insertIngredient(ArrayList<RecipeElement> reelList);

	void insertNewIngredient(String newI);

	int selectNewIngredient(String newI);

	ArrayList<RecipeElement> selectRecipeElement(int foodNo);

	int myReview(Review my);

	int updateReview(HashMap<String, Object> map);

	int deleteReview(int reviewNo);
	
	int updateOrder(ArrayList<RecipeOrder> orc);

	int updateRecipeOrder(ArrayList<RecipeOrder> ro);

	void deleteRecipeIngredient(int foodNo);

	void updateIngredient(ArrayList<RecipeElement> reelList);

	int insertRecipeBookmark(int usersNo, int divisionNo);

	int deleteRecipeBookmark(int usersNo, int divisionNo);

	int selectRecipeBookmark(int usersNo, int productNo);

	ArrayList<Review> selectMyReviewList(PageInfo mpi, HashMap<String, Object> map);

	int getSearchListCount(String word);

	int getIngredientListCount(String ingredient);

	int getSituationListCount(String situation);

	int getTypeListCount(String type);

	ArrayList<Recipe> mostClickRecipeList(PageInfo pi);

	void deleteOrderImg(String string);

	int getCateListCount(HashMap<String, String> category);

	ArrayList<Recipe> cateSearch(PageInfo pi, HashMap<String, String> category);



}
