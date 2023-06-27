package kh.finalproj.hollosekki.menu.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.menu.dao.MenuDAO;

@Service
public class MenuServiceImpl implements MenuService{
	@Autowired
	private MenuDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
}
