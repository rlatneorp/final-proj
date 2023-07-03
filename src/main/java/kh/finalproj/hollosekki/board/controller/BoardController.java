package kh.finalproj.hollosekki.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("freeBoard.bo")
	public String freeBoard(@RequestParam(value="page",required=false) Integer currentPage, Model model, @ModelAttribute Board b) {
		if(currentPage == null) {
			currentPage = 1;
		}
		int listCount = bService.getFreeBoardListCount(0);
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
		
		ArrayList<Board> list = bService.freeBoardView(b, pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "freeBoard";
	}
	
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
			throw new BoardException("�Խñ� ��ȸ�� �����Ͽ����ϴ�.");
		}
		
	}
	
	@RequestMapping("insertReply.bo")
	public void insertReply(HttpServletResponse response, @ModelAttribute Board b) {
		
		bService.insertReply(b);
		ArrayList<Board> rlist = bService.selectReply(b.getProductNo());
		
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm");
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
	public String reReply(@ModelAttribute Board b) {
		
		int result = bService.reReply(b);
		System.out.println(b);
		return result == 1 ? "success" : "fail";
	}
	
	
	@RequestMapping("freeBoardWrite.bo")
	public String freeBoardWrite() {
			
		
		
		return "freeBoardWrite";
	}
	
}
