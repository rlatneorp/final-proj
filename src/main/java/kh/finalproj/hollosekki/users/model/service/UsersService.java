package kh.finalproj.hollosekki.users.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kh.finalproj.hollosekki.common.model.vo.BookMark;
import kh.finalproj.hollosekki.common.model.vo.Follow;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
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

	ArrayList<Recipe> selectMyRecipe(int usersNo, PageInfo pi);

	int recipeBookCount(int foodNo);

	int recipeLikeCount(int foodNo);

	ArrayList<HashMap<String, Object>> myBookMarkList(int usersNo, PageInfo pi);

	ArrayList<HashMap<String, Object>> myLikeList(int usersNo, PageInfo pi);

	ArrayList<HashMap<String, Object>> myFoodLikeList(int usersNo, PageInfo pi);

	
}
