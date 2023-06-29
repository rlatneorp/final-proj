package kh.finalproj.hollosekki.users.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import kh.finalproj.hollosekki.common.Pagination;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.Menu;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.enroll.model.service.EnrollService;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.service.MarketService;
import kh.finalproj.hollosekki.market.model.vo.Food;
import kh.finalproj.hollosekki.market.model.vo.Options;
import kh.finalproj.hollosekki.market.model.vo.Orders;
import kh.finalproj.hollosekki.market.model.vo.Tool;
import kh.finalproj.hollosekki.market.model.vo.ShippingAddress;
import kh.finalproj.hollosekki.recipe.model.service.RecipeService;
import kh.finalproj.hollosekki.users.model.exception.UsersException;
import kh.finalproj.hollosekki.users.model.service.UsersService;

@SessionAttributes({ "loginUser", "image" })
@Controller
public class UsersController {
	

	@Autowired
	private EnrollService eService;

	@Autowired
	private RecipeService rService;

	@Autowired
	private UsersService uService;

	@Autowired
	private MarketService mkService;

	@Autowired
	private BCryptPasswordEncoder bcrypt;

	@RequestMapping("myPage_Main.me")
	public String myPage_Main(Model model) {
		// 이미지 조회
		int usersNo = ((Users) model.getAttribute("loginUser")).getUsersNo();
		Image image = uService.selectImage(usersNo);
		model.addAttribute("image", image);

		int following = eService.following(usersNo);
		int follower = eService.follow(usersNo);
		model.addAttribute("following", following);
		model.addAttribute("follower", follower);

		// 팔로잉 팔로워 리스트 조회
		ArrayList<HashMap<String, Object>> followingList = uService.selectFollowing(usersNo);
		ArrayList<HashMap<String, Object>> followerList = uService.selectFollower(usersNo);

		model.addAttribute("followingList", followingList);
		model.addAttribute("followerList", followerList);

		return "myPage_Main";
	}

	// 언팔
	@RequestMapping("myPage_unFollow.me")
	@ResponseBody
	public String myPage_unFollow(Model model, @RequestParam("usersNo") int usersNo,
			@RequestParam("followingNo") int followingNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usersNo", usersNo);
		map.put("followingNo", followingNo);

		int result = uService.deleteFollow(map);

		if (result > 0) {
			return "yes";
		} else {
			return "no";
		}
	}

	// 팔로
	@RequestMapping("myPage_follow.me")
	@ResponseBody
	public String myPage_follow(Model model, @RequestParam("usersNo") int usersNo,
			@RequestParam("followNo") int followNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usersNo", usersNo);
		map.put("followNo", followNo);

		int result = uService.insertFollow(map);

		if (result > 0) {
			return "yes";
		} else {
			return "no";
		}
	}

	// 파일 저장
	public String[] saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일 저장소 지정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdirs();
		}

		// 파일 이름 변경 형식 지정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int) (Math.random() * 100000);
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum
				+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

		String renamePath = folder + "\\" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		String[] returnArr = new String[2];
		returnArr[0] = savePath;
		returnArr[1] = renameFileName;

		return returnArr;
	}

	// 파일 삭제
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";

		File f = new File(savePath + "\\" + fileName);
		if (f.exists()) {
			f.delete();
		}
	}

	@RequestMapping("myPage_InsertProfile.me")
	public String myPage_InsertProfile(@RequestParam("file") MultipartFile file, @ModelAttribute Users u, Model model,
			HttpServletRequest request) {
		int result = uService.updateProfile(u);
		Users user = uService.selectInfo(u);

		Image image = null;

		if (file != null && !file.isEmpty()) {
			String[] returnArr = saveFile(file, request);

			if (returnArr[1] != null) {
				image = new Image();
				image.setImagePath(returnArr[0]);
				image.setImageOriginalName(file.getOriginalFilename());
				image.setImageRenameName(returnArr[1]);
				image.setImageType(1);
				image.setImageDivideNo(u.getUsersNo());

				int result2 = uService.insertImage(image);

				if (result2 > 0) {
					model.addAttribute("image", image);
				} else {
					throw new UsersException("사진 실패");
				}
			}
		}

		if (result > 0) {
			model.addAttribute("loginUser", user);
			return "redirect:myPage_Main.me";
		} else {
			throw new UsersException("프로필 수정 실패");
		}
	}

	@RequestMapping("myPage_UpdateProfile.me")
	public String myPage_UpdateProfile(@RequestParam("file") MultipartFile file, @ModelAttribute Users u, Model model,
			HttpServletRequest request, @RequestParam("deletePicture") String deletePicture) {
		int result = uService.updateProfile(u);
		Users user = uService.selectInfo(u);
		Image image = null;

		if (file != null && !file.isEmpty()) { // 새파일 들어옴
			String[] returnArr = saveFile(file, request);

			if (returnArr[1] != null) {
				image = new Image();
				image.setImagePath(returnArr[0]);
				image.setImageOriginalName(file.getOriginalFilename());
				image.setImageRenameName(returnArr[1]);
				image.setImageType(1);
				image.setImageDivideNo(u.getUsersNo());

				Image existingImage = uService.selectImage(u.getUsersNo());
				if (existingImage == null) { // 기존 파일이 없을 때
					int insertImage = uService.insertImage(image);

					if (insertImage > 0) {
						model.addAttribute("image", image);
					} else {
						throw new UsersException("사진 수정 실패");
					}
				} else {
					int deleteImage = uService.deleteImage(existingImage);

					String rename = existingImage.getImageRenameName();
					deleteFile(rename, request);

					if (deleteImage > 0) {
						int insertImage = uService.insertImage(image);

						if (insertImage > 0) {
							model.addAttribute("image", image);
						} else {
							throw new UsersException("사진 수정 실패");
						}
					} else {
						throw new UsersException("사진 삭제 실패");
					}
				}
			}
		}

		// 새 파일 안들어옴
		if (file.isEmpty()) {
			Image existingImage = uService.selectImage(u.getUsersNo());
			if (existingImage != null) {
				if (!deletePicture.equals("none")) {
					if (!deletePicture.isEmpty()) {
						int deleteImage = uService.deleteImage(existingImage);

						if (deleteImage > 0) {
							String rename = existingImage.getImageRenameName();
							deleteFile(rename, request);
						}
					}
				}
			}
		}

		if (result > 0) {
			model.addAttribute("loginUser", user);
			return "redirect:myPage_Main.me";
		} else {
			throw new UsersException("프로필 수정 실패");
		}
	}

	// 내 레시피 조회
	@RequestMapping("myPage_MyRecipe.me")
	public String myPage_MyRecipe(Model model, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "searchType", required = false) Integer searchType,
			@RequestParam(value = "searchTitle", required = false) String searchTitle) {
		int usersNo = ((Users) model.getAttribute("loginUser")).getUsersNo();
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int selectType = 0; // 최신/오래된/조회/스크랩/좋아요
		if (searchType != null) {
			selectType = searchType;
		}
		String selectTitle = null;
		if (searchTitle != null) {
			selectTitle = searchTitle;
		}

		int listCount = uService.getMyRecipeListCount(usersNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usersNo", usersNo);
		map.put("selectType", selectType);
		map.put("selectTitle", selectTitle);

		ArrayList<HashMap<String, Object>> list = uService.selectMyRecipe(map, pi);
		System.out.println(list);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "myPage_MyRecipe";
	}

	@RequestMapping("myPage_MyBookMark.me")
	public String myPage_MyBookMark(Model model, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "searchType", required = false) Integer searchType,
			@RequestParam(value = "searchTitle", required = false) String searchTitle) {
		int usersNo = ((Users) model.getAttribute("loginUser")).getUsersNo();
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int selectType = 0; // 최신/오래된/레시피/식단
		if (searchType != null) {
			selectType = searchType;
		}
		String selectTitle = null;
		if (searchTitle != null) {
			selectTitle = searchTitle;
		}

		int listCount = uService.getBookListCount(usersNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usersNo", usersNo);
		map.put("selectType", selectType);
		map.put("selectTitle", selectTitle);

		ArrayList<HashMap<String, Object>> list = uService.myBookMarkList(map, pi);
		System.out.println(list);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);

		return "myPage_MyBookMark";
	}

	@RequestMapping("myPage_MyFavorite.me")
	public String myPage_MyFavorite(Model model, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "searchType", required = false) Integer searchType,
			@RequestParam(value = "searchTitle", required = false) String searchTitle) {
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int selectType = 0; // 전체/레시피/식단/식품/식재료/상품
		if (searchType != null) {
			selectType = searchType;
		}
		String selectTitle = null;
		if (searchTitle != null) {
			selectTitle = searchTitle;
		}

		int usersNo = ((Users) model.getAttribute("loginUser")).getUsersNo();
		// 좋아요 리스트 개수...
		int product = uService.getFoodListCount(usersNo);
		int recipe = uService.getRecipeListCount(usersNo);
		int ingredient = uService.getingredientListCount(usersNo);

		int listCount = product + recipe + ingredient;
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		ArrayList<HashMap<String, Object>> fList = uService.myFoodLikeList(usersNo, selectType, selectTitle, pi); // 식단,
																													// 식품,
																													// 상품도구
		ArrayList<HashMap<String, Object>> rList = uService.myRecipeLikeList(usersNo, selectTitle, pi); // 레시피
		ArrayList<HashMap<String, Object>> pList = uService.myProductLikeList(usersNo, selectTitle, pi); // 식재료

		if (searchType == null || selectType == 0) {
			list.addAll(fList);
			list.addAll(rList);
			list.addAll(pList);

			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
		} else if (selectType == 1) {
			model.addAttribute("list", rList);
			model.addAttribute("pi", pi);
		} else if (selectType == 2) {
			model.addAttribute("list", fList);
			model.addAttribute("pi", pi);
		} else if (selectType == 3) {
			model.addAttribute("list", fList);
			model.addAttribute("pi", pi);
		} else if (selectType == 4) {
			model.addAttribute("list", pList);
			model.addAttribute("pi", pi);
		} else if (selectType == 5) {
			model.addAttribute("list", fList);
			model.addAttribute("pi", pi);
		}

		return "myPage_MyFavorite";
	}

	// 스크랩 삭제
	@RequestMapping("myPage_deleteBookMark.me")
	@ResponseBody
	public String myPage_deleteBookMark(@RequestParam("bookmarkNo") String bookmarkNumber) {
		System.out.println(bookmarkNumber);

		String[] bookmarkNos = bookmarkNumber.split(",");
		int[] intBookmarkNos = new int[bookmarkNos.length];
		int result = 0;

		for (int i = 0; i < bookmarkNos.length; i++) {
			intBookmarkNos[i] = Integer.parseInt(bookmarkNos[i].replaceAll("[\\[\\]\"]", ""));
			System.out.println(intBookmarkNos[i]);
			int bookMarkNo = intBookmarkNos[i];

			result = uService.deleteBookMark(bookMarkNo);
		}

		return result > 0 ? "yes" : "no";
	}

	// 좋아요 삭제
	@RequestMapping("myPage_deleteLike.me")
	@ResponseBody
	public String myPage_deleteLike(@RequestParam("likeNo") String likeNumber) {
		System.out.println(likeNumber);

		String[] likeNos = likeNumber.split(",");
		int[] intlikeNos = new int[likeNos.length];
		int result = 0;

		for (int i = 0; i < likeNos.length; i++) {
			intlikeNos[i] = Integer.parseInt(likeNos[i].replaceAll("[\\[\\]\"]", ""));
			System.out.println(intlikeNos[i]);
			int likeNo = intlikeNos[i];

			result = uService.deleteLike(likeNo);
		}

		return result > 0 ? "yes" : "no";
	}

	@RequestMapping("myPage_MyOrder.me")
	public String myPage_MyOrder(HttpSession session, Model model,@RequestParam(value="page", required=false) Integer currentPage ) {
		
		if(currentPage == null) {
			currentPage = 1;
		}
		//주문한 전체 내역 조회 
		Users users = (Users)session.getAttribute("loginUser");
		int usersNo = users.getUsersNo();
		
		int listCount = uService.orderListCount(usersNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		ArrayList<Orders> orderList = uService.selectOrderList(usersNo, pi);
		Food foods = null; Tool tools = null; Ingredient igs = null; Menu menus = null;
		for(Orders order :orderList) {
			//productName 가져오기
			int productNo = order.getProductNo();
			foods =  mkService.selectFood(productNo); tools = mkService.selectTool(productNo); igs = mkService.selectIngrdient(productNo); menus = mkService.selectMenu(productNo);
			if (foods != null) { 
				order.setProductName(foods.getFoodName());
			}
			if (tools != null) {
				order.setProductName(tools.getToolName());
			}
			if (igs != null) {
				order.setProductName(igs.getIngredientName());
			}
			if (menus != null) {
				order.setProductName(menus.getMenuName());
			}
		}
		model.addAttribute("pi", pi);
		model.addAttribute("orderList", orderList);
		
		
		
		return "myPage_MyOrder";
	}

	@RequestMapping("myPage_MyOrderDetail.me")
	public String myPage_MyOrderDetail(int orderNo, Model model) {
		
		Orders orders = uService.selectDetailOrder(orderNo);
		int productNo = orders.getProductNo();
		Food foods = null; Tool tools = null; Ingredient igs = null; Menu menus = null;
		foods =  mkService.selectFood(productNo); tools = mkService.selectTool(productNo); igs = mkService.selectIngrdient(productNo); menus = mkService.selectMenu(productNo);
		if (foods != null) { 
			orders.setProductName(foods.getFoodName());
		}
		if (tools != null) {
			orders.setProductName(tools.getToolName());
		}
		if (igs != null) {
			orders.setProductName(igs.getIngredientName());
		}
		if (menus != null) {
			orders.setProductName(menus.getMenuName());
		}
		
		ArrayList<Options> optValues = new ArrayList<>();
		//그냥 옵션은 스트링 자체로 저장해버리는 게 나을 거 같음 
//		Options opt = mkService.selectOptionInfo(productNo);
		//사진 뽑아 와야 해...
		//옵션도....흑흑
		
		
		
		model.addAttribute("orders", orders);
		System.out.println("orders : " + orders);
		return "myPage_MyOrderDetail";
	}

	@RequestMapping("myPage_MyAddress.me")
	public String myPage_MyAddress(Model model) {
		int usersNo = ((Users) model.getAttribute("loginUser")).getUsersNo();

		ArrayList<ShippingAddress> list = mkService.selectShipping(usersNo);

		model.addAttribute("list", list);

		return "myPage_MyAddress";
	}

	@RequestMapping("myPage_InsertAddress.me")
	public String myPage_InsertAddress() {
		return "myPage_InsertAddress";
	}

	@RequestMapping("myPage_addAddress.me")
	public String myPage_insertShipping(@ModelAttribute ShippingAddress sa, @RequestParam("postcode") String postcode,
			@RequestParam("addressInfo") String addressInfo, @RequestParam("detailAddress") String detailAddress) {

		String[] addresses = new String[3];
		addresses[0] = postcode;
		addresses[1] = addressInfo;
		addresses[2] = detailAddress;
		sa.setAddress(Arrays.toString(addresses));

		System.out.println("ssss : " + sa);
		int result = mkService.insertShipping(sa);

		if (result > 0) {
			return "redirect:myPage_MyAddress.me";
		} else {
			throw new UsersException("배송지 추가 실패");
		}
	}

	@RequestMapping("myPage_editAddress.me")
	public String myPage_editAddress(@RequestParam("shippingNo") int shippingNo, Model model) {
		ShippingAddress sa = mkService.selectShippingForUpdate(shippingNo);

		model.addAttribute("sa", sa);
		
		return "myPage_UpdateAddress";
	}
	
	@RequestMapping("myPage_updateAddress.me")
	public String myPage_updateAddress(@ModelAttribute ShippingAddress sa, @RequestParam("postcode") String postcode,
							  @RequestParam("addressInfo") String addressInfo, @RequestParam("detailAddress") String detailAddress) {

		String[] addresses = new String[3];
		addresses[0] = postcode;
		addresses[1] = addressInfo;
		addresses[2] = detailAddress;
		sa.setAddress(Arrays.toString(addresses));

		System.out.println("ssss : " + sa);
		int result = uService.updateAddress(sa);

		if (result > 0) {
			return "redirect:myPage_MyAddress.me";
		} else {
			throw new UsersException("배송지 수정 실패");
		}
	}

	// 배송지 삭제
	@RequestMapping("myPage_deleteAddress.me")
	@ResponseBody
	public String myPage_deleteAddress(@RequestParam("shippingNo") String shippingNumber) {
		System.out.println(shippingNumber);

		String[] shippingNos = shippingNumber.split(",");
		int[] intShippingNos = new int[shippingNos.length];
		int result = 0;

		for (int i = 0; i < shippingNos.length; i++) {
			intShippingNos[i] = Integer.parseInt(shippingNos[i].replaceAll("[\\[\\]\"]", ""));
			System.out.println(intShippingNos[i]);
			int shippingNo = intShippingNos[i];

			result = mkService.delShipping(shippingNo);
		}

		return result > 0 ? "yes" : "no";
	}

	@RequestMapping("myPage_Point.me")
	public String myPage_Point() {
		return "myPage_Point";
	}

	@RequestMapping("myPage_edit.me")
	public String myPage_edit() {
		return "myPage_checkPwd";
	}

	// �쉶�썝 �젙蹂� �닔�젙 �쟾 鍮꾨�踰덊샇 泥댄겕
	@RequestMapping("myPage_checkPwd.me")
	@ResponseBody
	public String myPage_checkPwd(@RequestParam("usersPwd") String usersPwd, Model model) {
		String pwd = ((Users) model.getAttribute("loginUser")).getUsersPw();

		if (bcrypt.matches(usersPwd, pwd)) {
			return "yes";
		} else {
			return "no";
		}
	}

	@RequestMapping("myPage_editInfo.me")
	public String myPage_editInfo(Model model) {
		return "myPage_editInfo";
	}

	@RequestMapping("myPage_UpdatePwd.me")
	@ResponseBody
	public String myPage_UpdatePwd(@RequestParam("newPw") String newPw, @RequestParam("usersId") String usersId,
			Model model) {
		Users u = ((Users) model.getAttribute("loginUser"));

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("usersId", usersId);
		map.put("newPw", bcrypt.encode(newPw));
		int result = uService.updatePwd(map);

		if (result > 0) {
			model.addAttribute("loginUser", eService.login(u));
			return "yes";
		} else {
			return "no";
		}
	}

	@RequestMapping("myPage_UpdateInfo.me")
	@ResponseBody
	public String myPage_UpdateInfo(@ModelAttribute Users u, Model model) {
		int result = uService.updateInfo(u);

		if (result > 0) {
			model.addAttribute("loginUser", eService.login(u));
			return "yes";
		} else {
			throw new UsersException("�쉶�썝 �젙蹂� �닔�젙 �떎�뙣");
		}
	}

	// �쉶�썝�깉�눜
	@RequestMapping("myPage_deleteInfo.me")
	public String myPage_deleteInfo(@RequestParam("usersNo") int usersNo) {
		int result = uService.deleteInfo(usersNo);

		if (result > 0) {
			return "redirect:logout.en";
		} else {
			throw new UsersException("�쉶�썝 �깉�눜 �떎�뙣");
		}
	}

}
