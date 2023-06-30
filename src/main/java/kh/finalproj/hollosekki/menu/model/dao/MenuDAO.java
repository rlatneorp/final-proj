package kh.finalproj.hollosekki.menu.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.menu.model.vo.MenuList;

@Repository
public class MenuDAO {

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("menuMapper.getListCount");
	}

	public ArrayList<Menu> selectMenuList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("menuMapper.selectMenuList", null, rowBounds);
	}

	public ArrayList<Image> selectMenuImage(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("menuMapper.selectMenuImage");
	}

	public Menu menuDetail(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("menuMapper.menuDetail", mNo);
	}

	public Image menuDetailThum(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("menuMapper.menuDetailThum", mNo);
	}

	public ArrayList<MenuList> menuDetailMenu(SqlSessionTemplate sqlSession, int mNo) {
		return (ArrayList)sqlSession.selectList("menuMapper.menuDetailMenu", mNo);
	}

	public ArrayList<Image> menuDetailImage(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("menuMapper.menuDetailImage");
	}

	public ArrayList<Menu> searchMenu(SqlSessionTemplate sqlSession, String word) {
		return (ArrayList)sqlSession.selectList("menuMapper.searchMenu", word);
	}

}
