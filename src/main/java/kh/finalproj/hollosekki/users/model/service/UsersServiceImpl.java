package kh.finalproj.hollosekki.users.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import org.apache.ibatis.session.SqlSessionManager;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import kh.finalproj.hollosekki.users.model.dao.UsersDAO;

@Service
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	private UsersDAO uDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int updatePwd(HashMap<String, String> map) {
		return uDAO.updatePwd(sqlSession, map);
	}

	@Override
	public int updateInfo(Users u) {
		return uDAO.updateInfo(sqlSession, u);
	}

	@Override
	public int insertImage(Image image) {
		return uDAO.insertImage(sqlSession, image);
	}

	@Override
	public int updateProfile(Users u) {
		return uDAO.updateProfile(sqlSession, u);
	}

	@Override
	public Image selectImage(int usersNo) {
		return uDAO.selectImage(sqlSession, usersNo);
	}

	@Override
	public int deleteImage(Image existingImage) {
		return uDAO.deleteImage(sqlSession, existingImage);
	}

	@Override
	public int deleteImage(int usersNo) {
		return uDAO.deleteImage(sqlSession, usersNo);
	}

	@Override
	public Users selectInfo(Users u) {
		return uDAO.selectInfo(sqlSession, u);
	}
	
	@Override
	public int deleteInfo(int usersNo) {
		return uDAO.deleteInfo(sqlSession, usersNo);
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> selectFollowing(int usersNo) {
		return uDAO.selectFollowing(sqlSession, usersNo);
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> selectFollower(int usersNo) {
		return uDAO.selectFollower(sqlSession, usersNo);
	}
	
	@Override
	public int deleteFollow(HashMap<String, Object> map) {
		return uDAO.deleteFollow(sqlSession, map);
	}
	
	@Override
	public int insertFollow(HashMap<String, Object> map) {
		return uDAO.insertFollow(sqlSession, map);
	}
	
	@Override
	public int getMyRecipeListCount(HashMap<String, Object> listMap) {
		return uDAO.getMyRecipeListCount(sqlSession, listMap);
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> selectMyRecipe(HashMap<String, Object> map, PageInfo pi) {
		return uDAO.selectMyRecipe(sqlSession, map, pi);
	}
	
	@Override
	public int getBookListCount(HashMap<String, Object> listMap) {
		return uDAO.getBookListCount(sqlSession, listMap);
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> myBookMarkList(HashMap<String, Object> map, PageInfo pi) {
		return uDAO.myBookMarkList(sqlSession, map, pi);
	}
	
//	@Override
//	public int getFoodListCount(int usersNo) {
//		return uDAO.getFoodListCount(sqlSession, usersNo);
//	}
//	
//	@Override
//	public int getRecipeListCount(int usersNo) {
//		return uDAO.getRecipeListCount(sqlSession, usersNo);
//	}
//	
//	@Override
//	public int getingredientListCount(int usersNo) {
//		return uDAO.getingredientListCount(sqlSession, usersNo);
//	}
	
	@Override
	public int getLikeListCount(HashMap<String, Object> listMap) {
		return uDAO.getLikeListCount(sqlSession, listMap);
	}
	
//	@Override
//	public ArrayList<HashMap<String, Object>> myFoodLikeList(int usersNo, int selectType, String selectTitle, PageInfo pi) {
//		return uDAO.myFoodLikeList(sqlSession, usersNo, selectType, selectTitle, pi);
//	}
//	
//	@Override
//	public ArrayList<HashMap<String, Object>> myRecipeLikeList(int usersNo, String selectTitle, PageInfo pi) {
//		return uDAO.myRecipeLikeList(sqlSession, usersNo, selectTitle, pi);
//	}
//	
//	@Override
//	public ArrayList<HashMap<String, Object>> myProductLikeList(int usersNo, String selectTitle, PageInfo pi) {
//		return uDAO.myProductLikeList(sqlSession, usersNo, selectTitle, pi);
//	}
	
	@Override
	public ArrayList<HashMap<String, Object>> myLikeList(HashMap<String, Object> map, PageInfo pi) {
		return uDAO.myLikeList(sqlSession, map, pi);
	}
	
	@Override
	public int deleteBookMark(int bookmarkNo) {
		return uDAO.deleteBookMark(sqlSession, bookmarkNo);
	}
	
	@Override
	public int deleteLike(int likeNo) {
		return uDAO.deleteLike(sqlSession, likeNo);
	}
	
	@Override
	public int updateAddress(ShippingAddress sa) {
		return uDAO.updateAddress(sqlSession, sa);
	}
	
	//�ֹ� ����Ʈ ��ȸ
	@Override
	public ArrayList<Orders> selectOrderList(int usersNo, PageInfo pi) {
		return uDAO.selectOrderList(sqlSession, usersNo, pi);
	}
	
	@Override
	public int orderListCount(int usersNo) {
		return uDAO.orderListCount(sqlSession, usersNo);
	}
	
	@Override
	public Orders selectDetailOrder(int orderNo) {
		return uDAO.selectDetailOrder(sqlSession, orderNo);
	}
	
	//�Ⱓ �� �ֹ� ����Ʈ ��ȸ 
	@Override
	public ArrayList<Orders> selectPeriodOrders(Properties prop, PageInfo pi) {
		return uDAO.selectPeriodOrders(sqlSession, prop, pi);
	}	
	
	@Override
	public int orderPeriodCount(Properties prop) {
		return uDAO.orderPeriodCount(sqlSession, prop);
	}
	
	@Override
	public int orderSearchCount(Properties prop) {
		return uDAO.orderSearchCount(sqlSession, prop);
	}
	
	@Override
	public ArrayList<Orders> orderSearch(Properties prop, PageInfo pi) {
		return uDAO.orderSearch(sqlSession, prop, pi);
	}
	
	@Override
	public int getPointCount(int usersNo) {
		return uDAO.getPointCount(sqlSession, usersNo);
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> selectPoint(int usersNo, PageInfo pi) {
		return uDAO.selectPoint(sqlSession, usersNo, pi);
	}
	
//	@Override
//	public int deletePoint(HashMap<String, Object> map) {
//		return uDAO.deletePoint(sqlSession, map);
//	}
//	
//	@Override
//	public int updatePoint(HashMap<String, Object> map) {
//		return uDAO.updatePoint(sqlSession, map);
//	}
	
	@Override
	public int getReviewCount(int usersNo) {
		return uDAO.getReviewCount(sqlSession, usersNo);
	}
	
	public ArrayList<HashMap<String, Object>> selectReview(int usersNo, PageInfo pi) {
		return uDAO.selectReview(sqlSession, usersNo, pi);
	}

	@Override
	public int getBoardCount(int usersNo) {
		return uDAO.getBoardCount(sqlSession, usersNo);
	}

	@Override
	public int getReplyCount(int usersNo) {
		return uDAO.getReplyCount(sqlSession, usersNo);
	}

	@Override
	public int getQnaCount(int usersNo) {
		return uDAO.getQnaCount(sqlSession, usersNo);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectBoardList(int usersNo, PageInfo bpi) {
		return uDAO.selectBoardList(sqlSession, usersNo, bpi);
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectReplyList(int usersNo, PageInfo rpi) {
		return uDAO.selectReplyList(sqlSession, usersNo, rpi);
	}

	@Override
	public ArrayList<Qna> selectQnaList(int usersNo, PageInfo qpi) {
		return uDAO.selectQnaList(sqlSession, usersNo, qpi);
	}
	
	@Override
	public int updateNickName(Users u) {
		return uDAO.updateNickName(sqlSession, u);
	}
	
}
