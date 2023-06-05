package kh.finalproj.hollosekki.market.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.finalproj.hollosekki.market.model.service.MarketService;
import kh.finalproj.hollosekki.users.model.vo.Users;

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
	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd");
//	    String formattedAttendanceDay = dateFormat.format(new Date());
//	    map.put("attendanceDay", formattedAttendanceDay);

//	    mv.addObject("map", map);
	     
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


}