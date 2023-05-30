package kh.finalproj.hollosekki.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MarketController {
	
	@RequestMapping("market.mk")
	public String pay() {
		
		return "pay";
	}
	
	
	
}
