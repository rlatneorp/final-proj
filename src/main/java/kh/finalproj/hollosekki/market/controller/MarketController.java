package kh.finalproj.hollosekki.market.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.google.gson.JsonObject;

import kh.finalproj.hollosekki.market.model.service.MarketService;
import kh.finalproj.hollosekki.member.model.vo.Users;

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
	
	@RequestMapping("attendance_Check.ma")
	public String attendance_Check(@ModelAttribute Users u, HttpServletResponse response, Model model) {
	    LocalDate today = LocalDate.now();
	    LocalDate attendanceDate = null;
	    if (u != null && u.getAttendanceDate() != null) {
	        attendanceDate = u.getAttendanceDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
	        int attendanceDateInt = attendanceDate.getYear() * 10000 + attendanceDate.getMonthValue() * 100 + attendanceDate.getDayOfMonth();
	        if (attendanceDate.isEqual(today)) {
	            int checkDay = u.getCheckDay();
	            int attendanceCheckResult = mkService.attendanceCheck(attendanceDateInt);
	            int checkDayResult = mkService.checkDay(checkDay);
	            
	            Gson gson = new Gson();
	            JsonObject resultJson = new JsonObject();
	            resultJson.addProperty("attendanceCheckResult", attendanceCheckResult);
	            resultJson.addProperty("checkDayResult", checkDayResult);
	            
	            try {
	                response.setContentType("application/json");
	                response.setCharacterEncoding("UTF-8");
	                response.getWriter().write(gson.toJson(resultJson));
	            } catch (JsonIOException | IOException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	    return "attendance_Check";
	}
} 

	    
