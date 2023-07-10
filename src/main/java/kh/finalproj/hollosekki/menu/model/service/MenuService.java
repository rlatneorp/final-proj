package kh.finalproj.hollosekki.menu.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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

public interface MenuService {

	int getListCount();

	ArrayList<Menu> selectMenuList(PageInfo pi);

	ArrayList<Image> selectMenuImage();

	Menu menuDetail(int mNo);

	Image menuDetailThum(int mNo);

	ArrayList<MenuList> menuDetailMenu(int mNo);

	ArrayList<Image> menuDetailImage();

	ArrayList<Menu> searchMenu(PageInfo pi, String word);

	ArrayList<Menu> menuCategory(PageInfo pi, int cate);

	int selectUsersNo(int mNo);

	ArrayList<Product> healtherInfo(int usersNo);

	int selectBookmark(int usersNo, int productNo);

	int insertBookmark(int usersNo, int divisionNo);

	int deleteBookmark(int usersNo, int divisionNo);

	ArrayList<Menu> menuScore();

	ArrayList<Likes> likeList();

	ArrayList<Likes> loginUserLikeList(Users u);

	int getReviewCount(int mNo);
	
	ArrayList<Review> selectReviewList(PageInfo rpi, int mNo);

	int myReview(Review my);

	ArrayList<Orders> selectMyOrders(HashMap<String, Object> map);

	int insertReview(HashMap<String, Object> map);

	int updateReview(Review r);

	ArrayList<HashMap<String, Object>> notReview(HashMap<String, Object> map);

	ArrayList<Review> selectMyReviewList(PageInfo mpi, HashMap<String, Object> myMap);
	
	int getQnaCount(int mNo);

	ArrayList<QA> selectQnaList(PageInfo qpi, int mNo);

	int insertQna(QA qna);

	Image selectProfile(int usersNo);

	int getCateListCount(int cate);

	int getSearchListCount(String word);


}
