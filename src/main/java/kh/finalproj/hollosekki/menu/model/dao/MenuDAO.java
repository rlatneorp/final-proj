package kh.finalproj.hollosekki.menu.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Likes;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Product;
import kh.finalproj.hollosekki.common.model.vo.QNA;
import kh.finalproj.hollosekki.common.model.vo.Review;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.vo.Orders;
import kh.finalproj.hollosekki.market.model.vo.QA;
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

	public ArrayList<Menu> searchMenu(SqlSessionTemplate sqlSession, PageInfo pi, String word) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("menuMapper.searchMenu", word, rowBounds);
	}

	public ArrayList<Menu> menuCategory(SqlSessionTemplate sqlSession, PageInfo pi, int cate) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("menuMapper.menuCategory", cate, rowBounds);
	}

	public int selectUsersNo(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("menuMapper.selectUsersNo", mNo);
	}

	public ArrayList<Product> healtherInfo(SqlSessionTemplate sqlSession, int usersNo) {
		return (ArrayList)sqlSession.selectList("menuMapper.healtherInfo", usersNo);
	}

	public int selectBookmark(SqlSessionTemplate sqlSession, int usersNo, int productNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usersNo", usersNo);
		map.put("productNo", productNo);
		return sqlSession.selectOne("menuMapper.selectBookmark", map);
	}

	public int insertBookmark(SqlSessionTemplate sqlSession, int usersNo, int divisionNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usersNo", usersNo);
		map.put("divisionNo", divisionNo);
		return sqlSession.insert("menuMapper.insertBookmark", map);
	}

	public int deleteBookmark(SqlSessionTemplate sqlSession, int usersNo, int divisionNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usersNo", usersNo);
		map.put("divisionNo", divisionNo);
		return sqlSession.delete("menuMapper.deleteBookmark", map);
	}

	public ArrayList<Menu> menuScore(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("menuMapper.menuScore");
	}

	public ArrayList<Likes> likeList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("menuMapper.likeList");
	}

	public ArrayList<Likes> loginUserLikeList(SqlSessionTemplate sqlSession, Users u) {
		return (ArrayList)sqlSession.selectList("menuMapper.loginUserLikeList", u);
	}

	public int getReviewCount(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("menuMapper.getReviewCount", mNo);
	}
	
	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, PageInfo rpi, int mNo) {
		int offset = (rpi.getCurrentPage() - 1) * rpi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, rpi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("menuMapper.selectReviewList", mNo, rowBounds);
	}

	public int myReview(SqlSessionTemplate sqlSession, Review my) {
		return sqlSession.selectOne("menuMapper.myReview", my);
	}

	public ArrayList<Orders> selectMyOrders(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return (ArrayList)sqlSession.selectList("menuMapper.selectMyOrders", map);
	}

	public int insertReview(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("menuMapper.insertReview", map);
	}

	public int updateReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.update("menuMapper.updateReview", r);
	}

	public ArrayList<HashMap<String, Object>> notReview(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return (ArrayList)sqlSession.selectList("menuMapper.notReview", map);
	}

	public ArrayList<Review> selectMyReviewList(SqlSessionTemplate sqlSession, HashMap<String, Object> myMap, PageInfo mpi) {
		int offset = (mpi.getCurrentPage() - 1) * mpi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, mpi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("menuMapper.selectMyReviewList", myMap, rowBounds);
	}
	
	public int getQnaCount(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("menuMapper.getQnaCount", mNo);
	}

	public ArrayList<QA> selectQnaList(SqlSessionTemplate sqlSession, PageInfo qpi, int mNo) {
		int offset = (qpi.getCurrentPage() - 1) * qpi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, qpi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("menuMapper.selectQnaList", mNo, rowBounds);
	}

	public int insertQna(SqlSessionTemplate sqlSession, QA qna) {
		return sqlSession.insert("menuMapper.insertQna", qna);
	}

	public Image selectProfile(SqlSessionTemplate sqlSession, int usersNo) {
		return sqlSession.selectOne("menuMapper.selectProfile", usersNo);
	}

	public int getCateListCount(SqlSessionTemplate sqlSession, int cate) {
		return sqlSession.selectOne("menuMapper.getCateListCount", cate);
	}

	public int getSearchListCount(SqlSessionTemplate sqlSession, String word) {
		return sqlSession.selectOne("menuMapper.getSearchListCount", word);
	}

	public String selectMenuId(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("menuMapper.selectMenuId", mNo);
	}

	public int addCount(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.update("menuMapper.addCount", mNo);
	}


}
