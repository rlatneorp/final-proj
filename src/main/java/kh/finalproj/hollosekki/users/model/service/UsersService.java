package kh.finalproj.hollosekki.users.model.service;

import java.util.HashMap;

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


}
