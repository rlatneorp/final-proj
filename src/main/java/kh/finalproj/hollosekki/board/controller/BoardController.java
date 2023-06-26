package kh.finalproj.hollosekki.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.finalproj.hollosekki.board.model.service.BoardService;
import kh.finalproj.hollosekki.board.model.vo.Board;
import kh.finalproj.hollosekki.common.Pagination;
import kh.finalproj.hollosekki.common.model.vo.PageInfo;

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
		model.addAttribute("list", list);
		
		return "freeBoard";
	}
	
	@RequestMapping("freeBoardWrite.bo")
	public String freeBoardWrite() {
			
		
		
		return "freeBoardWrite";
	}
	
	@RequestMapping("selectFreeBoard.bo")
	public String selectFreeBoard() {
		
		return "detailFreeBoard";
	}
}
