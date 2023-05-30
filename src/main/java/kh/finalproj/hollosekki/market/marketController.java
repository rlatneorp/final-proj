package kh.finalproj.hollosekki.market;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class marketController {

	@GetMapping("market_detail.ma")
	public String marketdetail() {
		
		return "market_detail";
	}
	
}
