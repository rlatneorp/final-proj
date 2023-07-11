package kh.finalproj.hollosekki.users.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.common.model.vo.BookMark;
import kh.finalproj.hollosekki.common.model.vo.Follow;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.vo.Orders;
import kh.finalproj.hollosekki.market.model.vo.Review;
import kh.finalproj.hollosekki.market.model.vo.ShippingAddress;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;

@Repository
public class UsersDAO {

	public int updatePwd(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.update("usersMapper.updatePwd", map);
	}

	public int updateInfo(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.update("usersMapper.updateInfo", u);
	}

	public int insertImage(SqlSessionTemplate sqlSession, Image image) {
		return sqlSession.insert("usersMapper.insertImage", image);
	}

	public int updateProfile(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.update("usersMapper.updateProfile", u);
	}

	public Image selectImage(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("usersMapper.selectImage", usersNo);
	}

	public int deleteImage(SqlSessionTemplate sqlSession, Image existingImage) {
		return sqlSession.delete("usersMapper.deleteImage", existingImage);
	}

	public int deleteImage(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.delete("usersMapper.deleteImagebase", usersNo);
	}

	public Users selectInfo(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.selectOne("usersMapper.selectInfo", u);
	}

	public int deleteInfo(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.update("usersMapper.deleteInfo", usersNo);
	}

	public ArrayList<HashMap<String, Object>> selectFollowing(SqlSessionTemplate sqlSession, int usersNo) {
		return (ArrayList)sqlSession.selectList("usersMapper.selectFollowing", usersNo);
	}

	public ArrayList<HashMap<String, Object>> selectFollower(SqlSessionTemplate sqlSession, int usersNo) {
		return (ArrayList)sqlSession.selectList("usersMapper.selectFollower", usersNo);
	}

	public int deleteFollow(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.delete("usersMapper.deleteFollow", map);
	}

	public int insertFollow(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("usersMapper.insertFollow", map);
	}

	public int getMyRecipeListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> listMap) {
		return sqlSession.selectOne("usersMapper.getMyRecipeListCount", listMap);
	}
	
	public ArrayList<HashMap<String, Object>> selectMyRecipe(SqlSessionTemplate sqlSession, HashMap<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.selectMyRecipe", map, rowBounds);
	}

	public int getBookListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> listMap) {
		return sqlSession.selectOne("usersMapper.getBookListCount", listMap);
	}
	
	public ArrayList<HashMap<String, Object>> myBookMarkList(SqlSessionTemplate sqlSession, HashMap<String, Object> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.myBookMarkList", map, rowBounds);
	}
	
//	public int getFoodListCount(SqlSessionTemplate sqlSession, int usersNo) {
//		return sqlSession.selectOne("usersMapper.getFoodListCount", usersNo);
//	}
//	
//	public int getRecipeListCount(SqlSessionTemplate sqlSession, int usersNo) {
//		return sqlSession.selectOne("usersMapper.getRecipeListCount", usersNo);
//	}
//	
//	public int getingredientListCount(SqlSessionTemplate sqlSession, int usersNo) {
//		return sqlSession.selectOne("usersMapper.getingredientListCount", usersNo);
//	}
	
	public int getLikeListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> listMap) {
		return sqlSession.selectOne("usersMapper.getLikeListCount", listMap);
	}

//	public ArrayList<HashMap<String, Object>> myFoodLikeList(SqlSessionTemplate sqlSession, int usersNo, int selectType, String selectTitle, PageInfo pi) {
//		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("usersNo", usersNo);
//		map.put("selectType", selectType);
//		map.put("selectTitle", selectTitle);
//		
//		return (ArrayList)sqlSession.selectList("usersMapper.myFoodLikeList", map, rowBounds);
//	}
//
//	public ArrayList<HashMap<String, Object>> myRecipeLikeList(SqlSessionTemplate sqlSession, int usersNo, String selectTitle, PageInfo pi) {
//		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("usersNo", usersNo);
//		map.put("selectTitle", selectTitle);
//		
//		return (ArrayList)sqlSession.selectList("usersMapper.myRecipeLikeList", map, rowBounds);
//	}
//
//	public ArrayList<HashMap<String, Object>> myProductLikeList(SqlSessionTemplate sqlSession, int usersNo, String selectTitle, PageInfo pi) {
//		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
//		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("usersNo", usersNo);
//		map.put("selectTitle", selectTitle);
//		
//		return (ArrayList)sqlSession.selectList("usersMapper.myProductLikeList", map, rowBounds);
//	}
	
	public ArrayList<HashMap<String, Object>> myLikeList(SqlSessionTemplate sqlSession, HashMap<String, Object> map,
			PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.myLikeList", map, rowBounds);
	}

	public int deleteBookMark(SqlSessionTemplate sqlSession, int bookmarkNo) {
		return sqlSession.delete("usersMapper.deleteBookMark", bookmarkNo);
	}

	public int deleteLike(SqlSessionTemplate sqlSession, int likeNo) {
		return sqlSession.delete("usersMapper.deleteLike", likeNo);
	}

	public int updateAddress(SqlSessionTemplate sqlSession, ShippingAddress sa) {
		return sqlSession.update("usersMapper.updateAddress", sa);
	}

	public ArrayList<Orders> selectOrderList(SqlSessionTemplate sqlSession, int usersNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.selectOrderList", usersNo, rowBounds);
	}

	public int orderListCount(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("usersMapper.orderListCount", usersNo);
	}

	public Orders selectDetailOrder(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("usersMapper.selectDetailOrder", orderNo);
	}

	public ArrayList<Orders> selectPeriodOrders(SqlSessionTemplate sqlSession, Properties prop) {
		return (ArrayList)sqlSession.selectList("usersMapper.selectPeriodOrders", prop);
	}

	public int orderPeriodCount(SqlSessionTemplate sqlSession, Properties prop) {
		return sqlSession.selectOne("usersMapper.orderPeriodCount", prop);
	}

	public ArrayList<Orders> selectPeriodOrders(SqlSessionTemplate sqlSession, Properties prop, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.selectPeriodOrders", prop, rowBounds);
	}

	public int orderSearchCount(SqlSessionTemplate sqlSession, Properties prop) {
		return sqlSession.selectOne("usersMapper.orderSearchCount", prop);
	}

	public ArrayList<Orders> orderSearch(SqlSessionTemplate sqlSession, Properties prop, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.orderSearch", prop, rowBounds);
	}

	public int getPointCount(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("usersMapper.getPointCount", usersNo);

	}
	
	public ArrayList<HashMap<String, Object>> selectPoint(SqlSessionTemplate sqlSession, int usersNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.selectPoint", usersNo, rowBounds);
	}

//	public int deletePoint(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
//		return sqlSession.insert("usersMapper.deletePoint", map);
//	}
//
//	public int updatePoint(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
//		return sqlSession.insert("usersMapper.updatePoint", map);
//	}
	
	public int getReviewCount(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("usersMapper.getReviewCount", usersNo);
	}

	public ArrayList<HashMap<String, Object>> selectReview(SqlSessionTemplate sqlSession, int usersNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("usersMapper.selectReview", usersNo, rowBounds);
	}


	

}
