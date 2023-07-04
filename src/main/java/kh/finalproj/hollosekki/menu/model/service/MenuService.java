package kh.finalproj.hollosekki.menu.model.service;

import java.util.ArrayList;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Product;
import kh.finalproj.hollosekki.menu.model.vo.MenuList;

public interface MenuService {

	int getListCount();

	ArrayList<Menu> selectMenuList(PageInfo pi);

	ArrayList<Image> selectMenuImage();

	Menu menuDetail(int mNo);

	Image menuDetailThum(int mNo);

	ArrayList<MenuList> menuDetailMenu(int mNo);

	ArrayList<Image> menuDetailImage();

	ArrayList<Menu> searchMenu(String word);

	ArrayList<Menu> menuCategory(int cate);

	int selectUsersNo(int mNo);

	ArrayList<Product> healtherInfo(int usersNo);

	int selectBookmark(int usersNo, int productNo);

	int insertBookmark(int usersNo, int divisionNo);

	int deleteBookmark(int usersNo, int divisionNo);

}
