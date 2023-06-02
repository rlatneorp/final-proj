package kh.finalproj.hollosekki.customer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerCenter {
	
	@RequestMapping("askBoard.cs")
	public String askBoard() {
		return "askBoard";
		
	}
	
	@RequestMapping("personalQuestion.cs")
	public String personalQuestion() {
		return "personalQuestion";
	}
	
	
}
