package kh.finalproj.hollosekki.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("freeBoard.bo")
	public String freeBoard() {
		
		return "freeBoard";
	}
}
