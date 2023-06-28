package kh.finalproj.hollosekki.menu.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.menu.dao.MenuDAO;

@Service
public class MenuServiceImpl implements MenuService{
	@Autowired
	private MenuDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return mDAO.getListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Menu> selectMenuList(PageInfo pi) {
		return mDAO.selectMenuList(sqlSession, pi);
	}
	
	@Override
	public ArrayList<Image> selectMenuImage() {
		return mDAO.selectMenuImage(sqlSession);
	}
}
