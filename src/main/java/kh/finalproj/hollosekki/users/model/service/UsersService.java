package kh.finalproj.hollosekki.users.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import kh.finalproj.hollosekki.common.model.vo.Follow;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.enroll.model.vo.Users;

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

	
}
