package kh.finalproj.hollosekki.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import kh.finalproj.hollosekki.common.Pagination;
import kh.finalproj.hollosekki.common.ReviewPagination;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.Ingredient;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.common.model.vo.Review;
import kh.finalproj.hollosekki.enroll.model.service.EnrollService;
import kh.finalproj.hollosekki.enroll.model.vo.SocialLogin;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.recipe.model.exception.RecipeException;
import kh.finalproj.hollosekki.recipe.model.service.RecipeService;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;
import kh.finalproj.hollosekki.recipe.model.vo.RecipeElement;
import kh.finalproj.hollosekki.recipe.model.vo.RecipeOrder;
import kh.finalproj.hollosekki.users.model.service.UsersService;

@SessionAttributes({"loginUser", "cart"})
@Controller
public class RecipeController {

	@Autowired
	private RecipeService rService;
	
	@Autowired
	private EnrollService eService;
	
	@Autowired
	private UsersService uService;
	
//	레시피 리스트 조회
	@RequestMapping("recipeList.rc")
	public String recipeList(@ModelAttribute Recipe r, Model model,
			@RequestParam(value = "page", required = false) Integer currentPage) {
		
		Users u = (Users) model.getAttribute("loginUser");
		if(u != null) {
			int cart = eService.cartCount(u.getUsersNo());
			model.addAttribute("cart", cart);
		}
		
		if (currentPage == null) {
			currentPage = 1;
		}
		int listCount = rService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);

		ArrayList<Recipe> rList = new ArrayList<>();
		ArrayList<Image> iList = new ArrayList<>();

		rList = rService.selectRecipeList(pi);
		iList = rService.selectRecipeImageList();

		if(!rList.isEmpty()) {
			model.addAttribute("rList", rList);
			model.addAttribute("iList", iList);
			model.addAttribute("pi", pi);

			return "recipeList";
		} else {
			throw new RecipeException("레시피 조회에 실패하였습니다.");
		}
		
		
	}
	
//	레시피 검색
	@GetMapping("searchRecipe.rc")
	public String searchRecipe(@ModelAttribute Recipe r, Model model,
								@RequestParam(value = "page", required = false) Integer currentPage,
								@RequestParam("input") String word) {
		
		Users u = (Users) model.getAttribute("loginUser");
		if(u != null) {
			int cart = eService.cartCount(u.getUsersNo());
			model.addAttribute("cart", cart);
		}
		
		if (currentPage == null) {
			currentPage = 1;
		}
		int listCount = rService.getSearchListCount(word);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
		
		ArrayList<Recipe> searchList = new ArrayList<>();
		ArrayList<Image> searchImage = new ArrayList<>();
		
		searchList = rService.searchRecipe(pi, word);
		searchImage = rService.searchImage();
		
		String cate = "word";
		String value= word;
		
		if(searchList.isEmpty()) {
			String str = "검색된 레시피가 없습니다.";
			model.addAttribute("str", str);
			model.addAttribute("pi", pi);

			return "recipeList";
		} else {
			model.addAttribute("rList", searchList);
			model.addAttribute("iList", searchImage);
			model.addAttribute("cate", cate);
			model.addAttribute("value", value);
			model.addAttribute("pi", pi);
			return "recipeList";
		}
	}

//	레시피 상세조회
	@RequestMapping("recipeDetail.rc")
	public ModelAndView recipeDetail(@RequestParam("rId") String usersId, @RequestParam("rNo") int foodNo,
			@RequestParam(value = "page", required = false) Integer page, HttpSession session, ModelAndView mv,
			@RequestParam(value = "repage", required = false) Integer repage, Model model,
			@RequestParam(value = "myrepage", required = false) Integer myrepage) {

		Users loginUser = (Users) session.getAttribute("loginUser");

		String loginId = null;
		String nickName = null;
		Review my = new Review();
		int myReview = 0;
		if (loginUser != null) {
			loginId = loginUser.getUsersId();
			nickName = loginUser.getNickName();

			my.setReviewWriter(nickName);
			my.setProductNo(foodNo);

			myReview = rService.myReview(my);
		}
		boolean yn = false;
		if (!usersId.equals(loginId)) {
			yn = true;
		}

		int reviewCount = rService.getReviewCount(foodNo);
		if(repage == null) {
			repage = 1;
		}
		
		if(myrepage == null) {
			myrepage = 1;
		}
		
		PageInfo rpi = ReviewPagination.getPageInfo(repage, reviewCount, 5);
		PageInfo mpi = ReviewPagination.getPageInfo(myrepage, myReview, 5); // 내 리뷰

		Recipe recipe = rService.recipeDetail(foodNo, yn);
		ArrayList<RecipeOrder> orderList = rService.recipeDetailOrderText(foodNo);
		Image thum = rService.recipeDetailThum(foodNo);
		ArrayList<Image> cList = rService.recipeDetailComp(foodNo);
		ArrayList<Review> reList = rService.selectReviewList(rpi, foodNo);
		ArrayList<RecipeElement> eleList = rService.selectRecipeElement(foodNo);
		
		// 내 후기
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("reviewWriter", nickName);
		map.put("productNo", foodNo);
		
		ArrayList<Review> mrList = rService.selectMyReviewList(mpi, map);
		
		// 레시피 등록 유저 정보
		String id = usersId;
		SocialLogin social = eService.SocialLogin(id);
		model.addAttribute("social", social);
		
		Users user = eService.userInfo(id);
		int usersNo = user.getUsersNo();
		Image userImage = uService.selectImage(usersNo);
		model.addAttribute("userImage", userImage);
		
		// 북마크 정보
		int productNo = foodNo;
		if(loginUser != null) {
			int result = rService.selectRecipeBookmark(loginUser.getUsersNo(), productNo);
			model.addAttribute("bookmark", result);
		}
		
		
		System.out.println(recipe);
		System.out.println("cList : " + cList);

		if (recipe != null) {
			mv.addObject("recipe", recipe);
			mv.addObject("orderList", orderList);
			mv.addObject("thum", thum);
			mv.addObject("cList", cList);
			mv.addObject("reList", reList);
			mv.addObject("mrList", mrList);
			mv.addObject("page", page);
			mv.addObject("rpi", rpi);
			mv.addObject("mpi", mpi);
			mv.addObject("eleList", eleList);
			mv.addObject("myReview", myReview);
			mv.addObject("reviewCount", reviewCount);
			mv.addObject("repage", repage);
			mv.addObject("myrepage", myrepage);
			mv.setViewName("recipeDetail");

			return mv;
		} else {

			throw new RecipeException("레시피 상세조회를 실패하였습니다.");
		}
	}

//	레시피 작성 창으로
	@RequestMapping("recipeWrite.rc")
	public String recipeWrite(HttpSession session, Model model) {
		Users loginUser = (Users) session.getAttribute("loginUser");

		ArrayList<Ingredient> iList = rService.selectIngredient();

		if (loginUser != null) {
			model.addAttribute("iList", iList);

			return "recipeWrite";
		} else {
			throw new RecipeException("레시피 작성을 할 수 없습니다.");
		}

	}

//	레시피 작성
	@PostMapping("writeRecipe.rc")
	public String writeRecipe(@ModelAttribute Recipe r, HttpServletRequest request,
			@RequestParam("thum") MultipartFile thum, @RequestParam("orderFile") ArrayList<MultipartFile> orderFiles,
			@RequestParam("comPic") ArrayList<MultipartFile> comFiles,
			@RequestParam("elementQuantity") String elementQuantity,
			@RequestParam("elementIngredient") ArrayList<String> elementIngredient, @ModelAttribute RecipeOrder rc) {

		Users user = (Users) request.getSession().getAttribute("loginUser");
		int userNo = user.getUsersNo();
		r.setUsersNo(userNo);

		String id = user.getUsersId();
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;

		result1 = rService.insertRecipe(r);

//		레시피 재료
		ArrayList<RecipeElement> reelList = new ArrayList<>();
		String[] quantity = elementQuantity.split(",");

		for(int i = 0; i < quantity.length; i++) {
			if (!quantity[i].equals("") && !elementIngredient.get(i).isEmpty()) {
				RecipeElement reel = new RecipeElement();
				if(elementIngredient.get(i).contains("-")) {
					reel.setElementQuantity(quantity[i]);
					reel.setElementName(elementIngredient.get(i).split("-")[0]);
					reel.setElementNo(Integer.parseInt(elementIngredient.get(i).split("-")[1]));

					reelList.add(reel);					
				} else if(!elementIngredient.get(i).contains("-")) {
					rService.insertNewIngredient(elementIngredient.get(i));
					int ingredientNo = rService.selectNewIngredient(elementIngredient.get(i));
					
					reel.setElementQuantity(quantity[i]);
					reel.setElementName(elementIngredient.get(i));
					reel.setElementNo(ingredientNo);
					
					reelList.add(reel);
				}
			} 
		}

		rService.insertIngredient(reelList);

//		썸네일 이미지
		ArrayList<Image> thumImgList = new ArrayList<>();
		String thumImg = thum.getOriginalFilename();
		if (!thumImg.equals("")) {
			String[] thumImgArr = saveFile(thum, request);
			if (thumImgArr[1] != null) {
				Image img = new Image();
				img.setImagePath(thumImgArr[0]);
				img.setImageOriginalName(thumImg);
				img.setImageRenameName(thumImgArr[1]);
				img.setImageLevel(0);

				thumImgList.add(img);
			}
		}

		result2 = rService.insertAttm(thumImgList);

//		레시피 순서 설명
		ArrayList<RecipeOrder> orc = new ArrayList<>();
		String[] orderArr = rc.getRecipeOrder().split(",abc123abc,");
		orderArr[orderArr.length - 1] = orderArr[orderArr.length - 1].replace(",abc123abc", "");

//		레시피 순서 사진
		for (int i = 0; i < orderFiles.size(); i++) {
			String recOriginal = orderFiles.get(i).getOriginalFilename();
			String recRename = "";
			String renamePath = "";
			if (!recOriginal.equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savePath = root + "\\uploadFiles";
				File file = new File(savePath);

				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
				int ranNum = (int) (Math.random() * 100000);
				recRename = sdf.format(new Date(System.currentTimeMillis())) + ranNum
						+ recOriginal.substring(recOriginal.lastIndexOf("."));

				if (!file.exists()) {
					file.mkdirs();
				}

				renamePath = file + "\\" + recRename;
				try {
					orderFiles.get(i).transferTo(new File(renamePath));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

			if (i < orderArr.length) {
				if (!orderArr[i].equals("")) {
					RecipeOrder recOrd = new RecipeOrder();
					recOrd.setRecipeOrder(orderArr[i]);
					recOrd.setRecipeProcedure(i + 1);
					recOrd.setRecipeOriginalName(recOriginal);
					recOrd.setRecipeRenameName(recRename);
					recOrd.setRecipeImagePath(renamePath);

					orc.add(recOrd);
				}
			}
		}
		int resultOrder = rService.insertOrder(orc);

//		완성된 요리 사진
		ArrayList<Image> comImgList = new ArrayList<>();
		for (int i = 0; i < comFiles.size(); i++) {
			MultipartFile comFile = comFiles.get(i);
			if (comFile != null && !comFile.isEmpty()) {
				String[] comFileArr = saveFile(comFile, request);
				if (comFileArr[1] != null) {
					Image img = new Image();

					img.setImagePath(comFileArr[0]);
					img.setImageOriginalName(comFile.getOriginalFilename());
					img.setImageRenameName(comFileArr[1]);
					img.setImageLevel(2);

					comImgList.add(img);
				}
			}
		}

		result4 = rService.insertAttm(comImgList);

		if (result1 + result2 + resultOrder + result4 == thumImgList.size() + resultOrder + comImgList.size() + 1) {
			if (user.getIsAdmin().equals("Y")) {
				return "redirect:adminRecipeManage.ad";
			} else {
				return "redirect:recipeList.rc";
			}
		} else {
			for (Image thi : thumImgList) {
				deleteFile(thi.getImageRenameName(), request);
			}
			for (RecipeOrder ori : orc) {
				deleteFile(ori.getRecipeRenameName(), request);
			}
			for (Image comi : comImgList) {
				deleteFile(comi.getImageRenameName(), request);
			}
			throw new RecipeException("레시피 작성에 실패하였습니다.");
		}
	}

	public String[] saveFile(MultipartFile file, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int) (Math.random() * 100000);
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum
				+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

		String renamePath = folder + "\\" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		String[] returnArr = new String[2];
		returnArr[0] = savePath;
		returnArr[1] = renameFileName;

		return returnArr;
	}

	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";

		File f = new File(savePath + "\\" + fileName);
		if (f.exists()) {
			f.delete();
		}
	}

//	레시피 삭제
	@PostMapping("deleteRecipe.rc")
	public String deleteRecipe(@RequestParam("foodNo") int foodNo) {

		int result1 = rService.deleteRecipe(foodNo);
//		int result2 = rService.deleteOrder(foodNo);
//		int result3 = rService.deleteImage(foodNo);

		if (result1 > 0) {
			return "redirect:recipeList.rc";
		} else {
			throw new RecipeException("레시피 삭제를 실패하였습니다.");
		}
	}

//	레시피 수정 폼으로
	@PostMapping("updateForm.rc")
	public ModelAndView updateForm(@RequestParam("foodNo") int foodNo, @RequestParam("page") int page,
			ModelAndView mv) {

		Recipe recipe = rService.recipeDetail(foodNo, false);
		ArrayList<RecipeOrder> orderList = rService.recipeDetailOrderText(foodNo);
		Image thum = rService.recipeDetailThum(foodNo);
		ArrayList<Image> cList = rService.recipeDetailComp(foodNo);
		ArrayList<RecipeElement> reList = rService.selectRecipeElement(foodNo);
		ArrayList<Ingredient> iList = rService.selectIngredient();

		mv.addObject("recipe", recipe);
		mv.addObject("orderList", orderList);
		mv.addObject("thum", thum);
		mv.addObject("cList", cList);
		mv.addObject("page", page);
		mv.addObject("reList", reList);
		mv.addObject("iList", iList);
		
		mv.setViewName("recipeEdit");

		return mv;
	}

//	레시피 수정
	@PostMapping("updateRecipe.rc")
	public String updateRecipe(HttpServletRequest request, Model model, @ModelAttribute Recipe r,
			@ModelAttribute RecipeOrder rc, @RequestParam(value = "thum", required = false) MultipartFile thum,
			@RequestParam(value = "orderFile", required = false) ArrayList<MultipartFile> orderFiles,
			@RequestParam(value = "comPic", required = false) ArrayList<MultipartFile> comFiles,
			@RequestParam("delThum") String delThum, @RequestParam("delOrderImg") String[] delOrderImg,
			@RequestParam("delComImg") String[] delComImg, @RequestParam("page") int page,
			@RequestParam("elementQuantity") String elementQuantity, @RequestParam("elementIngredient") ArrayList<String> elementIngredient,
			@RequestParam(value="delPro", required=false) ArrayList<String> delPro, @RequestParam(value="newRecipeOrder", required=false) String newRecipeOrder,
			@RequestParam(value="newOrderFile", required=false) ArrayList<MultipartFile> newOrderFile) {

		int updateRecipeResult = 0;
		updateRecipeResult = rService.updateRecipe(r);

//		썸네일 변경/삭제
		ArrayList<Image> thumImgList = new ArrayList<>();
		int thumResult = 0;
		String delThumRename = "";
		if (thum != null) {
			String thumImg = thum.getOriginalFilename();
			if (!thumImg.equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savedPath = root + "\\uploadFiles";

				delThumRename = delThum.split("/")[0];

				int thumDelResult = 0;
				thumDelResult = rService.deleteThumImg(delThumRename);

				File file = new File(savedPath + "\\" + delThumRename);

				if (file.exists()) {
					file.delete();
				}

				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
				int ranNum = (int) (Math.random() * 100000);
				String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum
						+ thumImg.substring(thumImg.lastIndexOf("."));

				try {
					thum.transferTo(new File(savedPath + "\\" + renameFileName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				String savePath = savedPath + "\\" + renameFileName;

				Image img = new Image();
				img.setImagePath(savePath);
				img.setImageOriginalName(thumImg);
				img.setImageRenameName(renameFileName);
				img.setImageLevel(0);
				img.setImageDivideNo(r.getFoodNo());

				thumResult = rService.insertThum(img);
			}
		}
		
//		레시피 재료 변경 삭제
		
		rService.deleteRecipeIngredient(r.getFoodNo());
		
		ArrayList<RecipeElement> reelList = new ArrayList<>();
		String[] quantity = elementQuantity.split(",");
		
//		System.out.println(elementQuantity);
//		System.out.println(elementIngredient);

		for(int i = 0; i < quantity.length; i++) {
			if (!quantity[i].equals("") && !elementIngredient.get(i).isEmpty()) {
				RecipeElement reel = new RecipeElement();
				if(elementIngredient.get(i).contains("-")) {
					reel.setFoodNo(r.getFoodNo());
					reel.setElementQuantity(quantity[i]);
					reel.setElementName(elementIngredient.get(i).split("-")[0]);
					reel.setElementNo(Integer.parseInt(elementIngredient.get(i).split("-")[1]));

					reelList.add(reel);					
				} else if(!elementIngredient.get(i).contains("-")) {
					rService.insertNewIngredient(elementIngredient.get(i));
					int ingredientNo = rService.selectNewIngredient(elementIngredient.get(i));
					
					reel.setFoodNo(r.getFoodNo());
					reel.setElementQuantity(quantity[i]);
					reel.setElementName(elementIngredient.get(i));
					reel.setElementNo(ingredientNo);
					
					reelList.add(reel);
				}
			} 
		}

		rService.updateIngredient(reelList);
		

//		레시피 순서 변경/삭제
		ArrayList<RecipeOrder> orc = new ArrayList<>();
		ArrayList<RecipeOrder> ro = new ArrayList<>();
		String[] orderArr = rc.getRecipeOrder().split(",abc123abc,");
		orderArr[orderArr.length - 1] = orderArr[orderArr.length - 1].replace(",abc123abc", "");

		String root = request.getSession().getServletContext().getRealPath("resources");
		String savedPath = root + "\\uploadFiles";
		File folder = new File(savedPath);

		ArrayList<String> delOrderList = new ArrayList<>();

		int updateOrderResult = 0;
		int updateRecipeOrderResult = 0;
		int delOrderImgResult = 0;

		int delLine = 0;
		
		if(delPro != null) {
			if(!delPro.isEmpty()) {
				for(int i = 0; i < delPro.size(); i++) {
					delLine += rService.deleteOrderImg(delPro.get(i));
				}
			}
		}
//		for(int i = 0; i < orderFiles.size(); i++) {
//			System.out.println(orderFiles.get(i));
//		}
//		System.out.println(orderFiles.size());
		
		int orderProcedure = orderArr.length - delLine;
		int j = 0;
		for (int i = 0; i < orderArr.length; i++) {
			if (!delOrderImg[i].equals("none")) {
				deleteFile(delOrderImg[i], request);
				for(; j < orderFiles.size();) {
					String recipeOriginal = orderFiles.get(j).getOriginalFilename();
					if (orderFiles.get(j) != null && !recipeOriginal.equals("")) {
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
						int ranNum = (int) (Math.random() * 100000);
						String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum
								+ recipeOriginal.substring(recipeOriginal.lastIndexOf("."));

						String renamePath = folder + "\\" + renameFileName;

						try {
							orderFiles.get(j).transferTo(new File(renamePath));
						} catch (IllegalStateException | IOException e) {
							e.printStackTrace();
						}
						RecipeOrder rcc = new RecipeOrder();
						if (i < orderArr.length) {
							if (!orderArr[i].equals("")) {
								rcc.setRecipeOrder(orderArr[i]);
//								System.out.println("orderArr : " + orderArr[i]);
							}
						}
						rcc.setRecipeOriginalName(recipeOriginal);
						rcc.setRecipeRenameName(renameFileName);
						rcc.setRecipeProcedure(i + 1);
						rcc.setRecipeImagePath(renamePath);
						rcc.setFoodNo(rc.getFoodNo());

//						System.out.println("rcc : " + rcc);

						orc.add(rcc);
						System.out.println("orc1 : " + orc);
					}
					j++;
					break;
				}
			} else if (delOrderImg[i].equals("none")) {
				RecipeOrder rcc = new RecipeOrder();
				if (i < orderArr.length) {
					if (!orderArr[i].equals("")) {
						rcc.setRecipeOrder(orderArr[i]);
					}
				}
				rcc.setRecipeProcedure(i + 1);
				rcc.setFoodNo(rc.getFoodNo());

				ro.add(rcc);
			}
		}
		System.out.println("orc2 : " + orc);
		
		updateRecipeOrderResult = rService.updateRecipeOrder(ro);
		updateOrderResult = rService.updateOrder(orc);
		
		ArrayList<RecipeOrder> norc = new ArrayList<>();
		if(newRecipeOrder != null) {
			String[] newOrderArr = newRecipeOrder.split(",abc123abc,");
			newOrderArr[newOrderArr.length -1] = newOrderArr[newOrderArr.length - 1].replace(",abc123abc", "");
			for(int x = 0; x < newOrderArr.length; x++) {
				String newOriginal = newOrderFile.get(x).getOriginalFilename();
				String newRename = "";
				String newRenamePath = "";
				if(!newOriginal.equals("")) {
					root = request.getSession().getServletContext().getRealPath("resources");
					String savePath = root + "\\uploadFiles";
					File file = new File(savePath);
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
					int ranNum = (int) (Math.random() * 100000);
					newRename = sdf.format(new Date(System.currentTimeMillis())) + ranNum
							+ newOriginal.substring(newOriginal.lastIndexOf("."));
					
					if(!file.exists()) {
						file.mkdirs();
					}
					
					newRenamePath = file + "\\" + newRename;
					
					try {
						newOrderFile.get(x).transferTo(new File(newRenamePath));
					} catch (IllegalStateException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(x < newOrderArr.length) {
					if(!newOrderArr[x].equals("")) {
						RecipeOrder newOrd = new RecipeOrder();
						newOrd.setRecipeOrder(newOrderArr[x]);
						newOrd.setRecipeProcedure(orderArr.length + x + 1);
						newOrd.setRecipeOriginalName(newOriginal);
						newOrd.setRecipeRenameName(newRename);
						newOrd.setRecipeImagePath(newRenamePath);
						newOrd.setFoodNo(r.getFoodNo());
						
						norc.add(newOrd);
					}
				}
			}
			
			int newResult = rService.insertOrder(norc);
		}
		
//		완성 사진 수정
		ArrayList<Image> comImgList = new ArrayList<>();
		ArrayList<String> comDelRename = new ArrayList<>();
		int updateComResult = 0;
		int delComResult = 0;

		for (String rename : delComImg) {
			if (!rename.equals("none")) {
				String[] split = rename.split("/");
				comDelRename.add(split[0]);
			}
		}
		if (!comDelRename.isEmpty()) {
			delComResult = rService.deleteComImg(comDelRename);
			if (delComResult > 0) {
				for (String rename : comDelRename) {
					deleteFile(rename, request);
				}
			}
		}

		if (comFiles != null) {
			for (int i = 0; i < comFiles.size(); i++) {
				String comOriginal = comFiles.get(i).getOriginalFilename();

				if (comFiles.get(i) != null && !comOriginal.equals("")) {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmsss");
					int ranNum = (int) (Math.random() * 100000);
					String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum
							+ comOriginal.substring(comOriginal.lastIndexOf("."));

					String renamePath = folder + "\\" + renameFileName;

					try {
						comFiles.get(i).transferTo(new File(renamePath));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					Image img = new Image();
					img.setImagePath(renamePath);
					img.setImageOriginalName(comOriginal);
					img.setImageRenameName(renameFileName);
					img.setImageLevel(2);
					img.setImageDivideNo(r.getFoodNo());

					comImgList.add(img);
				}
			}
			updateComResult = rService.insertAttm(comImgList);
		}

		model.addAttribute("rId", r.getUsersId());
		model.addAttribute("rNo", r.getFoodNo());
		model.addAttribute("page", page);
		return "redirect:recipeDetail.rc";
		
//		if (updateRecipeResult + thumResult + updateOrderResult + updateComResult == thumImgList.size() + orc.size()
//				+ comImgList.size() + 1) {
//			if (delThumRename.length() + comDelRename.size() == delThum.length() + delComImg.length
//					&& updateComResult + updateOrderResult + thumResult == 0) {
//				return "redirect:recipeDetail.rc";
//			} else {
//				model.addAttribute("rId", r.getUsersId());
//				model.addAttribute("rNo", r.getFoodNo());
//				model.addAttribute("page", page);
//				return "redirect:recipeDetail.rc";
//			}
//		} else {
//			model.addAttribute("rId", r.getUsersId());
//			model.addAttribute("rNo", r.getFoodNo());
//			model.addAttribute("page", page);
//
//			return "redirect:recipeDetail.rc";
//		}
	}

	// 조회순 정렬
	@RequestMapping("mostRecipe.rc")
	public String mostRecipe(HttpServletRequest request, Model model,
							@RequestParam(value = "page", required = false) Integer currentPage) {

		Users u = (Users) model.getAttribute("loginUser");
		if(u != null) {
			int cart = eService.cartCount(u.getUsersNo());
			model.addAttribute("cart", cart);
		}
		
		if (currentPage == null) {
			currentPage = 1;
		}
		int listCount = rService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);

		ArrayList<Recipe> rList = new ArrayList<>();
		ArrayList<Image> iList = new ArrayList<>();

		rList = rService.mostClickRecipeList(pi);
		iList = rService.selectRecipeImageList();

		if(!rList.isEmpty()) {
			model.addAttribute("rList", rList);
			model.addAttribute("iList", iList);
			model.addAttribute("pi", pi);

			return "recipeList";
		} else {
			throw new RecipeException("레시피 조회에 실패하였습니다.");
		}
	}

//	// 재료 카테고리 검색
//	@RequestMapping("recipeIngredient.rc")
//	public String recipeIngredient(HttpServletRequest request, Model model,
//											@RequestParam(value = "page", required = false) Integer currentPage,
//											@RequestParam("ingredient") String ingredient) {
//		Users u = (Users) model.getAttribute("loginUser");
//		if(u != null) {
//			int cart = eService.cartCount(u.getUsersNo());
//			model.addAttribute("cart", cart);
//		}
//		
//		if(currentPage == null) {
//			currentPage = 1;
//		}
//		int listCount = rService.getIngredientListCount(ingredient);
//		
//		System.out.println(listCount);
//		
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
//		
//		ArrayList<Image> searchImage = new ArrayList<>();
//		
//		ArrayList<Recipe> rList = rService.ingredientSearch(pi, ingredient);
//		searchImage = rService.searchImage();
//		
//		String cate = "ingredient";
//		String value= ingredient;
//		
//		System.out.println(rList);
//		
//		if(rList.isEmpty()) {
//			String str = "해당 카테고리 레시피가 없습니다.";
//			model.addAttribute("str", str);
//			model.addAttribute("pi", pi);
//
//			return "recipeList";
//		} else {
//			model.addAttribute("rList", rList);
//			model.addAttribute("iList", searchImage);
//			model.addAttribute("cate", cate);
//			model.addAttribute("value", value);
//			model.addAttribute("pi", pi);
//			
//			return "recipeList";
//		}
//	}
//
//	// 상황 카테고리 검색
//	@RequestMapping("recipeSituation.rc")
//	public String recipeSituation(HttpServletRequest request, Model model,
//								@RequestParam(value = "page", required = false) Integer currentPage,
//								@RequestParam("situation") String situation) {
//
//		Users u = (Users) model.getAttribute("loginUser");
//		if(u != null) {
//			int cart = eService.cartCount(u.getUsersNo());
//			model.addAttribute("cart", cart);
//		}
//		
//		if(currentPage == null) {
//			currentPage = 1;
//		}
//		int listCount = rService.getSituationListCount(situation);
//		
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
//		
//		ArrayList<Recipe> rList = rService.situationSearch(pi, situation);
//		ArrayList<Image> searchImage = rService.searchImage();
//		
//		String cate = "situation";
//		String value= situation;
//		
//		if(rList.isEmpty()) {
//			String str = "해당 카테고리 레시피가 없습니다.";
//			model.addAttribute("str", str);
//			model.addAttribute("pi", pi);
//
//			return "recipeList";
//		} else {
//			model.addAttribute("rList", rList);
//			model.addAttribute("iList", searchImage);
//			model.addAttribute("cate", cate);
//			model.addAttribute("value", value);
//			model.addAttribute("pi", pi);
//			return "recipeList";
//		}
//	}
//
//	// 타입 카테고리 검색
//	@RequestMapping("recipeType.rc")
//	public String recipeType(HttpServletRequest request, Model model,
//							@RequestParam(value = "page", required = false) Integer currentPage,
//							@RequestParam("type") String type) {
//		Users u = (Users) model.getAttribute("loginUser");
//		if(u != null) {
//			int cart = eService.cartCount(u.getUsersNo());
//			model.addAttribute("cart", cart);
//		}
//		
//		if(currentPage == null) {
//			currentPage = 1;
//		}
//		int listCount = rService.getTypeListCount(type);
//		
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
//		
//		ArrayList<Recipe> rList = rService.typeSearch(pi, type);
//		ArrayList<Image> searchImage = rService.searchImage();
//		
//		String cate = "type";
//		String value= type;
//
//		if(rList.isEmpty()) {
//			String str = "해당 카테고리 레시피가 없습니다.";
//			model.addAttribute("str", str);
//			model.addAttribute("pi", pi);
//
//			return "recipeList";
//		} else {
//			model.addAttribute("rList", rList);
//			model.addAttribute("iList", searchImage);
//			model.addAttribute("cate", cate);
//			model.addAttribute("value", value);
//			model.addAttribute("pi", pi);
//			return "recipeList";
//		}
//	}
//	
	@RequestMapping("recipeCate.rc")
	public String recipeCate(HttpServletRequest request, Model model, @RequestParam(value = "page", required = false) Integer currentPage,
							 @RequestParam("parCate") String par, @RequestParam("cate") String cate) {
		
		Users u = (Users) model.getAttribute("loginUser");
		if(u != null) {
			int cart = eService.cartCount(u.getUsersNo());
			model.addAttribute("cart", cart);
		}
		
		if(currentPage == null) {
			currentPage = 1;
		}
		
		String cateName = new String();
		if(par.equals("재료")) {
			cateName = "CATEGORY_INGREDIENT";
		} else if(par.equals("상황")) {
			cateName = "CATEGORY_SITUATION";
		} else {
			cateName = "CATEGORY_TYPE";
		}
		
		HashMap<String, String> category = new HashMap<>();
		category.put("cateName", cateName);
		category.put("cate", cate);
		
		int listCount = rService.getCateListCount(category);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
		
		ArrayList<Recipe> rList = rService.cateSearch(pi, category);
		ArrayList<Image> searchImage = rService.searchImage();
		
		String parCate = par;
		String catego = cate;
		
		if(rList.isEmpty()) {
			String str = "해당 카테고리 레시피가 없습니다.";
			model.addAttribute("str", str);
			model.addAttribute("pi", pi);

			return "recipeList";
		} else {
			model.addAttribute("rList", rList);
			model.addAttribute("iList", searchImage);
			model.addAttribute("parCate", parCate);
			model.addAttribute("catego", catego);
			model.addAttribute("pi", pi);
			return "recipeList";
		}
	}

	// 후기 입력
	@RequestMapping("reviewWrite.rc")
	public void reviewWrite(@RequestParam("content") String content, @RequestParam("id") String id,
			@RequestParam("foodNo") String foodNo, @RequestParam("score") int score, HttpServletResponse response,
			Model model) {
		Review re = new Review();
		
		int usersNo = ((Users)model.getAttribute("loginUser")).getUsersNo();

		re.setProductNo(Integer.parseInt(foodNo));
		re.setOrderNo(0);
		re.setReviewContent(content);
		re.setReviewWriter(id);
		re.setReviewScore(score);
		re.setUsersNo(usersNo);

		rService.reviewWrite(re);
		ArrayList<Review> reList = rService.selectReview(Integer.parseInt(foodNo));

		response.setContentType("application/json; charset=UTF-8");

		GsonBuilder gBuilder = new GsonBuilder();

		gBuilder.setDateFormat("yyyy-MM-dd");

		Gson gson = gBuilder.create();

		try {
			gson.toJson(reList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}

	// 후기 수정
	@RequestMapping("updateReview.rc")
	public String updateReview(@ModelAttribute Review r, Model model,
			@RequestParam(value = "reviewScore", defaultValue = "0", required = false) int reviewScore) {
		String usersId = ((Users) model.getAttribute("loginUser")).getUsersId();
		int foodNo = r.getProductNo();

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("r", r);
		map.put("reviewScore", reviewScore);

		int result = rService.updateReview(map);

		if (result > 0) {
			return "redirect:recipeDetail.rc?rId=" + usersId + "&rNo=" + foodNo;
		} else {
			throw new RecipeException("레시피 후기 수정 실패");
		}
	}

	// 후기 삭제
	@RequestMapping("deleteReview.rc")
	public String deleteReview(@RequestParam("rId") String usersId, @RequestParam("rNo") int foodNo,
			@RequestParam("reviewNo") int reviewNo, Model model) {
		int result = rService.deleteReview(reviewNo);

		if (result > 0) {
			return "redirect:recipeDetail.rc?rId=" + usersId + "&rNo=" + foodNo;
		} else {
			throw new RecipeException("레시피 후기 삭제 실패");
		}
	}
	
	@RequestMapping("insertBookmark.rc")
	@ResponseBody
	public String insertRecipeBookmark(int usersNo, int divisionNo) {
		int result = rService.insertRecipeBookmark(usersNo, divisionNo);
		if(result > 0) {
			   return "success";
		   } else {
			   return "fail";
		   }
	}
	
	@RequestMapping("deleteBookmark.rc")
	@ResponseBody
	public String deleteRecipeBookmark(int usersNo, int divisionNo) {
		int result = rService.deleteRecipeBookmark(usersNo, divisionNo);
		
		if(result > 0) {
			   return "success";
		} else {
			   return "fail";
		}
	}

}
