package kh.finalproj.hollosekki.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import kh.finalproj.hollosekki.board.exception.BoardException;
import kh.finalproj.hollosekki.board.model.service.BoardService;
import kh.finalproj.hollosekki.board.model.vo.Board;
import kh.finalproj.hollosekki.common.Pagination;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.enroll.model.service.EnrollService;
import kh.finalproj.hollosekki.enroll.model.vo.Users;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
	@Autowired
	private EnrollService eService;
	
//	@RequestMapping("freeBoard.bo")
//	public String freeBoard(@RequestParam(value="page",required=false) Integer currentPage, Model model, @ModelAttribute Board b) {
//		if(currentPage == null) {
//			currentPage = 1;
//		}
//		int listCount = bService.getFreeBoardListCount(0);
//		
//		
//		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
//		
//		ArrayList<Board> list = bService.freeBoardView(b, pi);
//		model.addAttribute("pi", pi);
//		model.addAttribute("list", list);
//		
//		return "freeBoard";
//	}
	
	@RequestMapping("detailFreeBoard.bo")
	public String selectFreeBoard(Model model,HttpSession session, 
			@RequestParam("bId") int bId, @RequestParam("writer") String writer, 
			@RequestParam(value="page",required=false) Integer page) {
		Users u = (Users)session.getAttribute("loginUser");
		String login = null;
		if(u != null) {
			login = u.getNickName();
		}
		boolean yn = false;
		if(!writer.equals(login)) {
			yn = true;
		}
		ArrayList<Board> list = bService.selectReply(bId);
		Board blist = bService.selectBoard(bId, yn);
		
		ArrayList<Users> AllUsersList = eService.AllUsersList();
		
		if(blist != null) {
			model.addAttribute("blist", blist);
			model.addAttribute("list", list);
			model.addAttribute("page", page);
			model.addAttribute("login", login);
			model.addAttribute("aList", AllUsersList);
			
			return "detailFreeBoard";
		} else {
			throw new BoardException("게시글 열람에 실패했습니다.");
		}
		
	}
	
	@RequestMapping("insertReply.bo")
	public void insertReply(HttpServletResponse response, @ModelAttribute Board b) {
		
		bService.insertReply(b);
		ArrayList<Board> rlist = bService.selectReply(b.getProductNo());
		
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder().setDateFormat("yy-MM-dd HH:mm");
		Gson gson = gb.create();
		try {
			gson.toJson(rlist, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}	
	
	@RequestMapping("replyDelete.bo")
	@ResponseBody
	public String replyDelete(@ModelAttribute Board b) {
		
		int result = bService.replyDelete(b);
		return result == 1 ? "success" : "fail";
	}
		
	@RequestMapping("reReply.bo")
	@ResponseBody
	public String reReply(@RequestParam(value="reviewContent",required=false) String reviewContent, @RequestParam(value="reviewWriter",required=false) String reviewWriter,
			@RequestParam(value="productNo",required=false) int productNo, @RequestParam(value="reviewNo",required=false) int reviewNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("reviewContent", reviewContent);
		map.put("reviewWriter", reviewWriter);
		map.put("productNo", productNo);
		map.put("reviewNo", reviewNo);
		
		int result = bService.reReply(map);
		return result == 1 ? "success" : "fail";
	}
	
	@RequestMapping("freeBoardWrite.bo")
	public String goToWriete() {
		return "freeBoardWrite";
	}

	
	@RequestMapping("freeBoardWriting.bo")
	public void freeBoardWrite(Model model,HttpSession session,@RequestParam(value="introContent",required=false) String introContent, @RequestParam(value="introTitle",required=false) String introTitle) {
		Users u = (Users)session.getAttribute("loginUser");
		int usersNo = 0;
		
		if(u != null) {
			usersNo = u.getUsersNo();
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("usersNo", usersNo);
		map.put("introContent", introContent);
		map.put("introTitle", introTitle);
		
		bService.freeBoardWriting(map);
		
	}
	
	@RequestMapping("goToMyBoard.bo")
	public void goToMyBoard(HttpServletResponse response, Model model,HttpSession session) {
		Users u = (Users)session.getAttribute("loginUser");
		String login = null;
		if(u != null) {
			login = u.getNickName();
		}
		Board blist = bService.firstSelectBoard(login);
		
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder().setDateFormat("yy-MM-dd HH:mm");
		Gson gson = gb.create();
		try {
			gson.toJson(blist, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("freeBoard.bo")
	public String freeBoardSearch(@RequestParam(value="category", required=false) String category,@RequestParam(value="search", required=false) String search, HttpSession session, @RequestParam(value="page", required=false) Integer currentPage,
			Model model) {
		if(currentPage == null) {
			
			currentPage = 1;
		}
		

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("search", search);
		
		int	listCount = bService.getCategoryFreeCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);

		ArrayList<Board> list = bService.freeBList(pi, map);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("category", category);
		model.addAttribute("search", search);
		
		return "freeBoard";
	}
	
	@RequestMapping("fileUpload.bo")
	public void fileUpload(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String realFolder = request.getSession().getServletContext().getRealPath("fileUpload");
		UUID uuid = UUID.randomUUID();

		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;


		String filepath = realFolder + "\\" + str_filename;

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("fileUpload/" + str_filename);
		out.close();
	}
	
	@RequestMapping("reWriteBoardInfo.bo")
	public void reWrieteBoardInfo(HttpServletResponse response,@RequestParam(value="boardNo", required=false) int boardNo,
			@RequestParam(value="nickName", required=false) String nickName,Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("nickName", nickName);
		
		Board bInfo = bService.reWrieteBoardInfo(map);
		
		System.out.println(bInfo);
		
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder().setDateFormat("yy-MM-dd HH:mm");
		Gson gson = gb.create();
		try {
			gson.toJson(bInfo, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
		model.addAttribute("bInfo", bInfo);
	}
	
	@RequestMapping("reBoard.bo")
	@ResponseBody
	public String reWriteBoard(@RequestParam(value="boardNo", required=false) int boardNo,
			@RequestParam(value="usersNo", required=false) int usersNo,
			@RequestParam(value="boardTitle", required=false) String boardTitle,
			@RequestParam(value="boardContent", required=false) String boardContent,
			Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNo", boardNo);
		map.put("usersNo", usersNo);
		map.put("boardContent", boardContent);
		map.put("boardTitle", boardTitle);
		
		int result = bService.reWriteBoard(map);
		
		return result == 1 ? "success" : "fail";
	}
	
	@RequestMapping("deleteBoard.bo")
	@ResponseBody
	public String deleteBoardAndReply(HttpSession session, @RequestParam(value="boardNo", required=false) int boardNo,
			@RequestParam(value="usersNo", required=false) int usersNo,
		@RequestParam(value="reviewWriter", required=false) String reviewWriter) {
		
		int checkUsersNo = 0;
		String isAdmin = null;
		Users u = (Users)session.getAttribute("loginUser");
		if(u != null) {
			isAdmin = u.getIsAdmin();
			checkUsersNo = u.getUsersNo();
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if(isAdmin.equals('N') || usersNo == checkUsersNo) {
			map.put("boardNo", boardNo);
			map.put("usersNo", usersNo);
			map.put("reviewWriter", reviewWriter);
		}
		
		
		int result1 = bService.deleteBoard(map);
		bService.deleteReply(map);
		
		return result1 == 1 ? "success" : "fail";
	}
	
	
}
