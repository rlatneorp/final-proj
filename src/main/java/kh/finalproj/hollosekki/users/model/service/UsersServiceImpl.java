package kh.finalproj.hollosekki.users.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.users.model.dao.UsersDAO;

@Service
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	private UsersDAO uDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
}
