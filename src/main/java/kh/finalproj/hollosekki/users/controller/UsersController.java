package kh.finalproj.hollosekki.users.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
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

import kh.finalproj.hollosekki.common.model.vo.Image;
import kh.finalproj.hollosekki.enroll.model.service.EnrollService;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.users.model.exception.UsersException;
import kh.finalproj.hollosekki.users.model.service.UsersService;

@SessionAttributes({"loginUser", "image"})
@Controller
public class UsersController {
	
	@Autowired
	private EnrollService eService;
	
	@Autowired
	private UsersService uService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@RequestMapping("myPage_Main.me")
	public String myPage_Main(Model model) {
		return "myPage_Main";
	}
	
	@RequestMapping("myPage_Profile.me")
	public String myPage_Profile() {
		return "myPage_Profile";
	}
	
	// 파일 저장
	public String[] saveFile(MultipartFile file, HttpServletRequest request) {
		// 파일 저장소 지정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		// 파일 이름 변경 형식 지정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		int ranNum = (int)(Math.random()*100000);
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
		if(f.exists()) {
			f.delete();
		}
	}
	
	@RequestMapping("myPage_InsertProfile.me")
	public String myPage_InsertProfile(@RequestParam("file") MultipartFile file, @ModelAttribute Users u,
									   Model model, HttpServletRequest request) {
		int result = uService.updateProfile(u);
		
		Image image = null;
		
		if(file != null && !file.isEmpty()) {
			String[] returnArr = saveFile(file, request);
			
			if(returnArr[1] != null) {
				image = new Image();
				image.setImagePath(returnArr[0]);
				image.setImageOriginalName(file.getOriginalFilename());
				image.setImageRenameName(returnArr[1]);
				image.setImageType(1);
				image.setImageDivideNo(u.getUsersNo());
				
				int result2 = uService.insertImage(image);
				
				if(result2 > 0) {
					model.addAttribute("image", image);
				} else {
					throw new UsersException("사진 실패");
				}
			}
		}
		
		if(result > 0) {
	        model.addAttribute("loginUser", eService.login(u));
			return "redirect:myPage_Main.me";
		} else {
			throw new UsersException("프로필 수정 실패");
		}
	}
	
	@RequestMapping("myPage_UpdateProfile.me")
	public String myPage_UpdateProfile(@RequestParam("file") MultipartFile file, @ModelAttribute Users u,
			   						   Model model, HttpServletRequest request) {
		int result = uService.updateProfile(u);
		
		Image image = null;
		
		if(file != null && !file.isEmpty()) { // 새파일 들어옴
			String[] returnArr = saveFile(file, request);
			
			if(returnArr[1] != null) {
				image = new Image();
				image.setImagePath(returnArr[0]);
				image.setImageOriginalName(file.getOriginalFilename());
				image.setImageRenameName(returnArr[1]);
				image.setImageType(1);
				image.setImageDivideNo(u.getUsersNo());
				
				Image existingImage = uService.selectImage(u.getUsersNo());
				if(existingImage == null) { // 기존 파일이 없을 때
					int insertImage = uService.insertImage(image);
					
					if(insertImage > 0) {
						model.addAttribute("image", image);
					} else {
						throw new UsersException("사진 수정 실패");
					}
				} else {
					int deleteImage = uService.deleteImage(existingImage);
					
					String rename = existingImage.getImageRenameName();
					deleteFile(rename, request);
					if(deleteImage > 0) {
						int insertImage = uService.insertImage(image);
						
						if(insertImage > 0) {
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
		
		if(result > 0) {
	        model.addAttribute("loginUser", eService.login(u));
			return "redirect:myPage_Main.me";
		} else {
			throw new UsersException("프로필 수정 실패");
		}
	}
	
	@RequestMapping("myPage_DeleteImage.me")
	@ResponseBody
	public String myPage_DeleteImage(@RequestParam("usersNo") int usersNo, Model model,
									 HttpServletRequest request) {
		Image existingImage = uService.selectImage(usersNo);
		int deleteImage = 0;
		if(existingImage != null) { // 기존 파일이 있을 때
			deleteImage = uService.deleteImage(existingImage);
		}
		
		if(deleteImage > 0) {
			String rename = existingImage.getImageRenameName();
			deleteFile(rename, request);
			model.addAttribute("image", null);
			return "yes";
		} else {
			return "no";
		}
	}
	
	@RequestMapping("myPage_Intro.me")
	public String myPage_Intro() {
		return "myPage_Intro";
	}
	
	@RequestMapping("myPage_MyRecipe.me")
	public String myPage_MyRecipe() {
		return "myPage_MyRecipe";
	}
	
	@RequestMapping("myPage_MyBookMark.me")
	public String myPage_MyBookMark() {
		return "myPage_MyBookMark";
	}
	
	@RequestMapping("myPage_MyFavorite.me")
	public String myPage_MyFavorite() {
		return "myPage_MyFavorite";
	}
	
	@RequestMapping("myPage_MyOrder.me")
	public String myPage_MyOrder() {
		return "myPage_MyOrder";
	}
	
	@RequestMapping("myPage_MyOrderDetail.me")
	public String myPage_MyOrderDetail() {
		return "myPage_MyOrderDetail";
	}
	
	@RequestMapping("myPage_MyAddress.me")
	public String myPage_MyAddress() {
		return "myPage_MyAddress";
	}
	
	@RequestMapping("myPage_InsertAddress.me")
	public String myPage_InsertAddress() {
		return "myPage_InsertAddress";
	}
	
	@RequestMapping("myPage_UpdateAddress.me")
	public String myPage_UpdateAddress() {
		return "myPage_UpdateAddress";
	}
	
	@RequestMapping("myPage_Point.me")
	public String myPage_Point() {
		return "myPage_Point";
	}
	
	@RequestMapping("myPage_edit.me")
	public String myPage_edit() {
		return "myPage_checkPwd";
	}
	
	// 회원 정보 수정 전 비밀번호 체크
	@RequestMapping("myPage_checkPwd.me")
	@ResponseBody
	public String myPage_checkPwd(@RequestParam("usersPwd") String usersPwd, Model model) {
		String pwd = ((Users)model.getAttribute("loginUser")).getUsersPw();
		
		if(bcrypt.matches(usersPwd, pwd)) {
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
		Users u = ((Users)model.getAttribute("loginUser"));
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("usersId", usersId);
		map.put("newPw", bcrypt.encode(newPw));
		int result = uService.updatePwd(map);
		
		if(result > 0) {
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
		
		if(result > 0) {
			model.addAttribute("loginUser", eService.login(u));
			return "yes";
		} else {
			throw new UsersException("회원 정보 수정 실패");
		}
	}
	
	
}
