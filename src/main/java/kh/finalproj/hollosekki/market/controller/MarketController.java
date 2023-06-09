package kh.finalproj.hollosekki.market.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import kh.finalproj.hollosekki.enroll.model.vo.Users;
import kh.finalproj.hollosekki.market.model.service.MarketService;
import kh.finalproj.hollosekki.market.model.vo.ShippingAddress;

@Controller
public class MarketController {

	@Autowired
	private MarketService mkService;

	@RequestMapping("basket.ma")
	public String pay() {
		return "basket";
	}

	@RequestMapping("payDetail.ma")
	public String payDetail(HttpSession session, Model model) {
		
		Users users = (Users)session.getAttribute("loginUser");
		ArrayList<ShippingAddress> shipAddress = mkService.selectShipping(users.getUsersNo());
		model.addAttribute("shipAddress", shipAddress);
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
//	@GetMapping("attendance_Check.ma")
//	@ResponseBody
//	public ModelAndView aDate(@RequestParam(value = "attendanceDate", required = false) String attendanceDate,
//			@RequestParam(value = "attendanceDay", required = false) String attendanceDay,
//			@RequestParam(value = "checkDay", required = false, defaultValue = "0") Integer checkDay, 
//			ModelAndView mv) {
//	    HashMap<String, String> map = new HashMap<>();
//	    map.put("attendanceDate", attendanceDate);
//	    map.put("checkDay", String.valueOf(checkDay));
//	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd");
//	    String formattedAttendanceDay = dateFormat.format(new Date());
//	    map.put("attendanceDay", formattedAttendanceDay);
//
//	    int aDateCheck = mkService.aDateCheck(map);
//    	mv.addObject("aDateCheck ", aDateCheck);
//    	mv.addObject("map ", map);
//    	
//        System.out.println(mv);
//        return mv;
//	     
//	}


//	@RequestMapping("attendance_Check.ma")
//	public String attendanceCheck(Users u, Model model) {
//	    
//        int attendanceDate = mkService.attendanceCheck(u.getAttendanceDate());
//        int checkDay = mkService.checkDay(u.getCheckDay());
//        int attendanceDay = mkService.attendanceCheck(u.getAttendanceDay());
//        model.addAttribute("attendanceDate", attendanceDate);
//        model.addAttribute("checkDay", checkDay);
//        model.addAttribute("attendanceDay", attendanceDay);
//        System.out.println(model);
//	    return "attendance_Check";
//	}
	
	
	@RequestMapping("attendance_Check.ma")
	public String attendanceCheck(
	    @RequestParam(value = "attendanceDate", required = false) String attendanceDate,
	    @RequestParam(value = "attendanceDay", required = false) String attendanceDay,
	    @RequestParam(value = "checkDay", required = false, defaultValue = "0") Integer checkDay,
	    Model model,Users u
	) {
//	    HashMap<String, String> map = new HashMap<>();
//	    map.put("attendanceDate", attendanceDate);
//	    map.put("checkDay", String.valueOf(checkDay));
//	    map.put("attendanceDay", formattedAttendanceDay);
		
//	    mv.addObject("map", map);
		
	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd");
//	    String formattedAttendanceDay = dateFormat.format(new Date());
	    int aDateCheck = mkService.aDateCheck(u.getAttendanceDate());
	    model.addAttribute("aDateCheck", aDateCheck);
	    int attendanceDateValue = mkService.attendanceCheck(u.getAttendanceDate());
	    int checkDayValue = mkService.checkDay(u.getCheckDay());
	    String ddattendanceDay = dateFormat.format(new Date());
	    int attendanceDayValue = mkService.attendanceDay(ddattendanceDay);

	    model.addAttribute("attendanceDate", attendanceDateValue);
	    model.addAttribute("checkDay", checkDayValue);
	    model.addAttribute("attendanceDay", attendanceDayValue);
	    System.out.println(model);

	    return "attendance_Check";
	}
	
	//배송지 추가 및 조회
	@RequestMapping(value="insertShipping.ma", produces="application/json; charset=UTF-8")
	public void insertShipping(@ModelAttribute ShippingAddress sa, @RequestParam("postcode") String postcode, @RequestParam("addressInfo") String addressInfo, @RequestParam("detailAddress") String detailAddress,  HttpServletResponse response) {
		
		String[] addresses = new String[3];
		addresses[0] = postcode;
		addresses[1] = addressInfo;
		addresses[2] = detailAddress;
		sa.setAddress(Arrays.toString(addresses));
		
		System.out.println("ssss : " + sa);
		int result = mkService.insertShipping(sa);
		ArrayList<ShippingAddress> shipAddress = mkService.selectShipping(sa.getUsersNo());
		
		response.setContentType("application/json; charset=UTF-8");
        GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy-MM-dd"); 
        Gson gson = gb.create();
		try {
            gson.toJson(shipAddress, response.getWriter()); 
         } catch (JsonIOException | IOException e) {
            e.printStackTrace();
         }
	}
	
	


}