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
		// �씠誘몄� 議고쉶 - 濡쒓렇�씤 議고쉶�븷�븣 �씠誘몄� 由щ꽕�엫, �냼�뀥�씠誘몄� 議곗씤�빐�꽌 媛��졇�샂
		Users u = (Users) model.getAttribute("loginUser");
		Users loginUser = null;
		if(u.getImageRenameName() != null) {
			loginUser = eService.login(u);
			model.addAttribute("loginUser", loginUser);
		} else {
			loginUser = eService.login2(u);
			model.addAttribute("loginUser", loginUser);
		}

		int following = eService.following(loginUser.getUsersNo());
		int follower = eService.follow(loginUser.getUsersNo());
		model.addAttribute("following", following);
		model.addAttribute("follower", follower);

		// �뙏濡쒖엵 �뙏濡쒖썙 由ъ뒪�듃 議고쉶
		ArrayList<HashMap<String, Object>> followingList = uService.selectFollowing(loginUser.getUsersNo());
		ArrayList<HashMap<String, Object>> followerList = uService.selectFollower(loginUser.getUsersNo());

		model.addAttribute("followingList", followingList);
		model.addAttribute("followerList", followerList);

		return "myPage_Main";
	}

	// �뼵�뙏
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

	// �뙏濡�
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

	// �뙆�씪 ���옣
	public String[] saveFile(MultipartFile file, HttpServletRequest request) {
		// �뙆�씪 ���옣�냼 吏��젙
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdirs();
		}

		// �뙆�씪 �씠由� 蹂�寃� �삎�떇 吏��젙
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

	// �뙆�씪 �궘�젣
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
					user.setImageRenameName(image.getImageRenameName());
					model.addAttribute("image", image);
				} else {
					throw new UsersException("�궗吏� �떎�뙣");
				}
			}
		}

		if (result > 0) {
			model.addAttribute("loginUser", user);
			return "redirect:myPage_Main.me";
		} else {
			throw new UsersException("�봽濡쒗븘 �닔�젙 �떎�뙣");
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
				if (existingImage == null) { // 湲곗〈 �뙆�씪�씠 �뾾�쓣 �븣
					int insertImage = uService.insertImage(image);

					if (insertImage > 0) {
						model.addAttribute("image", image);
					} else {
						throw new UsersException("�궗吏� �닔�젙 �떎�뙣");
					}
				} else {
					int deleteImage = uService.deleteImage(existingImage);

					String rename = existingImage.getImageRenameName();
					deleteFile(rename, request);

					if (deleteImage > 0) {
						int insertImage = uService.insertImage(image);

						if (insertImage > 0) {
							user.setImageRenameName(image.getImageRenameName());
							model.addAttribute("image", image);
						} else {
							throw new UsersException("�궗吏� �닔�젙 �떎�뙣");
						}
					} else {
						throw new UsersException("�궗吏� �궘�젣 �떎�뙣");
					}
				}
			}
		}

		// 새파일 안들어옴
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
			throw new UsersException("�봽濡쒗븘 �닔�젙 �떎�뙣");
		}
	}

	// �궡 �젅�떆�뵾 議고쉶
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
		
		int selectType = 0; // 理쒖떊/�삤�옒�맂/議고쉶/�뒪�겕�옪/醫뗭븘�슂
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

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchTitle", searchTitle);

		return "myPage_MyRecipe";
	}
	
	// �뒪�겕�옪 議고쉶
	@RequestMapping("myPage_MyBookMark.me")
	public String myPage_MyBookMark(Model model, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "searchType", required = false) Integer searchType,
			@RequestParam(value = "searchTitle", required = false) String searchTitle) {
		int usersNo = ((Users) model.getAttribute("loginUser")).getUsersNo();
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		HashMap<String, Object> listMap = new HashMap<String, Object>();
		listMap.put("usersNo", usersNo);
		
		int selectType = 0; // 理쒖떊/�삤�옒�맂/�젅�떆�뵾/�떇�떒
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

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchTitle", searchTitle);

		return "myPage_MyBookMark";
	}
	
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
		
		int selectType = 0; // �쟾泥�/�젅�떆�뵾/�떇�떒/�떇�뭹/�떇�옱猷�/�긽�뭹
		if (searchType != null) {
			selectType = searchType;
			listMap.put("selectType", selectType);
		}
		
		String selectTitle = null;
		if (searchTitle != null) {
			selectTitle = searchTitle;
			listMap.put("selectTitle", selectTitle);
		}
		
		// 醫뗭븘�슂 由ъ뒪�듃 媛쒖닔...
		int listCount = uService.getLikeListCount(listMap);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usersNo", usersNo);
		map.put("selectType", selectType);
		map.put("selectTitle", selectTitle);
		
		ArrayList<HashMap<String, Object>> list = uService.myLikeList(map, pi);
		System.out.println(list);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchTitle", searchTitle);
			
		return "myPage_MyFavorite";
	}

	// �뒪�겕�옪 �궘�젣
	@RequestMapping("myPage_deleteBookMark.me")
	@ResponseBody
	public String myPage_deleteBookMark(@RequestParam("bookmarkNo") String bookmarkNumber) {
		String[] bookmarkNos = bookmarkNumber.split(",");
		int[] intBookmarkNos = new int[bookmarkNos.length];
		int result = 0;

		for (int i = 0; i < bookmarkNos.length; i++) {
			intBookmarkNos[i] = Integer.parseInt(bookmarkNos[i].replaceAll("[\\[\\]\"]", ""));
			int bookMarkNo = intBookmarkNos[i];

			result = uService.deleteBookMark(bookMarkNo);
		}

		return result > 0 ? "yes" : "no";
	}

	// 醫뗭븘�슂 �궘�젣
	@RequestMapping("myPage_deleteLike.me")
	@ResponseBody
	public String myPage_deleteLike(@RequestParam("likeNo") String likeNumber) {
		String[] likeNos = likeNumber.split(",");
		int[] intlikeNos = new int[likeNos.length];
		int result = 0;

		for (int i = 0; i < likeNos.length; i++) {
			intlikeNos[i] = Integer.parseInt(likeNos[i].replaceAll("[\\[\\]\"]", ""));
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
		//二쇰Ц�븳 �쟾泥� �궡�뿭 議고쉶 
		Users users = (Users)session.getAttribute("loginUser");
		int usersNo = users.getUsersNo();
		
		int listCount = uService.orderListCount(usersNo);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Orders> orderList = uService.selectOrderList(usersNo, pi);
		Food foods = null; Tool tools = null; Ingredient igs = null; Menu menus = null;
		
		ArrayList<Review> reviewList = null;
		int rCount = 0;
		for(Orders order :orderList) {
			//productName 媛��졇�삤湲�
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
			 rCount = mkService.selectReview(order.getOrderNo(), users.getNickName());
			 order.setReviewCount(rCount);
			 
		}
		
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("orderList", orderList);
		model.addAttribute("reviewList", reviewList);
		
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
		if (foods != null) { //�씠誘몄� ���엯 : 3 ( �떇�뭹 ) 
			orders.setProductName(foods.getFoodName());
			String imgName = mkService.selectImg(productNo, 3);
			orders.setImgName(imgName);
		}
		if (tools != null) {//�씠誘몄� ���엯 : 6 ( 二쇰갑�룄援�)
			orders.setProductName(tools.getToolName());
			String imgName = mkService.selectImg(productNo, 6);
			orders.setImgName(imgName);
		}
		if (igs != null) {//�씠誘몄� ���엯 :5 (�떇�옱猷�) 
			orders.setProductName(igs.getIngredientName());
			String imgName = mkService.selectImg(productNo, 5);
			orders.setImgName(imgName);
		}
		if (menus != null) {//�씠誘몄� ���엯 : 4 (�떇�떒)
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

		int result = mkService.insertShipping(sa);

		if (result > 0) {
			return "redirect:myPage_MyAddress.me";
		} else {
			throw new UsersException("諛곗넚吏� 異붽� �떎�뙣");
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

		int result = uService.updateAddress(sa);

		if (result > 0) {
			return "redirect:myPage_MyAddress.me";
		} else {
			throw new UsersException("諛곗넚吏� �닔�젙 �떎�뙣");
		}
	}

	// 諛곗넚吏� �궘�젣
	@RequestMapping("myPage_deleteAddress.me")
	@ResponseBody
	public String myPage_deleteAddress(@RequestParam("shippingNo") String shippingNumber) {

		String[] shippingNos = shippingNumber.split(",");
		int[] intShippingNos = new int[shippingNos.length];
		int result = 0;

		for (int i = 0; i < shippingNos.length; i++) {
			intShippingNos[i] = Integer.parseInt(shippingNos[i].replaceAll("[\\[\\]\"]", ""));
			int shippingNo = intShippingNos[i];

			result = mkService.delShipping(shippingNo);
		}

		return result > 0 ? "yes" : "no";
	}
	
	// �룷�씤�듃 �궡�뿭 議고쉶
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
		System.out.println(list);
		
		// �꽭�뀡�뿉�꽌 �룷�씤�듃 �냼硫� �솗�씤 �뿬遺�瑜� 媛��졇�샂
//	    boolean pointExpiryChecked = (boolean) model.getAttribute("pointExpiryChecked");
//	    int result1 = 0;
//	    int result2 = 0;
//	    
//	    if (pointExpiryChecked == true && pointExpiryChecked != null) {
//	        // �씠誘� �룷�씤�듃 �냼硫� �솗�씤�븳 寃쎌슦, 泥섎━�븷 �븘�슂媛� �뾾�쑝誘�濡� 諛붾줈 諛섑솚
//	    	model.addAttribute("list", list);
//			model.addAttribute("pi", pi);
//			
//			return "myPage_Point";
//	    } else {
//		    // �쁽�옱 �궇吏� 援ы븯湲�
//		    LocalDate currentDate = LocalDate.now();
//		    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		    String formattedCurrentDate = currentDate.format(formatter);
//	
//		    // �룷�씤�듃 �냼硫� 泥섎━ 濡쒖쭅 �옉�꽦
//		    for (HashMap<String, Object> p : list) {
//		    	Integer type = (Integer) p.get("POINT_TYPE");
//		    	if(type == null) {  // 異쒖껨
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
//			            // �룷�씤�듃 �냼硫� 泥섎━ 肄붾뱶
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
		    	// �룷�씤�듃 �냼硫� �솗�씤 �뿬遺�瑜� �꽭�뀡�뿉 ���옣
//	    	model.addAttribute("pointExpiryChecked", true);
	    	
	    	model.addAttribute("list", list);
	    	model.addAttribute("pi", pi);
	    	
	    	return "myPage_Point";
//		    } else {
//		    	throw new UsersException("�룷�씤�듃 癒몄떆湲� �떎�뙣");
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
			throw new UsersException("�젙蹂� �닔�젙 �떎�뙣�뀑");
		}
	}

	// 占쎌돳占쎌뜚占쎄퉱占쎈닚
	@RequestMapping("myPage_deleteInfo.me")
	public String myPage_deleteInfo(@RequestParam("usersNo") int usersNo) {
		int result = uService.deleteInfo(usersNo);

		if (result > 0) {
			return "redirect:logout.en";
		} else {
			throw new UsersException("�깉�눜 �떎�뙣 �뀑");
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
//		//�씠由� 媛��졇�삤湲� 
//		Food foods = null; Tool tools = null; Ingredient igs = null; Menu menus = null;
//		
//		for(Orders ps : periodSelec) {
//			int productNo = ps.getProductNo();
//			foods =  mkService.selectFood(productNo); tools = mkService.selectTool(productNo); igs = mkService.selectIngrdient(productNo); menus = mkService.selectMenu(productNo);
//			if (foods != null) { //�씠誘몄� ���엯 : 3 ( �떇�뭹 ) 
//				ps.setProductName(foods.getFoodName());
//			}
//			if (tools != null) {//�씠誘몄� ���엯 : 6 ( 二쇰갑�룄援�)
//				ps.setProductName(tools.getToolName());
//			}
//			if (igs != null) {//�씠誘몄� ���엯 :5 (�떇�옱猷�) 
//				ps.setProductName(igs.getIngredientName());
//			}
//			if (menus != null) {//�씠誘몄� ���엯 : 4 (�떇�떒)
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
		
		int listCount = uService.orderPeriodCount(prop); //湲곌컙�뿉 �뵲瑜� 媛쒖닔 �꽭湲� 
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Orders> periodSelec = uService.selectPeriodOrders(prop, pi);
//		//�씠由� 媛��졇�삤湲� 
		Food foods = null; Tool tools = null; Ingredient igs = null; Menu menus = null;
//		
		for(Orders ps : periodSelec) {
			int productNo = ps.getProductNo();
			foods =  mkService.selectFood(productNo); tools = mkService.selectTool(productNo); igs = mkService.selectIngrdient(productNo); menus = mkService.selectMenu(productNo);
			if (foods != null) { //�씠誘몄� ���엯 : 3 ( �떇�뭹 ) 
				ps.setProductName(foods.getFoodName());
			}
			if (tools != null) {//�씠誘몄� ���엯 : 6 ( 二쇰갑�룄援�)
				ps.setProductName(tools.getToolName());
			}
			if (igs != null) {//�씠誘몄� ���엯 :5 (�떇�옱猷�) 
				ps.setProductName(igs.getIngredientName());
			}
			if (menus != null) {//�씠誘몄� ���엯 : 4 (�떇�떒)
				ps.setProductName(menus.getMenuName());
			}
		}
		
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		
		model.addAttribute("pi", pi);
		System.out.println("ps : " + periodSelec);
		model.addAttribute("orderList", periodSelec);
		System.out.println("orderList: " + periodSelec);
		return "myPage_MyOrder";
		
	}
	
	@GetMapping("searchWord.me")
	public String searchWord(String start, String end, String word, Model model,  @RequestParam(value="page", required=false) Integer currentPage) {
		
		if(currentPage == null) {
			currentPage = 1;
		}
		int usersNo = ((Users) model.getAttribute("loginUser")).getUsersNo();
		Users users = (Users) model.getAttribute("loginUser");
		String userNo = String.valueOf(usersNo);
		
		Properties prop = new Properties();
		prop.setProperty("word", word);
		prop.setProperty("usersNo", userNo);
		//�떦�뿰�엳 �럹�씠吏뺤쓣.... 
		int listCount = 0; PageInfo pi = null; ArrayList<Map<String, Object>> orderSearchList = null;
		if(start == null) { //�쟾泥� 議고쉶 
			listCount = mkService.orderSearchCount(prop); //�떒�뼱 �엳�뒗 寃� 以�, �쟾泥� 議고쉶 
			pi = Pagination.getPageInfo(currentPage, listCount, 10);
			orderSearchList = mkService.orderSearch(prop, pi); //�떒�뼱 �엳�뒗 寃� 以� �럹�씠吏뺤쿂由ы븯�뿬 �쟾泥� 議고쉶
		} else { //湲곌컙�씠 �뱾�뼱�삤硫�,
			prop.setProperty("start", start);
			prop.setProperty("end", end);
			listCount = mkService.orderPeriodSearchCount(prop);
			pi = Pagination.getPageInfo(currentPage, listCount, 10);
			orderSearchList = mkService.orderPeriodSearchList(prop, pi);
			
			model.addAttribute("start", start);
			model.addAttribute("end", end);
		}
		
		ArrayList<Orders> orderList = new ArrayList<>(); int rCount = 0;
		for(Map<String, Object>  order : orderSearchList) {
			//�븘�슂 �뜲�씠�꽣 : 二쇰Ц踰덊샇, 二쇰Ц���엯, �긽�뭹紐�, 二쇰Ц�궇吏�, 珥� 二쇰Ц湲덉븸 
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
			orders.setProductNo(Integer.parseInt(order.get("PRODUCT_NO").toString()));
			rCount = mkService.selectReview(orders.getOrderNo(), users.getNickName());
			orders.setReviewCount(rCount);
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
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<HashMap<String, Object>> list = uService.selectReview(map, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "myPage_Review";
	}
	
	
}