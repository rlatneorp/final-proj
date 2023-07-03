package kh.finalproj.hollosekki.users.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

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
import kh.finalproj.hollosekki.market.model.vo.Review;
import kh.finalproj.hollosekki.market.model.vo.ShippingAddress;
import kh.finalproj.hollosekki.market.model.vo.Tool;
import kh.finalproj.hollosekki.recipe.model.service.RecipeService;
import kh.finalproj.hollosekki.users.model.exception.UsersException;
import kh.finalproj.hollosekki.users.model.service.UsersService;

@SessionAttributes({"loginUser"})
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
		// 이미지 조회 - 로그인 조회할때 이미지 리네임, 소셜이미지 조인해서 가져옴
		Users u = (Users) model.getAttribute("loginUser");
		Users loginUser = eService.login(u);
		model.addAttribute("loginUser", loginUser);

		int following = eService.following(loginUser.getUsersNo());
		int follower = eService.follow(loginUser.getUsersNo());
		model.addAttribute("following", following);
		model.addAttribute("follower", follower);

		// 팔로잉 팔로워 리스트 조회
		ArrayList<HashMap<String, Object>> followingList = uService.selectFollowing(loginUser.getUsersNo());
		ArrayList<HashMap<String, Object>> followerList = uService.selectFollower(loginUser.getUsersNo());

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

		HashMap<String, Object> listMap = new HashMap<String, Object>();
		listMap.put("usersNo", usersNo);
		
		int selectType = 0; // 최신/오래된/조회/스크랩/좋아요
		if (searchType != null) {
			selectType = searchType;
			listMap.put("selectType", selectType);
		}
		
		String selectTitle = null;
		if (searchTitle != null) {
			selectTitle = searchTitle;
			listMap.put("selectTitle", selectTitle);
		}

		int listCount = uService.getMyRecipeListCount(listMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usersNo", usersNo);
		map.put("selectType", selectType);
		map.put("selectTitle", selectTitle);

		ArrayList<HashMap<String, Object>> list = uService.selectMyRecipe(map, pi);
		System.out.println(list);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchTitle", searchTitle);

		return "myPage_MyRecipe";
	}
	
	// 스크랩 조회
	@RequestMapping("myPage_MyBookMark.me")
	public String myPage_MyBookMark(Model model, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "searchType", required = false) Integer searchType,
			@RequestParam(value = "searchTitle", required = false) String searchTitle) {
		System.out.println(searchTitle);
		int usersNo = ((Users) model.getAttribute("loginUser")).getUsersNo();
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		HashMap<String, Object> listMap = new HashMap<String, Object>();
		listMap.put("usersNo", usersNo);
		
		int selectType = 0; // 최신/오래된/레시피/식단
		if (searchType != null) {
			selectType = searchType;
			listMap.put("selectType", selectType);
		}
		
		String selectTitle = null;
		if (searchTitle != null) {
			selectTitle = searchTitle;
			listMap.put("selectTitle", selectTitle);
		}
		
		int listCount = uService.getBookListCount(listMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usersNo", usersNo);
		map.put("selectType", selectType);
		map.put("selectTitle", selectTitle);

		ArrayList<HashMap<String, Object>> list = uService.myBookMarkList(map, pi);
		System.out.println("bookmark: " + list);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchTitle", searchTitle);

		return "myPage_MyBookMark";
	}
	
	// 좋아요 조회
//	@RequestMapping("myPage_MyFavorite.me")
//	public String myPage_MyFavorite(Model model, @RequestParam(value = "page", required = false) Integer page,
//			@RequestParam(value = "searchType", required = false) Integer searchType,
//			@RequestParam(value = "searchTitle", required = false) String searchTitle) {
//		int currentPage = 1;
//		if (page != null) {
//			currentPage = page;
//		}
//
//		int selectType = 0; // 전체/레시피/식단/식품/식재료/상품
//		if (searchType != null) {
//			selectType = searchType;
//		}
//		
//		String selectTitle = null;
//		if (searchTitle != null) {
//			selectTitle = searchTitle;
//		}
//
//		int usersNo = ((Users) model.getAttribute("loginUser")).getUsersNo();
//		// 좋아요 리스트 개수...
//		int product = uService.getFoodListCount(usersNo);
//		int recipe = uService.getRecipeListCount(usersNo);
//		int ingredient = uService.getingredientListCount(usersNo);
//
//		int listCount = product + recipe + ingredient;
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
//
//		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
//
//		ArrayList<HashMap<String, Object>> fList = uService.myFoodLikeList(usersNo, selectType, selectTitle, pi); // 식단,
//																													// 식품,
//																													// 상품도구
//		ArrayList<HashMap<String, Object>> rList = uService.myRecipeLikeList(usersNo, selectTitle, pi); // 레시피
//		ArrayList<HashMap<String, Object>> pList = uService.myProductLikeList(usersNo, selectTitle, pi); // 식재료
//
//		if (searchType == null || selectType == 0) {
//			list.addAll(fList);
//			list.addAll(rList);
//			list.addAll(pList);
//
//			model.addAttribute("list", list);
//			model.addAttribute("pi", pi);
//			model.addAttribute("searchType", searchType);
//			model.addAttribute("searchTitle", searchTitle);
//		} else if (selectType == 1) {
//			model.addAttribute("list", rList);
//			model.addAttribute("pi", pi);
//			model.addAttribute("searchType", searchType);
//			model.addAttribute("searchTitle", searchTitle);
//		} else if (selectType == 2) {
//			model.addAttribute("list", fList);
//			model.addAttribute("pi", pi);
//			model.addAttribute("searchType", searchType);
//			model.addAttribute("searchTitle", searchTitle);
//		} else if (selectType == 3) {
//			model.addAttribute("list", fList);
//			model.addAttribute("pi", pi);
//			model.addAttribute("searchType", searchType);
//			model.addAttribute("searchTitle", searchTitle);
//		} else if (selectType == 4) {
//			model.addAttribute("list", pList);
//			model.addAttribute("pi", pi);
//			model.addAttribute("searchType", searchType);
//			model.addAttribute("searchTitle", searchTitle);
//		} else if (selectType == 5) {
//			model.addAttribute("list", fList);
//			model.addAttribute("pi", pi);
//			model.addAttribute("searchType", searchType);
//			model.addAttribute("searchTitle", searchTitle);
//		}
//		System.out.println(list);
//		return "myPage_MyFavorite";
//	}
	
	@RequestMapping("myPage_MyFavorite.me")
	public String myPage_MyFavorite(Model model, @RequestParam(value = "page", required = false) Integer page,
									@RequestParam(value = "searchType", required = false) Integer searchType,
									@RequestParam(value = "searchTitle", required = false) String searchTitle) {
		int usersNo = ((Users) model.getAttribute("loginUser")).getUsersNo();
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		
		HashMap<String, Object> listMap = new HashMap<String, Object>();
		listMap.put("usersNo", usersNo);
		
		int selectType = 0; // 전체/레시피/식단/식품/식재료/상품
		if (searchType != null) {
			selectType = searchType;
			listMap.put("selectType", selectType);
		}
		
		String selectTitle = null;
		if (searchTitle != null) {
			selectTitle = searchTitle;
			listMap.put("selectTitle", selectTitle);
		}
		
		// 좋아요 리스트 개수...
		int listCount = uService.getLikeListCount(listMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usersNo", usersNo);
		map.put("selectType", selectType);
		map.put("selectTitle", selectTitle);
		
		ArrayList<HashMap<String, Object>> list = uService.myLikeList(map, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchTitle", searchTitle);
			
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
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
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
	public String myPage_MyOrderDetail(int orderNo, Model model, @RequestParam(value="page", required=false) Integer currentPage) {
		
		if(currentPage == null) {
			currentPage = 1;
		}
		Orders orders = uService.selectDetailOrder(orderNo);
		int productNo = orders.getProductNo();
		Food foods = null; Tool tools = null; Ingredient igs = null; Menu menus = null;
		foods =  mkService.selectFood(productNo); tools = mkService.selectTool(productNo); igs = mkService.selectIngrdient(productNo); menus = mkService.selectMenu(productNo);
		if (foods != null) { //이미지 타입 : 3 ( 식품 ) 
			orders.setProductName(foods.getFoodName());
			String imgName = mkService.selectImg(productNo, 3);
			orders.setImgName(imgName);
		}
		if (tools != null) {//이미지 타입 : 6 ( 주방도구)
			orders.setProductName(tools.getToolName());
			String imgName = mkService.selectImg(productNo, 6);
			orders.setImgName(imgName);
		}
		if (igs != null) {//이미지 타입 :5 (식재료) 
			orders.setProductName(igs.getIngredientName());
			String imgName = mkService.selectImg(productNo, 5);
			orders.setImgName(imgName);
		}
		if (menus != null) {//이미지 타입 : 4 (식단)
			orders.setProductName(menus.getMenuName());
			String imgName = mkService.selectImg(productNo, 4);
			orders.setImgName(imgName);
		}
		
		ArrayList<Options> optValues = new ArrayList<>();
		
		model.addAttribute("orders", orders);
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
	
	// 포인트 내역 조회
	@RequestMapping("myPage_Point.me")
	public String myPage_Point(Model model, @RequestParam(value = "page", required = false) Integer page) {
		int usersNo = ((Users)model.getAttribute("loginUser")).getUsersNo();
		
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		
		int listCount = uService.getPointCount(usersNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<HashMap<String, Object>> list = uService.selectPoint(usersNo, pi);
		
		// 세션에서 포인트 소멸 확인 여부를 가져옴
//	    boolean pointExpiryChecked = (boolean) model.getAttribute("pointExpiryChecked");
//	    int result1 = 0;
//	    int result2 = 0;
//	    
//	    if (pointExpiryChecked == true && pointExpiryChecked != null) {
//	        // 이미 포인트 소멸 확인한 경우, 처리할 필요가 없으므로 바로 반환
//	    	model.addAttribute("list", list);
//			model.addAttribute("pi", pi);
//			
//			return "myPage_Point";
//	    } else {
//		    // 현재 날짜 구하기
//		    LocalDate currentDate = LocalDate.now();
//		    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		    String formattedCurrentDate = currentDate.format(formatter);
//	
//		    // 포인트 소멸 처리 로직 작성
//		    for (HashMap<String, Object> p : list) {
//		    	Integer type = (Integer) p.get("POINT_TYPE");
//		    	if(type == null) {  // 출첵
//		    		String checked = (String) p.get("CHECKED");
//		    		if(checked.equals(formattedCurrentDate)) {
//		    			int userNo = (int) p.get("USERS_NO");
//		    			int point = (int) p.get("POINT");
//		    			
//		    			HashMap<String, Object> map = new HashMap<String, Object>();
//			            map.put("point", point);
//			            map.put("userNo", userNo);
//			            
//			            int dePoint = uService.deletePoint(map);
//			            System.out.println(dePoint);
//			            
//			            if(dePoint > 0) {
//			            	result1 = uService.updatePoint(map);
//			            	System.out.println(result1);
//			            }
//		    		}
//		    	} else {
//			        String expirationDate = (String) p.get("MODIFY_DATE");
//			        if (expirationDate.equals(formattedCurrentDate)) {
//			            // 포인트 소멸 처리 코드
//			        	int userNo = (int) p.get("USERS_NO");
//			        	int point = (int) p.get("POINT");
//			        	int before = (int) p.get("POINT_BEFORE");
//			            int change = (int) p.get("POINT_CHANGE");
//			            
//			            HashMap<String, Object> map = new HashMap<String, Object>();
//			            map.put("point", point);
//			            map.put("userNo", userNo);
//			            map.put("before", before);
//			            map.put("change", change);
//			            
//			            int dePoint = uService.deletePoint(map);
//			            System.out.println(dePoint);
//			            
//			            if(dePoint > 0) {
//			            	result2 = uService.updatePoint(map);
//			            	System.out.println(result2);
//			            }
//			        }
//		    	}
//		    }
//		    
//		    if(result1 > 0 || result2 > 0) {
		    	// 포인트 소멸 확인 여부를 세션에 저장
//	    	model.addAttribute("pointExpiryChecked", true);
	    	
	    	model.addAttribute("list", list);
	    	model.addAttribute("pi", pi);
	    	
	    	return "myPage_Point";
//		    } else {
//		    	throw new UsersException("포인트 머시기 실패");
//		    }
//	
//	    }
	}
	
//	@RequestMapping("myPage_deletePoint.me")
//	@ResponseBody
//	public String myPage_deletePoint(Model model, @RequestParam("usersNo") int usersNo, @RequestParam("dePoint") int dePoint) {
//		int point = ((Users)model.getAttribute("loginUser")).getPoint();
//		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		map.put("usersNo", usersNo);
//		map.put("point", point);
//		map.put("dePoint", dePoint);
//		
//		int result = uService.deletePoint(map);
//		
//		if(result > 0) {
//			return "yes";
//		} else {
//			return "no";
//		}
//	}

	@RequestMapping("myPage_edit.me")
	public String myPage_edit() {
		return "myPage_checkPwd";
	}

	// 회원 정보 수정 전 비밀번호 체크
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
			throw new UsersException("정보 수정 실패ㅋ");
		}
	}

	// �쉶�썝�깉�눜
	@RequestMapping("myPage_deleteInfo.me")
	public String myPage_deleteInfo(@RequestParam("usersNo") int usersNo) {
		int result = uService.deleteInfo(usersNo);

		if (result > 0) {
			return "redirect:logout.en";
		} else {
			throw new UsersException("탈퇴 실패 ㅋ");
		}
	}

//	@RequestMapping("selectPeriodOrders.me")
//	public void selectPeriodOrders(String start, String end, HttpServletResponse response) {
//		
//		Properties prop = new Properties();
//		prop.setProperty("start", start);
//		prop.setProperty("end", end);
//		
//		ArrayList<Orders> periodSelec = uService.selectPeriodOrders(prop);
//		//이름 가져오기 
//		Food foods = null; Tool tools = null; Ingredient igs = null; Menu menus = null;
//		
//		for(Orders ps : periodSelec) {
//			int productNo = ps.getProductNo();
//			foods =  mkService.selectFood(productNo); tools = mkService.selectTool(productNo); igs = mkService.selectIngrdient(productNo); menus = mkService.selectMenu(productNo);
//			if (foods != null) { //이미지 타입 : 3 ( 식품 ) 
//				ps.setProductName(foods.getFoodName());
//			}
//			if (tools != null) {//이미지 타입 : 6 ( 주방도구)
//				ps.setProductName(tools.getToolName());
//			}
//			if (igs != null) {//이미지 타입 :5 (식재료) 
//				ps.setProductName(igs.getIngredientName());
//			}
//			if (menus != null) {//이미지 타입 : 4 (식단)
//				ps.setProductName(menus.getMenuName());
//			}
//		}
//		
//		response.setContentType("application/json; charset=UTF-8");
//        GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd"); 
//        Gson gson = gb.create();
//        try {
//            gson.toJson(periodSelec, response.getWriter()); 
//         } catch (JsonIOException | IOException e) {
//            e.printStackTrace();
//         }
//	}
	
	@RequestMapping("selectPeriodOrders.me")
	public String selectPeriodOrders(String start, String end, Model model, @RequestParam(value="page", required=false) Integer currentPage) {
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		Properties prop = new Properties();
		int usersNo = ((Users) model.getAttribute("loginUser")).getUsersNo();
		String userNo = String.valueOf(usersNo);
		
		prop.setProperty("start", start);
		prop.setProperty("end", end);
		prop.setProperty("usersNo", userNo);
		
		int listCount = uService.orderPeriodCount(prop); //기간에 따른 개수 세기 
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Orders> periodSelec = uService.selectPeriodOrders(prop, pi);
//		//이름 가져오기 
		Food foods = null; Tool tools = null; Ingredient igs = null; Menu menus = null;
//		
		for(Orders ps : periodSelec) {
			int productNo = ps.getProductNo();
			foods =  mkService.selectFood(productNo); tools = mkService.selectTool(productNo); igs = mkService.selectIngrdient(productNo); menus = mkService.selectMenu(productNo);
			if (foods != null) { //이미지 타입 : 3 ( 식품 ) 
				ps.setProductName(foods.getFoodName());
			}
			if (tools != null) {//이미지 타입 : 6 ( 주방도구)
				ps.setProductName(tools.getToolName());
			}
			if (igs != null) {//이미지 타입 :5 (식재료) 
				ps.setProductName(igs.getIngredientName());
			}
			if (menus != null) {//이미지 타입 : 4 (식단)
				ps.setProductName(menus.getMenuName());
			}
		}
		
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		
		model.addAttribute("pi", pi);
		System.out.println("ps : " + periodSelec);
		model.addAttribute("orderList", periodSelec);
		
		return "myPage_MyOrder";
		
	}
	
	@GetMapping("searchWord.me")
	public String searchWord(String start, String end, String word, Model model,  @RequestParam(value="page", required=false) Integer currentPage) {
		
		if(currentPage == null) {
			currentPage = 1;
		}
		System.out.println("word : " + word);
		int usersNo = ((Users) model.getAttribute("loginUser")).getUsersNo();
		String userNo = String.valueOf(usersNo);
		
		Properties prop = new Properties();
		prop.setProperty("word", word);
		prop.setProperty("usersNo", userNo);
		
		//당연히 페이징을.... 
		int listCount = 0; PageInfo pi = null; ArrayList<Map<String, Object>> orderSearchList = null;
		if(start == null) { //전체 조회 
			listCount = mkService.orderSearchCount(prop); //단어 있는 것 중, 전체 조회 
			pi = Pagination.getPageInfo(currentPage, listCount, 10);
			orderSearchList = mkService.orderSearch(prop, pi); //단어 있는 것 중 페이징처리하여 전체 조회
			System.out.println("orderSearchList" + orderSearchList);
		} else { //기간이 들어오면,
			prop.setProperty("start", start);
			prop.setProperty("end", end);
			listCount = mkService.orderPeriodSearchCount(prop);
			pi = Pagination.getPageInfo(currentPage, listCount, 10);
			orderSearchList = mkService.orderPeriodSearchList(prop, pi);
			
			model.addAttribute("start", start);
			model.addAttribute("end", end);
		}
		
		ArrayList<Orders> orderList = new ArrayList<>();
		for(Map<String, Object>  order : orderSearchList) {
			//필요 데이터 : 주문번호, 주문타입, 상품명, 주문날짜, 총 주문금액 
			Orders orders = new Orders();
			orders.setOrderNo(Integer.parseInt(order.get("ORDER_NO").toString()));
			orders.setProductType(Integer.parseInt(order.get("PRODUCT_TYPE").toString()));
			if (order.containsKey("TOOL_NAME")) {
				orders.setProductName(order.get("TOOL_NAME").toString());
			} else if (order.containsKey("FOOD_NAME")) {
				orders.setProductName(order.get("FOOD_NAME").toString());
			} else if (order.containsKey("MENU_NAME")) {
				orders.setProductName(order.get("MENU_NAME").toString());
			} else if (order.containsKey("INGREDIENT_NAME")) {
				orders.setProductName(order.get("INGREDIENT_NAME").toString());
			}
			Timestamp orderTimestamp = (Timestamp) order.get("ORDER_DATE");
			Date orderDate = new Date(orderTimestamp.getTime());
			orders.setOrderDate(orderDate);
			orders.setTotalPrice(Integer.parseInt(order.get("ORDER_TOTAL_PRICE").toString()));
			
			orderList.add(orders);
		}
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("orderList", orderList);
		
		return "myPage_MyOrder";
	}
	
	@RequestMapping("myPage_Review.me")
	public String myPage_Review(Model model, @RequestParam(value = "page", required = false) Integer page) {
		Users u  = (Users)model.getAttribute("loginUser");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usersId", u.getUsersId());
		map.put("nickName", u.getNickName());
		
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		
		int listCount = uService.getReviewCount(map);
		System.out.println(listCount);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<HashMap<String, Object>> list = uService.selectReview(map, pi);
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return "myPage_Review";
	}
	
	@RequestMapping("myPage_editReview.me")
	public String myPage_editReview(Model model, @RequestParam("reviewNo") int reviewNo) {
		Review r = uService.selectDetailReview(reviewNo);
		System.out.println(r);
		
		model.addAttribute("r", r);
		
		return "updateReview";
	}
	
}