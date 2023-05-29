package kh.finalproj.hollosekki.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
	@GetMapping("adminMain.ad")
	public String adminMain() {
		
		return "adminMain";
	}
	
}
