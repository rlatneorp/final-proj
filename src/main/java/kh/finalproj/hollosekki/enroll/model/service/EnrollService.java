package kh.finalproj.hollosekki.enroll.model.service;

import java.util.ArrayList;

import kh.finalproj.hollosekki.common.model.vo.BookMark;
import kh.finalproj.hollosekki.common.model.vo.Follow;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.Product;
import kh.finalproj.hollosekki.enroll.model.vo.SocialLogin;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;

public interface EnrollService {

	int insertUser(Users u);

	Users login(Users u);

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

	void socialInfoUpdate2(String id, String name);

	ArrayList<Recipe> recipeList(int usersNo);

	ArrayList<Image> recipeImageList(int foodNo);

	ArrayList<BookMark> bookMarkList(int usersNo);

	ArrayList<Menu> menuList();

	int follow(int usersNo);

	int following(int usersNo);

	ArrayList<Image> menuImageList();

	ArrayList<Product> productList();

	ArrayList<Users> healtherList();

	ArrayList<Recipe> allRecipeList();

	ArrayList<Image> allRecipeImageList();

	ArrayList<Follow> followList(int usersNo);

	ArrayList<Follow> followingLsit(int usersNo);

	ArrayList<Follow> loginUserFollowingList(int usersNo);

	int recipeBookMarkList(int usersNo);

	int menuBookMarkList(int usersNo);




}
