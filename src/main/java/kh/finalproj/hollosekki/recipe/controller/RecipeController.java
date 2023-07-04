package kh.finalproj.hollosekki.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.recipe.model.exception.RecipeException;
import kh.finalproj.hollosekki.recipe.model.service.RecipeService;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;
import kh.finalproj.hollosekki.recipe.model.vo.RecipeElement;
import kh.finalproj.hollosekki.recipe.model.vo.RecipeOrder;

@SessionAttributes("loginUser")
@Controller
public class RecipeController {

	@Autowired
	private RecipeService rService;
	
//	레시피 리스트 조회
	@RequestMapping("recipeList.rc")
	public String recipeList(@ModelAttribute Recipe r, Model model, @RequestParam(value = "page", required = false) Integer page, 
							 @RequestParam(value="input", required=false) String word) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = rService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Recipe> rList = new ArrayList<>();
		ArrayList<Recipe> searchList = new ArrayList<>();
		ArrayList<Image> iList = new ArrayList<>();
		ArrayList<Image> searchImage= new ArrayList<>();
		
		if(word == null) {
			rList = rService.selectRecipeList(pi);
			iList = rService.selectRecipeImageList();
		} else if(word != null) {
			searchList = rService.searchRecipe(word);
			searchImage = rService.searchImage();
		}
		
		if(word ==null) {
			model.addAttribute("rList", rList);
			model.addAttribute("iList", iList);
			model.addAttribute("pi", pi);
			
			return "recipeList";
		} else if(word != null) {
			model.addAttribute("rList", searchList);
			model.addAttribute("iList", searchImage);
			model.addAttribute("pi", pi);
			
			return "recipeList";
		} else {
			throw new RecipeException("레시피 조회에 실패하였습니다.");
		}
	}
	
//	레시피 상세조회
	@RequestMapping("recipeDetail.rc")
	public ModelAndView recipeDetail(@RequestParam("rId") String usersId, @RequestParam("rNo") int foodNo,
							   @RequestParam(value = "page", required = false) Integer page, HttpSession session, ModelAndView mv) {
		
		Users loginUser = (Users)session.getAttribute("loginUser");
		String loginId = null;
		if(loginUser != null) {
			loginId = loginUser.getUsersId();
		}
		boolean yn = false;
		if(!usersId.equals(loginId)) {
			yn = true;
		}
		
		int reviewCount = rService.getReviewCount(foodNo);
		PageInfo rpi = ReviewPagination.getPageInfo(1, reviewCount, 5);
		
		Recipe recipe = rService.recipeDetail(foodNo, yn);
		ArrayList<RecipeOrder> orderList = rService.recipeDetailOrderText(foodNo);
		Image thum = rService.recipeDetailThum(foodNo);
		ArrayList<Image> cList = rService.recipeDetailComp(foodNo);
		ArrayList<Review> reList = rService.selectReviewList(rpi, foodNo);
		ArrayList<RecipeElement> eleList = rService.selectRecipeElement(foodNo);
		
//		System.out.println(reList);
		
		if(recipe != null) {
			mv.addObject("recipe", recipe);
			mv.addObject("orderList", orderList);
			mv.addObject("thum", thum);
			mv.addObject("cList", cList);
			mv.addObject("reList", reList);
			mv.addObject("page", page);
			mv.addObject("rpi", rpi);
			mv.addObject("eleList", eleList);
			mv.setViewName("recipeDetail");
			
			return mv;
		} else {
			throw new RecipeException("레시피 상세조회를 실패하였습니다.");
		}
	}
	
//	레시피 작성 창으로
	@RequestMapping("recipeWrite.rc")
	public String recipeWrite(HttpSession session, Model model) {
		Users loginUser = (Users)session.getAttribute("loginUser");
		
		ArrayList<Ingredient> iList = rService.selectIngredient();
		
		if(loginUser != null) {
			model.addAttribute("iList", iList);
			
			return "recipeWrite";
		} else {
			throw new RecipeException("레시피 작성을 할 수 없습니다.");
		}
		
	}
	
//	레시피 작성
	@PostMapping("writeRecipe.rc")
	public String writeRecipe(@ModelAttribute Recipe r, HttpServletRequest request,
							  @RequestParam("thum") MultipartFile thum,
							  @RequestParam("orderFile") ArrayList<MultipartFile> orderFiles,
							  @RequestParam("comPic") ArrayList<MultipartFile> comFiles,
							  @RequestParam("elementQuantity") String elementQuantity, @RequestParam(value="newIngredient", required=false) ArrayList<String> newIng,
							  @RequestParam("elementIngredient") ArrayList<String> elementIngredient,
							  @ModelAttribute RecipeOrder rc) {
		
		Users user =(Users)request.getSession().getAttribute("loginUser");
		int userNo = user.getUsersNo();
		r.setUsersNo(userNo);
		
		String id = user.getUsersId();
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		int result4 = 0;
		
		result1 =rService.insertRecipe(r);
		
		ArrayList<RecipeElement> reelList = new ArrayList<>();
		String[] quantity = elementQuantity.split(",");
		
		for(int i = 0; i < elementIngredient.size(); i++) {
			if(!quantity[i].equals("") && !elementIngredient.get(i).isEmpty()) {
				RecipeElement reel = new RecipeElement();
				reel.setElementQuantity(quantity[i]);
				reel.setElementName(elementIngredient.get(i).split("-")[0]);
				reel.setElementNo(Integer.parseInt(elementIngredient.get(i).split("-")[1]));
				
				reelList.add(reel);
			} else if(!newIng.isEmpty()){
				RecipeElement reel = new RecipeElement();
				String newI = newIng.get(i);
				rService.insertNewIngredient(newI);
				Ingredient ing = rService.selectNewIngredient(newI);
				
				reel.setElementName(ing.getIngredientName());
				reel.setElementNo(ing.getIngredientNo());
				reel.setElementQuantity(quantity[i]);
				
				reelList.add(reel);
			}
		}
		
		rService.insertIngredient(reelList);
		
		
//		썸네일 이미지
		ArrayList<Image> thumImgList = new ArrayList<>();
		String thumImg = thum.getOriginalFilename();
		if(!thumImg.equals("")) {
			String[] thumImgArr = saveFile(thum, request);
			if(thumImgArr[1] != null) {
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
		for(int i = 0; i < orderFiles.size(); i++) {
			String recOriginal = orderFiles.get(i).getOriginalFilename();
			String recRename = "";
			String renamePath = "";
			if(!recOriginal.equals("")) {
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
				
			if(i < orderArr.length) {
				if(!orderArr[i].equals("")) {
					RecipeOrder recOrd = new RecipeOrder();
					recOrd.setRecipeOrder(orderArr[i]);
					recOrd.setRecipeProcedure(i+1);
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
		for(int i = 0; i < comFiles.size(); i++) {
			MultipartFile comFile = comFiles.get(i);
			if(comFile != null && !comFile.isEmpty()) {
				String[] comFileArr = saveFile(comFile, request);
				if(comFileArr[1] != null) {
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
		
		if(result1 + result2 + resultOrder + result4 == thumImgList.size() + resultOrder + comImgList.size() + 1) {
			if(user.getIsAdmin().equals("Y")) {
				return "redirect:adminRecipeManage.ad";
			}else {
				return "redirect:recipeList.rc";
			}
		} else {
			for(Image thi : thumImgList) {
				deleteFile(thi.getImageRenameName(), request);
			}
			for(RecipeOrder ori : orc) {
				deleteFile(ori.getRecipeRenameName(), request);
			}
			for(Image comi : comImgList) {
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
		if(f.exists()) {
			f.delete();
		}
	}
	
//	레시피 삭제
	@PostMapping("deleteRecipe.rc")
	public String deleteRecipe(@RequestParam("foodNo") int foodNo) {
		
		int result1 = rService.deleteRecipe(foodNo);
		int result2 = rService.deleteOrder(foodNo);
		int result3 = rService.deleteImage(foodNo);
		
		if(result1 > 0 && result2 > 0 && result3 > 0) {
			return "redirect:recipeList.rc";
		}else {
			throw new RecipeException("레시피 삭제를 실패하였습니다.");
		}
	}
	
//	레시피 수정 폼으로
	@PostMapping("updateForm.rc")
	public ModelAndView updateForm(@RequestParam("foodNo") int foodNo, @RequestParam("page") int page, ModelAndView mv) {
		
		Recipe recipe = rService.recipeDetail(foodNo, false);
		ArrayList<RecipeOrder> orderList = rService.recipeDetailOrderText(foodNo);
		Image thum = rService.recipeDetailThum(foodNo);
		ArrayList<Image> cList = rService.recipeDetailComp(foodNo);
		
		mv.addObject("recipe", recipe);
		mv.addObject("orderList", orderList);
		mv.addObject("thum", thum);
		mv.addObject("cList", cList);
		mv.addObject("page", page);
		mv.setViewName("recipeEdit");
		
		return mv;
	}
	
//	페시피 수정
	@PostMapping("updateRecipe.rc")
	public String updateRecipe(HttpServletRequest request, Model model, @ModelAttribute Recipe r,
									 @ModelAttribute RecipeOrder rc, @RequestParam(value= "thum", required = false) MultipartFile thum,
									 @RequestParam(value = "orderFile", required = false) ArrayList<MultipartFile> orderFiles,
									 @RequestParam(value = "comPic", required = false) ArrayList<MultipartFile> comFiles,
									 @RequestParam("delThum") String delThum, @RequestParam("delOrderImg") String[] delOrderImg,
									 @RequestParam("delComImg") String[] delComImg, @RequestParam("page") int page) {
		
		int updateRecipeResult = 0;
		updateRecipeResult = rService.updateRecipe(r);
		
//		썸네일 변경/삭제
		ArrayList<Image> thumImgList = new ArrayList<>();
		int thumResult = 0;
		String delThumRename = "";
		if(thum != null) {
			String thumImg = thum.getOriginalFilename();
			if(!thumImg.equals("")) {
				String root = request.getSession().getServletContext().getRealPath("resources");
				String savedPath = root + "\\uploadFiles";
				
				delThumRename = delThum.split("/")[0];
				
				int thumDelResult = 0;
				thumDelResult = rService.deleteThumImg(delThumRename);
				
				File file = new File(savedPath + "\\" + delThumRename);
				
				if(file.exists()) {
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
		
//		레시피 순서 변경/삭제
		ArrayList<RecipeOrder> orc = new ArrayList<>();
		String[] orderArr = rc.getRecipeOrder().split(",abc123abc,");
		orderArr[orderArr.length - 1] = orderArr[orderArr.length - 1].replace(",abc123abc", "");
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savedPath = root + "\\uploadFiles";
		File folder = new File(savedPath);
		String[] recipeRe = rc.getRecipeRenameName().split(",");
		int updateOrderResult = 0;
		if(orderFiles != null) {
			for(int i = 0; i < orderArr.length; i++) {
				String recipeOriginal = orderFiles.get(i).getOriginalFilename();
				
				if(orderFiles.get(i) != null && !recipeOriginal.equals("")) {
					File file = new File(savedPath + "\\" + recipeRe);
					
					if(file.exists()) {
						file.delete();
					}
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
					int ranNum = (int) (Math.random() * 100000);
					String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + ranNum
							+ recipeOriginal.substring(recipeOriginal.lastIndexOf("."));

					String renamePath = folder + "\\" + recipeRe;
					
					try {
						orderFiles.get(i).transferTo(new File(renamePath));
					} catch (IllegalStateException | IOException e) {
						e.printStackTrace();
					}
					
					RecipeOrder rcc = new RecipeOrder();
					if(i < orderArr.length) {
						if(!orderArr[i].equals("")) {
							rcc.setRecipeOrder(orderArr[i]);
							rcc.setRecipeOriginalName(recipeOriginal);
							rcc.setRecipeRenameName(renameFileName);
							rcc.setRecipeProcedure(i + 1);
							rcc.setRecipeImagePath(renamePath);
							
							orc.add(rcc);
						}
					}
				}
			}
			updateOrderResult = rService.insertOrder(orc);
		}
		
//		완성 사진 수정
		ArrayList<Image> comImgList = new ArrayList<>();
		ArrayList<String> comDelRename = new ArrayList<>();
		int updateComResult = 0;
		int delComResult = 0;
		
		for(String rename : delComImg) {
			if(!rename.equals("none")) {
				String[] split = rename.split("/");
				comDelRename.add(split[0]);
			}
		}
		if(!comDelRename.isEmpty()) {
			delComResult = rService.deleteComImg(comDelRename);
			if(delComResult > 0) {
				for(String rename : comDelRename) {
					deleteFile(rename, request);
				}
			}
		}
		
		
		if(comFiles != null) {
			for(int i = 0; i < comFiles.size(); i++) {
				String comOriginal = comFiles.get(i).getOriginalFilename();
				
				if(comFiles.get(i) != null && !comOriginal.equals("")) {
					
//					for(String rename : delComImg) {
//						if(!rename.equals("none")) {
//							String[] split = rename.split("/");
//							comDelRename.add(split[0]);
//						}
//					}
//					if(!comDelRename.isEmpty()) {
//						delComResult = rService.deleteComImg(comDelRename);
//						if(delComResult > 0) {
//							for(String rename : comDelRename) {
//								deleteFile(rename, request);
//							}
//						}
//					}
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
		
//		ArrayList<Image> comImgList = new ArrayList<>();
//		for(int i = 0; i < comFiles.size(); i++) {
//			MultipartFile comFile = comFiles.get(i);
//			if(comFile != null && !comFile.isEmpty()) {
//				String[] comFileArr = saveFile(comFile, request);
//				if(comFileArr[1] != null) {
//					Image img = new Image();
//					
//					img.setImagePath(comFileArr[0]);
//					img.setImageOriginalName(comFile.getOriginalFilename());
//					img.setImageRenameName(comFileArr[1]);
//					img.setImageLevel(2);
//					
//					comImgList.add(img);
//				}
//			}
//		}
//		
//		ArrayList<String> comDelRename = new ArrayList<>();
//		
//		for(String rename : delComImg) {
//			if(!rename.equals("none")) {
//				String[] split = rename.split("/");
//				comDelRename.add(split[0]);
//			}
//		}
//		
//		int recipeComResult = 0;
//		if(!comDelRename.isEmpty()) {
//			recipeComResult = rService.deleteComImg(comDelRename);
//			if(recipeComResult > 0) {
//				for(String rename : comDelRename) {
//					deleteFile(rename, request);
//				}
//			}
//		}
//		
//		int updateComImg = 0;
//		if(!comImgList.isEmpty()) {
//			updateComImg = rService.insertAttm(comImgList);
//		}
		
		if(updateRecipeResult + thumResult + updateOrderResult + updateComResult == thumImgList.size() + orc.size() + comImgList.size() + 1) {
			if(delThumRename.length() + comDelRename.size() == delThum.length() + delComImg.length && updateComResult + updateOrderResult + thumResult == 0) {
				return "redirect:recipeDetail.rc";
			} else {
				model.addAttribute("rId", r.getUsersId());
				model.addAttribute("rNo", r.getFoodNo());
				model.addAttribute("page", page);
				return "redirect:recipeDetail.rc";
			}
		} else {
			model.addAttribute("rId", r.getUsersId());
			model.addAttribute("rNo", r.getFoodNo());
			model.addAttribute("page", page);
			
			return "redirect:recipeDetail.rc";
//			throw new RecipeException("레시피 수정에 실패하였습니다.");
		}
	}
	
	// 최신순 정렬
	@RequestMapping(value="recentRecipe.rc", produces="application/json; charset=UTF-8")
	@ResponseBody
	public ArrayList<Recipe> recentRecipe(HttpServletRequest request, Model model){
		
		ArrayList<Recipe> rList = rService.recentRecipeList();
		
//		System.out.println(rList);
		
		model.addAttribute("rList", rList);
		
		return rList;
	}
	
	// 조회순 정렬
	@RequestMapping(value="mostRecipe.rc", produces="application/json; charset=UTF-8")
	@ResponseBody
	public ArrayList<Recipe> mostRecipe(HttpServletRequest request, Model model){
		
		ArrayList<Recipe> rList = rService.mostRecipeList();
		
		model.addAttribute("rList", rList);
		
		return rList;
	}
	
	// 재료 카테고리 검색
	@RequestMapping(value="recipeIngredient.rc", produces="application/json; charset=UTF-8")
	@ResponseBody
	public ArrayList<Recipe> recipeIngredient(HttpServletRequest request, Model model, @RequestParam("ingredient") String ingredient){
		
		ArrayList<Recipe> rList = rService.ingredientSearch(ingredient);
		
//		System.out.println(rList);
		
		return rList;
	}
	
	// 상황 카테고리 검색
	@RequestMapping(value="recipeSituation.rc", produces="application/json; charset=UTF-8")
	@ResponseBody
	public ArrayList<Recipe> recipeSituation(HttpServletRequest request, Model model, @RequestParam("situation") String situation){
		
		ArrayList<Recipe> rList = rService.situationSearch(situation);
		
		return rList;
	}

	// 타입 카테고리 검색
	@RequestMapping(value="recipeType.rc", produces="application/json; charset=UTF-8")
	@ResponseBody
	public ArrayList<Recipe> recipeType(HttpServletRequest request, Model model, @RequestParam("type") String type){
		
		ArrayList<Recipe> rList = rService.typeSearch(type);
		
		return rList;
	}
	
	// 후기 입력
	@RequestMapping("reviewWrite.rc")
	public void reviewWrite(@RequestParam("content") String content, @RequestParam("id") String id,
							@RequestParam("foodNo") String foodNo, @RequestParam("score") int score, 
							HttpServletResponse response) {
		Review re = new Review();
		
		re.setProductNo(Integer.parseInt(foodNo));
		re.setOrderNo(0);
		re.setReviewContent(content);
		re.setReviewWriter(id);
		re.setReviewScore(score);
		
		rService.reviewWrite(re);
		ArrayList<Review> reList = rService.selectReview(Integer.parseInt(foodNo));
		
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gBuilder = new GsonBuilder();
		
		gBuilder.setDateFormat("yyyy-MM-dd");
		
		Gson gson = gBuilder.create();
		
//		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		
		try {
			gson.toJson(reList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	// 후기 수정
	@RequestMapping("updateReview.rc")
	public String updateReview(@ModelAttribute Review r, Model model, @RequestParam(value="reviewScore", defaultValue = "0", required=false) int reviewScore) {
//		int result = rService.updateReview(r.getReviewNo());
		
		return null;
	}
	
}
