package kh.finalproj.hollosekki.enroll.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.board.model.vo.Board;
import kh.finalproj.hollosekki.common.model.vo.BookMark;
import kh.finalproj.hollosekki.common.model.vo.Follow;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.Product;
import kh.finalproj.hollosekki.enroll.model.dao.EnrollDAO;
import kh.finalproj.hollosekki.enroll.model.vo.SocialLogin;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.vo.Review;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;

@Service
public class EnrollServiceImpl implements EnrollService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private EnrollDAO eDAO;

	@Override
	public int insertUser(Users u) {
		return eDAO.insertUser(sqlSession, u);
	}

	@Override
	public Users login(Users u) {
		return eDAO.login(sqlSession, u);
	}

	@Override
	public int checkId(String id) {
		return eDAO.checkId(sqlSession, id);
	}

	@Override
	public int checkNickName(String nickName) {
		return eDAO.checkNickName(sqlSession, nickName);
	}

	@Override
	public int checkEmail(String email) {
		return eDAO.checkEmail(sqlSession, email);
	}
	
	@Override
	public Users findIdResult(String name, String email) {
		return eDAO.findIdResult(sqlSession, name, email);
	}

	@Override
	public int findPwdCheck(String id, String email) {
		return eDAO.findPwdCheck(sqlSession, id, email);
	}

	@Override
	public int updatePwdResult(String id, String usersPwd) {
		return eDAO.updatePwdResult(sqlSession, id, usersPwd);
	}

	@Override
	public SocialLogin SocialLogin(String id) {
		return eDAO.socialLogin(sqlSession, id);
	}

	@Override
	public int socialInsertUser(SocialLogin sl2) {
		return eDAO.socialInsertUser(sqlSession, sl2);
	}

	@Override
	public Users socialLoginUpdate(String id) {
		return eDAO.socialLoginUpdate(sqlSession, id);
	}

	@Override
	public void socialInfoUpdate(String id, String profileImg) {
		eDAO.socialInfoUpdate(sqlSession, id, profileImg);
	}

	@Override
	public void socialInfoUpdate2(String id, String name, String nickName) {
		eDAO.socialInfoUpdate2(sqlSession, id, name, nickName);
	}

	@Override
	public ArrayList<Recipe> recipeList(int usersNo) {
		return eDAO.recipeList(sqlSession, usersNo);
	}

	@Override
	public ArrayList<Image> recipeImageList(int foodNo) {
		return eDAO.recipeImageList(sqlSession, foodNo);
	}

	@Override
	public ArrayList<BookMark> bookMarkList(int usersNo) {
		return eDAO.bookMarkList(sqlSession, usersNo);
	}

	@Override
	public ArrayList<Menu> menuList() {
		return eDAO.menuList(sqlSession);
	}

	@Override
	public int follow(int usersNo) {
		return eDAO.follow(sqlSession, usersNo);
	}

	@Override
	public int following(int usersNo) {
		return eDAO.following(sqlSession, usersNo);
	}

	@Override
	public ArrayList<Image> menuImageList() {
		return eDAO.menuImageList(sqlSession);
	}

	@Override
	public ArrayList<Product> productList() {
		return eDAO.productList(sqlSession);
	}

	@Override
	public ArrayList<Users> healtherList() {
		return eDAO.healtherList(sqlSession);
	}

	@Override
	public ArrayList<Recipe> allRecipeList() {
		return eDAO.allRecipeList(sqlSession);
	}

	@Override
	public ArrayList<Image> allRecipeImageList() {
		return eDAO.allRecipeImageList(sqlSession);
	}

	@Override
	public ArrayList<Follow> followList(int usersNo) {
		return eDAO.followList(sqlSession, usersNo);
	}

	@Override
	public ArrayList<Follow> followingLsit(int usersNo) {
		return  eDAO.followingLsit(sqlSession, usersNo);
	}

	@Override
	public ArrayList<Follow> loginUserFollowingList(int usersNo) {
		return eDAO.loginUserFollowingList(sqlSession, usersNo);
	}

	@Override
	public int recipeBookMarkList(int usersNo) {
		return eDAO.recipeBookMarkList(sqlSession, usersNo);
	}

	@Override
	public int menuBookMarkList(int usersNo) {
		return eDAO.menuBookMarkList(sqlSession, usersNo);
	}

	@Override
	public ArrayList<Board> boardList(int usersNo) {
		return eDAO.boardList(sqlSession, usersNo);
	}

	@Override
	public ArrayList<Review> reviewList(String usersId) {
		return eDAO.reviewList(sqlSession, usersId);
	}

	@Override
	public ArrayList<Review> menuReviewList(String usersId) {
		return eDAO.menuReviewList(sqlSession, usersId);
	}

	@Override
	public ArrayList<Image> menuReviewImageList() {
		return eDAO.menuReviewImageList(sqlSession);
	}

	@Override
	public ArrayList<Review> replyList() {
		return eDAO.replyList(sqlSession);
	}

	
}
