package kh.finalproj.hollosekki.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("freeBoard.bo")
	public String freeBoard() {
		
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
