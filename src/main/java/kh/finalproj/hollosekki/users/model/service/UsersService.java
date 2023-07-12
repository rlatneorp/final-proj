package kh.finalproj.hollosekki.users.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import kh.finalproj.hollosekki.board.model.vo.Board;
import kh.finalproj.hollosekki.common.model.vo.BookMark;
import kh.finalproj.hollosekki.common.model.vo.Follow;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.customer.model.vo.Qna;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.vo.Orders;
import kh.finalproj.hollosekki.market.model.vo.Review;
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
	
	int getMyRecipeListCount(HashMap<String, Object> listMap);

	ArrayList<HashMap<String, Object>> selectMyRecipe(HashMap<String, Object> map, PageInfo pi);

	int getBookListCount(HashMap<String, Object> listMap);
	
	ArrayList<HashMap<String, Object>> myBookMarkList(HashMap<String, Object> map, PageInfo pi);

//	int getFoodListCount(int usersNo);
//	
//	int getRecipeListCount(int usersNo);
//	
//	int getingredientListCount(int usersNo);

	int getLikeListCount(HashMap<String, Object> listMap);
	
//	ArrayList<HashMap<String, Object>> myFoodLikeList(int usersNo, int selectType, String selectTitle, PageInfo pi);
//
//	ArrayList<HashMap<String, Object>> myRecipeLikeList(int usersNo, String selectTitle, PageInfo pi);
//
//	ArrayList<HashMap<String, Object>> myProductLikeList(int usersNo, String selectTitle, PageInfo pi);
	
	ArrayList<HashMap<String, Object>> myLikeList(HashMap<String, Object> map, PageInfo pi);

	int deleteBookMark(int bookmarkNo);
	
	int deleteLike(int likeNo);
	
	int updateAddress(ShippingAddress sa);
	
	//�ֹ� ����Ʈ ��ȸ 
	ArrayList<Orders> selectOrderList(int usersNo, PageInfo pi);
	
	//����¡~
	int orderListCount(int usersNo);
	
	//�ֹ� �� ������ ��ȸ 
	Orders selectDetailOrder(int orderNo);
	
	//�Ⱓ �� ���� ���� ��ȸ 
	ArrayList<Orders> selectPeriodOrders(Properties prop, PageInfo pi);

	//�Ⱓ �� ���� ���� �� 
	int orderPeriodCount(Properties prop);
	//�˻��� ��ġ�ϴ� �� �� �� ��ȸ 
	int orderSearchCount(Properties prop);
	//�˻��� ��ġ�ϴ� ����Ʈ ��ȸ 
	ArrayList<Orders> orderSearch(Properties prop, PageInfo pi);
	
	int getPointCount(int usersNo);
	
	// ����Ʈ ���� ��ȸ
	ArrayList<HashMap<String, Object>> selectPoint(int usersNo, PageInfo pi);

//	int deletePoint(HashMap<String, Object> map);
//
//	int updatePoint(HashMap<String, Object> map);

	int getReviewCount(int usersNo);
	
	ArrayList<HashMap<String, Object>> selectReview(int usersNo, PageInfo pi);

	int getBoardCount(int usersNo);

	int getReplyCount(int usersNo);

	int getQnaCount(int usersNo);

	ArrayList<HashMap<String, Object>> selectBoardList(int usersNo, PageInfo bpi);

	ArrayList<HashMap<String, Object>> selectReplyList(int usersNo, PageInfo rpi);

	ArrayList<Qna> selectQnaList(int usersNo, PageInfo qpi);



}
