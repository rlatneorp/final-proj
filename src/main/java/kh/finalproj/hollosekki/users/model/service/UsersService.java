package kh.finalproj.hollosekki.users.model.service;

import java.util.HashMap;

import kh.finalproj.hollosekki.enroll.model.vo.Users;

public interface UsersService {

	int updatePwd(HashMap<String, String> map);

	int updateInfo(Users u);


}
