package kh.finalproj.hollosekki.users.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import kh.finalproj.hollosekki.common.model.vo.BookMark;
import kh.finalproj.hollosekki.common.model.vo.Follow;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.vo.Orders;
import kh.finalproj.hollosekki.market.model.vo.ShippingAddress;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;

public interface UsersService {

	int updatePwd(HashMap<String, String> map);

	int updateInfo(Users u);

	int insertImage(Image image);

	int updateProfile(Users u);

	Image selectImage(int usersNo);

	int deleteImage(Image existingImage);

	int deleteImage(int usersNo);

	Users selectInfo(Users u);

	int deleteInfo(int usersNo);

	ArrayList<HashMap<String, Object>> selectFollowing(int usersNo);

	ArrayList<HashMap<String, Object>> selectFollower(int usersNo);

	int deleteFollow(HashMap<String, Object> map);

	int insertFollow(HashMap<String, Object> map);
	
	int getMyRecipeListCount(int usersNo);

	ArrayList<HashMap<String, Object>> selectMyRecipe(HashMap<String, Object> map, PageInfo pi);

	int recipeBookCount(int foodNo);

	int recipeLikeCount(int foodNo);
	
	int getBookListCount(int usersNo);
	
	ArrayList<HashMap<String, Object>> myBookMarkList(HashMap<String, Object> map, PageInfo pi);

	int getFoodListCount(int usersNo);
	
	int getRecipeListCount(int usersNo);
	
	int getingredientListCount(int usersNo);

	ArrayList<HashMap<String, Object>> myFoodLikeList(int usersNo, int selectType, String selectTitle, PageInfo pi);

	ArrayList<HashMap<String, Object>> myRecipeLikeList(int usersNo, String selectTitle, PageInfo pi);

	ArrayList<HashMap<String, Object>> myProductLikeList(int usersNo, String selectTitle, PageInfo pi);

	int deleteBookMark(int bookmarkNo);
	
	int deleteLike(int likeNo);
	
	int updateAddress(ShippingAddress sa);
	
	//주문 리스트 조회 
	ArrayList<Orders> selectOrderList(int usersNo, PageInfo pi);
	
	//페이징~
	int orderListCount(int usersNo);
	
	//주문 상세 페이지 조회 
	Orders selectDetailOrder(int orderNo);
	
	//기간 별 구매 내역 조회 
	ArrayList<Orders> selectPeriodOrders(Properties prop, PageInfo pi);

	//기간 별 구매 내역 수 
	int orderPeriodCount(Properties prop);
	//검색어 일치하는 것 중 수 조회 
	int orderSearchCount(Properties prop);
	//검색어 일치하는 리스트 조회 
	ArrayList<Orders> orderSearch(Properties prop, PageInfo pi);




	
}
