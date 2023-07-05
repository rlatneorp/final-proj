package kh.finalproj.hollosekki.enroll.model.service;

import java.util.ArrayList;

import kh.finalproj.hollosekki.board.model.vo.Board;
import kh.finalproj.hollosekki.common.model.vo.BookMark;
import kh.finalproj.hollosekki.common.model.vo.Follow;
import kh.finalproj.hollosekki.common.model.vo.Healther;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.Product;
import kh.finalproj.hollosekki.enroll.model.vo.SocialLogin;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.vo.Review;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;

public interface EnrollService {

	int insertUser(Users u);

	Users login2(Users u);

	int checkId(String id);

	int checkNickName(String nickName);

	int checkEmail(String email);
	Users findIdResult(String name, String email);

	int findPwdCheck(String id, String email);

	int updatePwdResult(String id, String usersPwd);

	SocialLogin SocialLogin(String id);

	int socialInsertUser(SocialLogin sl2);

	Users socialLoginUpdate(String id);

	void socialInfoUpdate(String id, String profileImg);

	void socialInfoUpdate2(String id, String name, String nickName);

	ArrayList<Recipe> recipeList(int usersNo);

	ArrayList<Image> recipeImageList(int foodNo);

	ArrayList<BookMark> bookMarkList(int usersNo);

	ArrayList<Menu> menuList();

	int follow(int usersNo);

	int following(int usersNo);

	ArrayList<Image> menuImageList();

	ArrayList<Product> productList();

	ArrayList<Users> AllUsersList();

	ArrayList<Recipe> allRecipeList();

	ArrayList<Image> allRecipeImageList();

	ArrayList<Follow> followList(int usersNo);

	ArrayList<Follow> followingLsit(int usersNo);

	ArrayList<Follow> loginUserFollowingList(int usersNo);

	ArrayList<BookMark> recipeBookMarkList(int usersNo);

	int menuBookMarkList(int usersNo);

	ArrayList<Board> boardList(int usersNo);
	
	ArrayList<Review> reviewList(String usersId);

	ArrayList<Review> menuReviewList(String usersId);

	ArrayList<Review> replyList();

	ArrayList<Board> allBoardList();

	ArrayList<Review> userReplyList(String nickName);

	void insertPoint(Users u);

	Users login(Users u);

	ArrayList<Recipe> mainRecipeList();

	ArrayList<Healther> healtherList();

	ArrayList<Menu> menuProductList();






}
