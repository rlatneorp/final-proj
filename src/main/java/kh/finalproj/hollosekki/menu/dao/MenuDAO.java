package kh.finalproj.hollosekki.menu.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;

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

}
