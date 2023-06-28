package kh.finalproj.hollosekki.menu.service;

import java.util.ArrayList;

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;

public interface MenuService {

	int getListCount();

	ArrayList<Menu> selectMenuList(PageInfo pi);

	ArrayList<Image> selectMenuImage();

}
