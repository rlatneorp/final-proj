package kh.finalproj.hollosekki.menu.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import kh.finalproj.hollosekki.menu.model.dao.MenuDAO;
import kh.finalproj.hollosekki.menu.model.vo.MenuList;

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
	
	@Override
	public Menu menuDetail(int mNo) {
		return mDAO.menuDetail(sqlSession, mNo);
	}
	
	@Override
	public Image menuDetailThum(int mNo) {
		return mDAO.menuDetailThum(sqlSession, mNo);
	}
	
	@Override
	public ArrayList<MenuList> menuDetailMenu(int mNo) {
		return mDAO.menuDetailMenu(sqlSession, mNo);
	}
	
	@Override
	public ArrayList<Image> menuDetailImage() {
		return mDAO.menuDetailImage(sqlSession);
	}
	
	@Override
	public ArrayList<Menu> searchMenu(PageInfo pi, String word) {
		return mDAO.searchMenu(sqlSession, pi, word);
	}
	
	@Override
	public ArrayList<Menu> menuCategory(PageInfo pi, int cate) {
		return mDAO.menuCategory(sqlSession, pi, cate);
	}
	
	@Override
	public int selectUsersNo(int mNo) {
		return mDAO.selectUsersNo(sqlSession, mNo);
	}
	
	@Override
	public ArrayList<Product> healtherInfo(int usersNo) {
		return mDAO.healtherInfo(sqlSession, usersNo);
	}

	@Override
	public int selectBookmark(int usersNo, int productNo) {
		return mDAO.selectBookmark(sqlSession, usersNo, productNo);
	}

	@Override
	public int insertBookmark(int usersNo, int divisionNo) {
		return mDAO.insertBookmark(sqlSession, usersNo, divisionNo);
	}

	@Override
	public int deleteBookmark(int usersNo, int divisionNo) {
		return mDAO.deleteBookmark(sqlSession, usersNo, divisionNo);
	}

	@Override
	public ArrayList<Menu> menuScore() {
		return mDAO.menuScore(sqlSession);
	}

	@Override
	public ArrayList<Likes> likeList() {
		return mDAO.likeList(sqlSession);
	}

	@Override
	public ArrayList<Likes> loginUserLikeList(Users u) {
		return mDAO.loginUserLikeList(sqlSession, u);
	}
	
	@Override
	public int getReviewCount(int mNo) {
		return mDAO.getReviewCount(sqlSession, mNo);
	}
	
	@Override
	public ArrayList<Review> selectReviewList(PageInfo rpi, int mNo) {
		return mDAO.selectReviewList(sqlSession, rpi, mNo);
	}
	
	@Override
	public int myReview(Review my) {
		return mDAO.myReview(sqlSession, my);
	}
	
	@Override
	public ArrayList<Orders> selectMyOrders(HashMap<String, Object> map) {
		return mDAO.selectMyOrders(sqlSession, map);
	}
	
	@Override
	public int insertReview(Review r) {
		return mDAO.insertReview(sqlSession, r);
	}
	
	@Override
	public int updateReview(Review r) {
		return mDAO.updateReview(sqlSession, r);
	}
	
	@Override
	public ArrayList<HashMap<String, Object>> notReview(HashMap<String, Object> map) {
		return mDAO.notReview(sqlSession, map);
	}
	
	@Override
	public ArrayList<Review> selectMyReviewList(PageInfo mpi, HashMap<String, Object> myMap) {
		return mDAO.selectMyReviewList(sqlSession, myMap, mpi);
	}
	
	@Override
	public int getQnaCount(int mNo) {
		return mDAO.getQnaCount(sqlSession, mNo);
	}
	
	@Override
	public ArrayList<QA> selectQnaList(PageInfo qpi, int mNo) {
		return mDAO.selectQnaList(sqlSession, qpi, mNo);
	}
	
	@Override
	public int insertQna(QA qna) {
		return mDAO.insertQna(sqlSession, qna);
	}
	
	@Override
	public Image selectProfile(int usersNo) {
		return mDAO.selectProfile(sqlSession, usersNo);
	}
	
	@Override
	public int getCateListCount(int cate) {
		return mDAO.getCateListCount(sqlSession, cate);
	}
	
	@Override
	public int getSearchListCount(String word) {
		return mDAO.getSearchListCount(sqlSession, word);
	}
}
