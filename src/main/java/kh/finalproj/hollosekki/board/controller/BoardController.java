package kh.finalproj.hollosekki.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import kh.finalproj.hollosekki.board.exception.BoardException;
import kh.finalproj.hollosekki.board.model.service.BoardService;
import kh.finalproj.hollosekki.board.model.vo.Board;
import kh.finalproj.hollosekki.common.Pagination;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;
import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.vo.Review;

@Controller
public class BoardController {

	@Autowired
	private BoardService bService;
	
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
	
	@RequestMapping("selectFreeBoard.bo")
	public ModelAndView selectFreeBoard(ModelAndView mv, HttpSession session,@RequestParam("bId") int bId, @RequestParam("writer") String writer, @RequestParam("page") int page) {
		Users u = (Users)session.getAttribute("loginUser");
		String login = null;
		if(u != null) {
			login = u.getNickName();
		}
		boolean yn = false;
		if(!writer.equals(login)) {
			yn = true;
		}
		
		Board b = bService.selectBoard(bId, yn);	
		if(b != null) {
			mv.addObject("b", b);
			mv.addObject("page", page);
			mv.setViewName("detailFreeBoard");

			return mv;
		} else {
			throw new BoardException("게시글 상세보기를 실패하였습니다.");
		}
		
	}
	
	@RequestMapping("insertReply.bo")
	public void insertReply(HttpSession session, @ModelAttribute Review r,
			HttpServletResponse response) {
		Users u = (Users)session.getAttribute("loginUser");
		String reviewWriter = "";
		if(u != null) {
			reviewWriter = u.getUsersId();
		}
		
		
		response.setContentType("application/json; charset=UTF-8");
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("reviewWriter", reviewWriter); 
		map.put("r", r); 
		bService.insertReply(map);
		
		ArrayList<Review> list = bService.selectReply(map);
		System.out.println(list);
		
		Gson gson = new Gson();
		try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("freeBoardWrite.bo")
	public String freeBoardWrite() {
			
		
		
		return "freeBoardWrite";
	}
	
}
