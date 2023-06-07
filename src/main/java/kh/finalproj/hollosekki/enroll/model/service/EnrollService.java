package kh.finalproj.hollosekki.enroll.model.service;

import kh.finalproj.hollosekki.enroll.model.vo.Users;

public interface EnrollService {

	int insertUser(Users u);

	Users login(Users u);

	int checkId(String id);

	int checkNickName(String nickName);

}
