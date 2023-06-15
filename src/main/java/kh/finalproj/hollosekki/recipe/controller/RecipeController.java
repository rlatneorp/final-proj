package kh.finalproj.hollosekki.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kh.finalproj.hollosekki.common.model.Pagination;
import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.recipe.model.exception.RecipeException;
import kh.finalproj.hollosekki.recipe.model.service.RecipeService;
import kh.finalproj.hollosekki.recipe.model.vo.Recipe;
import kh.finalproj.hollosekki.recipe.model.vo.RecipeOrder;

@SessionAttributes("loginUser")
@Controller
public class RecipeController {

	@Autowired
	private RecipeService rService;
	
//	레시피 리스트 조회
	@RequestMapping("recipeList.rc")
	public String recipeList(@ModelAttribute Recipe r, Model model, @RequestParam(value = "page", required = false) Integer page) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int listCount = rService.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		
		ArrayList<Recipe> rList = rService.selectRecipeList(pi);
		ArrayList<Image> iList = rService.selectRecipeImageList();
		
		if(rList != null) {
			model.addAttribute("rList", rList);
			model.addAttribute("iList", iList);
			model.addAttribute("pi", pi);
			
			return "recipeList";
		} else {
			throw new RecipeException("레시피 조회에 실패하였습니다.");
		}
	}
	
//	레시피 상세조회
	@RequestMapping("recipeDetail.rc")
	public ModelAndView recipeDetail(@RequestParam("rId") String usersId, @RequestParam("rNo") int foodNo,
							   @RequestParam("page") int page, HttpSession session, ModelAndView mv) {
		
		Users loginUser = (Users)session.getAttribute("loginUser");
		String loginId = null;
		if(loginUser != null) {
			loginId = loginUser.getUsersId();
		}
		boolean yn = false;
		if(!usersId.equals(loginId)) {
			yn = true;
		}
		
		Recipe recipe = rService.recipeDetail(foodNo, yn);
		ArrayList<RecipeOrder> orderList = rService.recipeDetailOrderText(foodNo);
		Image thum = rService.recipeDetailThum(foodNo);
//		ArrayList<Image> oList = rService.recipeDetailOrder(foodNo);
		ArrayList<Image> cList = rService.recipeDetailComp(foodNo);
		
//		System.out.println(recipe.getRecipeOrder());
		
		if(recipe != null) {
			mv.addObject("recipe", recipe);
			mv.addObject("orderList", orderList);
			mv.addObject("thum", thum);
//			mv.addObject("oList", oList);
			mv.addObject("cList", cList);
			mv.addObject("page", page);
			mv.setViewName("recipeDetail");
			
			return mv;
		} else {
			throw new RecipeException("레시피 상세조회를 실패하였습니다.");
		}
		
		
	}
	
//	레시피 작성 창으로
	@RequestMapping("recipeWrite.rc")
	public String recipeWrite(HttpSession session) {
		Users loginUser = (Users)session.getAttribute("loginUser");
		
		if(loginUser != null) {
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
				
		
//				String[] orderFileArr = saveFile(orderFile, request);
//				if(orderFileArr[1] != null) {
//					Image img = new Image();
//					
//					img.setImagePath(orderFileArr[0]);
//					img.setImageOriginalName(orderFile.getOriginalFilename());
//					img.setImageRenameName(orderFileArr[1]);
//					img.setImageLevel(1);
//					
//					orderImgList.add(img);
//				}
		
//		result3 = rService.insertAttm(orderImgList);
		
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
			return "redirect:recipeList.rc";
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
}
