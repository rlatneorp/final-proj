package kh.finalproj.hollosekki.users.model.service;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.enroll.model.vo.Users;
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
	
	
}
