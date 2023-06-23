package kh.finalproj.hollosekki.users.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSessionManager;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.common.model.vo.Follow;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
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
	public ArrayList<Recipe> selectMyRecipe(int usersNo, PageInfo pi) {
		return uDAO.selectMyRecipe(sqlSession, usersNo, pi);
	}
	
	@Override
	public int recipeBookCount(int foodNo) {
		return uDAO.recipeBookCount(sqlSession, foodNo);
	}
	
	@Override
	public int recipeLikeCount(int foodNo) {
		return uDAO.recipeLikeCount(sqlSession, foodNo);
	}
}
