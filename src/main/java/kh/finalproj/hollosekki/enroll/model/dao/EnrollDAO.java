package kh.finalproj.hollosekki.enroll.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.board.model.vo.Board;
import kh.finalproj.hollosekki.common.model.vo.BookMark;
import kh.finalproj.hollosekki.common.model.vo.Follow;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.Product;
import kh.finalproj.hollosekki.enroll.model.vo.SocialLogin;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.vo.Review;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;

@Repository
public class EnrollDAO {

	public int insertUser(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.insert("enrollMapper.insertUser", u);
	}

	public Users login(SqlSessionTemplate sqlSession, Users u) {
		return sqlSession.selectOne("enrollMapper.login", u);
	}

	public int checkId(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("enrollMapper.checkId", id);
	}

	public int checkNickName(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("enrollMapper.checkNickName", nickName);
	}

	public Users findIdResult(SqlSessionTemplate sqlSession, String name, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", name);
		map.put("email", email);
		return sqlSession.selectOne("enrollMapper.findIdResult", map);
	}

	public int findPwdCheck(SqlSessionTemplate sqlSession, String id, String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("email", email);
		return sqlSession.selectOne("enrollMapper.findPwdCheck", map);
	}

	public int updatePwdResult(SqlSessionTemplate sqlSession, String id, String usersPwd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("usersPwd", usersPwd);
		return sqlSession.update("enrollMapper.updatePwdResult", map);
	}
	
	

	public int checkEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("enrollMapper.checkEmail", email);
	}

	public SocialLogin socialLogin(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("enrollMapper.socialLogin", id);
	}

	public int socialInsertUser(SqlSessionTemplate sqlSession, SocialLogin sl2) {
		return sqlSession.insert("enrollMapper.socialInsertUser", sl2);
	}

	public Users socialLoginUpdate(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("enrollMapper.socialLoginUpdate", id);
	}

	public void socialInfoUpdate(SqlSessionTemplate sqlSession, String id, String profileImg) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("profileImg", profileImg);
		sqlSession.update("enrollMapper.socialInfoUpdate", map);
		
	}

	public void socialInfoUpdate2(SqlSessionTemplate sqlSession, String id, String name, String nickName) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("name", name);
		map.put("nickName", nickName);
		sqlSession.update("enrollMapper.socialInfoUpdate2", map);
	}

	public ArrayList<Recipe> recipeList(SqlSessionTemplate sqlSession, int usersNo) {
		return (ArrayList)sqlSession.selectList("enrollMapper.recipeList", usersNo);
	}

	public ArrayList<Image> recipeImageList(SqlSessionTemplate sqlSession, int foodNo) {
		return (ArrayList)sqlSession.selectList("enrollMapper.recipeImageList", foodNo);
	}

	public ArrayList<BookMark> bookMarkList(SqlSessionTemplate sqlSession, int usersNo) {
		return (ArrayList)sqlSession.selectList("enrollMapper.bookMarkList", usersNo);
	}

	public ArrayList<Menu> menuList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("enrollMapper.menuList");
	}

	public int follow(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("enrollMapper.follow", usersNo);
	}

	public int following(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("enrollMapper.following", usersNo);
	}

	public ArrayList<Image> menuImageList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("enrollMapper.menuImageList");
	}

	public ArrayList<Product> productList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("enrollMapper.productList");
	}

	public ArrayList<Users> AllUsersList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("enrollMapper.AllUsersList");
	}

	public ArrayList<Recipe> allRecipeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("enrollMapper.allRecipeList");
	}

	public ArrayList<Image> allRecipeImageList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("enrollMapper.allRecipeImageList");
	}

	public ArrayList<Follow> followList(SqlSessionTemplate sqlSession, int usersNo) {
		return (ArrayList)sqlSession.selectList("enrollMapper.followList", usersNo);
	}

	public ArrayList<Follow> followingLsit(SqlSessionTemplate sqlSession, int usersNo) {
		return (ArrayList)sqlSession.selectList("enrollMapper.followingLsit", usersNo);
	}

	public ArrayList<Follow> loginUserFollowingList(SqlSessionTemplate sqlSession, int usersNo) {
		return (ArrayList)sqlSession.selectList("enrollMapper.loginUserFollowingList", usersNo);
	}

	public ArrayList<BookMark> recipeBookMarkList(SqlSessionTemplate sqlSession, int usersNo) {
		return (ArrayList)sqlSession.selectList("enrollMapper.recipeBookMarkList", usersNo);
	}

	public int menuBookMarkList(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("enrollMapper.menuBookMarkList", usersNo);
	}

	public ArrayList<Board> boardList(SqlSessionTemplate sqlSession, int usersNo) {
		return (ArrayList)sqlSession.selectList("enrollMapper.boardList", usersNo);
	}

	public ArrayList<Review> reviewList(SqlSessionTemplate sqlSession, String usersId) {
		return (ArrayList)sqlSession.selectList("enrollMapper.reviewList", usersId);
	}

	public ArrayList<Review> menuReviewList(SqlSessionTemplate sqlSession, String usersId) {
		return (ArrayList)sqlSession.selectList("enrollMapper.menuReviewList", usersId);
	}

	public ArrayList<Review> replyList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("enrollMapper.replyList");
	}

	public ArrayList<Board> allBoardList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("enrollMapper.allBoardList");
	}

	public ArrayList<Review> userReplyList(SqlSessionTemplate sqlSession, String nickName) {
		return (ArrayList)sqlSession.selectList("enrollMapper.userReplyList", nickName);
	}




}
