package kh.finalproj.hollosekki.market.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.service.MarketService;
import kh.finalproj.hollosekki.market.model.vo.Cart;

@Controller
public class MarketController {

	@Autowired
	private MarketService mkService;

	@RequestMapping("basket.ma")
	public String pay() {
		return "basket";
	}

	@RequestMapping("payDetail.ma")
	public String payDetail() {
		return "payDetail";
	}

	@GetMapping("market_detail.ma")
	public String marketdetail() {
		return "market_detail";
	}
	
	@GetMapping("createqna.ma")
	public String createqna() {
		return "createQnA";
	}
	
	@GetMapping("createReview.ma")
	public String createReview() {
		return "createReview";
	}
	
	@GetMapping("kitchenToolMain.ma")
	public String kitchenToolMain() {
		
		return "kitchenToolMainPage";
	}
	
	@RequestMapping("paySuccess.ma")
	public String paySuccess() {
		return "paySuccess";
	}
	
	@RequestMapping("attendance_Check.ma")
	public String attendanceCheck(HttpSession session, Model model) {
	    
		Users u = (Users)session.getAttribute("loginUser");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("attendanceDate", u.getAttendanceDate());
		map.put("attendanceDay", u.getAttendanceDay());
		map.put("uId", u.getUsersId());
		
	    mkService.attendanceCheck(map);
	    mkService.attendanceDay(map);
	    mkService.firstAdDay(map);
	    int checkDay = mkService.checkDay(map);
	    
    	model.addAttribute("checkDay", checkDay);
    	return "attendance_Check";
	    
	}

	@ResponseBody
	@PostMapping("insertCart.ma")
	public int insertCart(@ModelAttribute Cart c) {
	
		int result = mkService.insertCart(c);
		return result;
	}
}